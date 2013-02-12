require 'spec_helper'

describe Waiter do
  before do
    @table = mock(Table)
    @philosopher = mock(Philosopher)
  end

  describe '#request_to_eat' do
    it 'makes philosopher eat' do
      @philosopher.should_receive(:async).and_return(@philosopher)
      @philosopher.should_receive(:eat)

      subject.request_to_eat(@philosopher)
    end
  end
end
