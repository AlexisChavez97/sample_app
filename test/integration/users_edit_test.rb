require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:bad_user)
  end

  # test 'unsuccesful edit' do
  #   log_in_as(@user)
  #   get edit_user_path(@user)
  #   assert_template 'users/edit'
  #   patch user_path(@user), params: { user: { name: '',
  #                                             email: 'in@valid',
  #                                             password: 'gambo',
  #                                             password_confirmation: 'ringo' } }
  #   # assert_template 'users/edit'
  # end

  # test 'succesful edit with friendly forwarding' do
  #   get edit_user_path(@user)
  #   log_in_as(@user)
  #   # assert_template 'users/edit'
  #   name = 'John Cena'
  #   email = 'ucant@seeme.com'
  #   patch user_path(@user), params: { user: { name: name,
  #                                             email: email,
  #                                             password: '',
  #                                             password_confirmation: '' } }
  #   # assert_not flash.empty?
  #   assert_redirected_to @user
  #   @user.reload
  #   assert_equal name, @user.name
  #   assert_equal email, @user.email
  # end
end
