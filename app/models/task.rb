class Task < ApplicationRecord
  belongs_to :user
  belongs_to :supertask, class_name: "Task", foreign_key: "task_id", optional: true
  has_many :subtasks, class_name: "Task"

  enum status: [:created, :running, :paused, :completed]
  before_save :check_status
  after_create :calculate_position

  def check_status
    return unless status_changed?

    case status_change[1]
      when 'running'
        times.push(Time.now)
      when 'paused'
        times.push(Time.now)
      when 'completed'
        times.push(Time.now) if times.length.odd?
    end
  end

  def total_time
    if times.count == 0
      return 0
    elsif times.length.even?
      return (-1...times.length).step(2).inject {|time, idx| time + times[idx].to_i - times[idx-1].to_i}
    elsif times.length == 1
      return Time.now.to_i - times.last.to_i
    else
      time = (-1...times.length).step(2).inject {|time, idx| time + times[idx].to_i - times[idx-1].to_i}
      return time + Time.now.to_i - times.last.to_i
    end
  end

  def self.update_order(user, day, tasks)
    tasks.map.with_index do |task, idx| 
      t = user.tasks.find_by(id: task[:id])
      t.update(position: idx)
      t
    end
  end

  def calculate_position
    i_position = user.tasks.where(day: day).count
    update(position: i_position)
  end
end
