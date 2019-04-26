class Task < ApplicationRecord
  belongs_to :user

  enum status: [:created, :running, :paused, :completed]

  def running!
    times.push(Time.now)
    super
  end

  def paused!
    times.push(Time.now)
    super
  end

  def completed!
    times.push(Time.now) if times.length.odd?
    super
  end

  def total_time
    if times.length.even?
      return (-1...times.length).step(2).inject {|time, idx| time + times[idx].to_i - times[idx-1].to_i}
    elsif times.length == 1
      return Time.now.to_i - times.last.to_i
    else
      time = (-1...times.length).step(2).inject {|time, idx| time + times[idx].to_i - times[idx-1].to_i}
      return time + Time.now.to_i - times.last.to_i
    end
  end
end
