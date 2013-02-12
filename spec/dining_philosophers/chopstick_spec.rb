require 'spec_helper'

describe Chopstick do
  describe '#take' do
    it 'locks the mutex' do
      expect(subject.take.locked?).to be_true
    end
  end

  describe '#drop' do
    before { subject.take }

    it 'unlocks the mutex' do
      expect(subject.drop.locked?).to be_false
    end
  end

  describe '#in_use?' do
    context 'when mutex in unlocked' do
      it 'returns false' do
        expect(subject.in_use?).to be_false
      end
    end

    context 'when mutex in locked' do
      before { subject.take }

      it 'returns true' do
        expect(subject.in_use?).to be_true
      end
    end
  end
end
