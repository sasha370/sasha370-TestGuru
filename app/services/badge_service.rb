class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = User.find @test_passage.user_id
    @level = @test_passage.test.level
    @category = @test_passage.test.category.title
    check_all_badge
  end

  def check_all_badge
    Badge.all.each do |badge|
      @user.badges.push(badge) if self.send("#{badge.rule_name}_check" )
    end
  end

  def by_category_check
    @tests_with_current_category = Test.tests_by_category(@category).count
    @user_passed_test = @user.tests.tests_by_category(@category).passed.distinct.count
    @user_passed_test == @tests_with_current_category
  end

  def by_level_check
    @tests_with_current_level = Test.tests_by_level(@level).count
    @user_passed_test = @user.tests.tests_by_level(@level).passed.distinct.count
    @user_passed_test == @tests_with_current_level
  end

  def by_attempt_number_check
    false
  end

  def by_lose_category_check
    false
  end
end
