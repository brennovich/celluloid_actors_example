class Table
  def initialize(seats_number)
    @chopsticks = seats_number.times.map { Chopstick.new }
  end

  def left_chopstick_at(position)
    @chopsticks[(position - 1) % @chopsticks.size]
  end

  def right_chopstick_at(position)
    @chopsticks[(position + 1) % @chopsticks.size]
  end

  def chopsticks_in_use
    @chopsticks.select { |c| c.in_use? }.size
  end
end
