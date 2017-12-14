class MessageDecorator < ApplicationDecorator
  delegate :user, :content, :id

  def from_current_user?
    object.user == h.current_user
  end

  def posted_at
    object.created_at.strftime('%m/%d/%y at %H:%M')
  end
end
