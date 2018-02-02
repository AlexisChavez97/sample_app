require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:alexis)
  end

#   test 'posts interface' do
#     log_in_as(@user)
#     get root_path
#     assert_no_difference 'Post.count' do
#       post posts_path, params: { post: { content: ' ' } }
#     end
#     assert_select 'div#error_explanation'
#     content = 'This post really ties the room together'
#     assert_difference 'Post.count', 1 do
#       post posts_path, params: { post: { content: 'content' } }
#     end
#     assert_redirected_to root_url
#     follow_redirect!
#     assert_match content, response.body
#     first_post = @user.posts.paginate(page: 1).first
#     assert_difference 'Post.count', -1 do
#       delete post_path(first_post)
#     end
#     get user_path(users(:bad_user))
#     assert_select 'a', text: 'delete', count: 0
#   end
end
