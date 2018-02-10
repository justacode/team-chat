class UserDecorator < Draper::Decorator
  delegate :first_name, :last_name

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def is_online?
    puts object.list.include? full_name
    object.list.include? full_name
  end

  def registrated_at
    object.created_at.strftime('%m/%d/%y')
  end
end
