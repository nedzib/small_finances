module ApplicationHelper
  def active_group
    current_user.groups.active.last
  end
end
