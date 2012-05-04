require 'spec_helper'

describe Rank do

  describe '#<=>' do

    let(:result) do
      rank_1 <=> rank_2
    end

    context 'equal' do

      let(:rank_1) { Rank.new(one: 1, two: 2, three: 3) }
      let(:rank_2) { Rank.new(one: 3, two: 2, three: 1) }

      it 'should return zero' do
        result.should == 0
      end
    end

    context 'first rank is higher' do

      let(:rank_1) { Rank.new(one: 3, two: 2, three: 3) }
      let(:rank_2) { Rank.new(one: 3, two: 2, three: 1) }

      it 'should return 1' do
        result.should == 1
      end
    end

    context 'second rank is lower' do

      let(:rank_1) { Rank.new(one: 3, two: 2, three: 3) }
      let(:rank_2) { Rank.new(one: 4, two: 4, three: 1) }

      it 'should return -1' do
        result.should == -1
      end
    end
  end
end
