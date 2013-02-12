require 'spec_helper'

describe Table do
  subject { Table.new 5 }

  it 'requires a seat number' do
    expect { Table.new }.to raise_error(ArgumentError)
    expect { subject }.to_not raise_error(ArgumentError)
  end

  describe '#left_chopstick_at' do
    it 'returns the chopstick on the left of a specified position' do
      expect(subject.left_chopstick_at 5).to be_kind_of(Chopstick)
      expect(subject.left_chopstick_at 5).to equal(subject.instance_variable_get(:@chopsticks)[4])
      expect(subject.left_chopstick_at 6).to equal(subject.instance_variable_get(:@chopsticks)[0])
    end
  end

  describe '#right_chopstick_at' do
    it 'returns the chopstick on the right of a specified position' do
      expect(subject.right_chopstick_at 5).to be_kind_of(Chopstick)
      expect(subject.right_chopstick_at 5).to equal(subject.instance_variable_get(:@chopsticks)[1])
      expect(subject.right_chopstick_at 6).to equal(subject.instance_variable_get(:@chopsticks)[2])
    end
  end

  describe '#chopsticks_in_use' do
    it 'returns the number of chopsticks that is not available' do
      expect(subject.chopsticks_in_use).to be_zero
    end
  end
end
