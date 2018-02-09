class Message < ApplicationRecord
  belongs_to :user
  
  def archieve
    self.update(archieved: true)
  end

  def restore
    self.update(archieved: false)
  end
end
