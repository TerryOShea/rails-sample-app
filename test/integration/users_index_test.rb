require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:wanda)
    @nonadmin = users(:gerald)
  end
  
  test "index includes pagination, no deletion" do 
    log_in_as(@nonadmin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination', count: 2
    assert_select 'a', text: 'delete', count: 0
    User.paginate(page: 1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      assert user.activated == true
    end
  end
  
  test "index includes pagination and deletion for admin" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination', count: 2
    first_page = User.paginate(page: 1)
    first_page.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@nonadmin)
    end
  end
end