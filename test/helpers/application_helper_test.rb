require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full_title helper" do
    assert_equal full_title, "Ruby on Rails Meme App"
    assert_equal full_title("Help"), "Help | Ruby on Rails Meme App"
  end
end
