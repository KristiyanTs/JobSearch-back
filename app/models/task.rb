class Task < ApplicationRecord
  belongs_to :user

  def self.create_recurrent(user)
    tasks = user.tasks.where(recurrent: true, day: Date.today - 1)
    tasks.update_all(recurrent: false)
    
    cloned_tasks = tasks.dup
    cloned_tasks.update_all(day: Date.today, recurrent: true)
  end
end
