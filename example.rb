require_relative 'lib/dining_philosophers'

names = %w{Heraclitus Aristotle Epictetus Schopenhauer Popper}

philosophers = names.map { |name| Philosopher.new(name) }

waiter = Waiter.new
table = Table.new(philosophers.size)

philosophers.each_with_index do |philosopher, i|
  philosopher.async.dine(table, i, waiter)
end

sleep
