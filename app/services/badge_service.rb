class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = User.find @test_passage.user_id
    check_all_badge
  end

  # private

  def check_all_badge
    Badge.all.each do |badge|
      add_badge(badge) if self.send("#{badge.rule_name}_check", badge.rule_params)
    end
  end

  def add_badge(badge)
    @user.badges.push(badge)
    @test_passage.badges.push(badge)
  end

  def by_category_check(category)
    if category == @test_passage.test.category.title
      tests_ids = Test.tests_by_category(category).pluck(:id)
       check_for_matches(tests_ids)
    end
  end

  def by_level_check(level)
    if level.to_i == @test_passage.test.level
      tests_ids = Test.tests_by_level(level).pluck(:id)
      check_for_matches(tests_ids)
    end
  end

  def by_attempt_number_check(attempt)
    all_attempt.count == attempt.to_i && @test_passage.passed
  end

  def by_passed_test_count_check(passed_test_count)
    tests_count = TestPassage.where(user_id: @user,  passed: true).count
    tests_count == passed_test_count.to_i
  end

  def all_attempt
    TestPassage.where(user_id: @user, test_id: @test_passage.test_id)
  end

  def check_for_matches(tests_ids)
    user_tests = TestPassage.where(user_id: @user, test_id: tests_ids, passed: true).
        distinct.pluck(:test_id).count
    user_tests == tests_ids.count
  end
end
