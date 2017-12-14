class UserDecorator < Draper::Decorator
  delegate :first_name, :last_name

  def full_name
    "#{obj.first_name} #{obj.last_name}"
  end

  def registrated_at
    object.created_at.strftime('%m/%d/%y')
  end
end
