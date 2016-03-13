module ApplicationHelper
  def user_owner(item)
    current_user == item.user
  end
end
