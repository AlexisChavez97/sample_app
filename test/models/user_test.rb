require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Alexis', email: 'alexis@michelada.io',
                     password: 'cacahuate', password_confirmation: 'cacahuate')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ' '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = ('a' * 51)
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.name = ('a' * 244 + 'example.com')
    assert_not @user.valid?
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid? "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email addresses should be saved as lower-case' do
    mixed_case_email = 'AlExIS@miCHElaDa.COM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test 'password should be present (non-blank)' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test 'authenticated? should return false for a user with nil digest' do
    assert_not @user.authenticated?('')
  end

  test 'associated posts should be destroyed' do
    @user.save
    @user.posts.create!(content: 'Lorem ipsum')
    assert_difference 'Post.count', -1 do
      @user.destroy
    end
  end

  test 'should follow and unfollow a user' do
    alexis = users(:alexis)
    jhony = users(:bad_user)
    assert_not alexis.following?(jhony)
    alexis.follow(jhony)
    assert alexis.following?(jhony)
    assert jhony.followers.include?(alexis)
    alexis.unfollow(jhony)
    assert_not alexis.following?(jhony)
  end

  test 'feed should have the right posts' do
    alexis = users(:alexis)
    juan = users(:bad_user)
    lana = users(:lana)
    # Posts from followed user
    lana.posts.each do |post_following|
      assert alexis.feed.include?(post_following)
    end
    # Posts from self
    alexis.posts.each do |post_following|
      assert alexis.feed.include?(post_following)
    end
    # Posts from unfollowed user
    juan.posts.each do |post_unfollowed|
      assert_not alexis.feed.include?(post_unfollowed)
    end
  end
end
