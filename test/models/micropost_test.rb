require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:wanda)
    @micropost = @user.microposts.build(content: "Wanda's first micropost")
  end
  
  test "should be valid" do
    assert @micropost.valid?
  end
  
  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  
  test "content should be present" do
    @micropost.content = ""
    assert_not @micropost.valid?
  end
  
  test "content should not be too long (more than 140 characters)" do
    @micropost.content = "What happens to a dream deferred? Does it dry up like a raisin in the sun? Or fester like a sore--and then run? Does it stink like rotten meat?"
    assert_not @micropost.valid?
  end
  
  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
