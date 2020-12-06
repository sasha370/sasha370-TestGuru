class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = User.find @test_passage.user_id
    check_all_badge
  end

  private

  def check_all_badge
    Badge.all.each do |badge|
      add_badge(badge) if self.send("#{badge.rule_name}_check", badge)
    end
  end

  def add_badge(badge)
    @user.badges.push(badge)
    @test_passage.badges.push(badge)
  end

  def by_category_check(badge)
    category = badge.rule_params
    if category == @test_passage.test.category.title
      tests_ids = Test.tests_by_category(category).pluck(:id)
      return check_for_matches(badge, tests_ids)
    end
  end

  def by_level_check(badge)
    level = badge.rule_params.to_i
    if level == @test_passage.test.level
      tests_ids = Test.tests_by_level(level).pluck(:id)
      return check_for_matches(badge,tests_ids)
    end
  end

  def by_attempt_number_check(badge)
    attempt = badge.rule_params.to_i
    all_attempt = TestPassage.where(user_id: @user, test_id: @test_passage.test_id).count
    all_attempt == attempt && @test_passage.passed
  end

  def by_passed_test_count_check(badge)
    tests_count = TestPassage.where(user_id: @user, passed: true).count
    tests_count == badge.rule_params.to_i
  end

  def check_for_matches(badge, tests_ids )
    user_tests_count = TestPassage.where(user_id: @user, test_id: tests_ids, passed: true).
        distinct.pluck(:test_id).count
     true if user_tests_count == tests_ids.count && !badge_has_been_received?(badge, tests_ids)
  end

  def badge_has_been_received?(badge, tests_ids)
    badge.test_passages.where(test_id: tests_ids).any?
  end
end
