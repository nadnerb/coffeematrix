require 'spec_helper'
require 'ostruct'

describe CaffeinDealer do

  describe '#entries' do

    it 'should have entries' do
      subject.entries.should_not be_nil
    end

    context 'order entries by rank' do

      let(:review_1) { Review.new }
      let(:review_2) { Review.new }
      let(:review_3) { Review.new }

      subject do
        review_1.should_receive(:rank).and_return(1)
        review_2.should_receive(:rank).and_return(3)
        review_3.should_receive(:rank).and_return(2)
        CaffeinDealer.new([review_1, review_2, review_3])
      end

      it 'should order reviews by rank' do
        subject.entries.should == [review_2, review_3, review_1]
      end

    end

  end

  describe '#new_review' do

    let(:review) { OpenStruct.new(title: 'mmm coffee') }

    before do
      subject.review = ->{ review }
    end

    it 'should return a new review' do
      subject.new_review.should == review
    end

    it 'review should contain dealer' do
      subject.new_review.caffein_dealer.should == subject
    end

  end

  describe '#add_entry' do

    let(:entry) { Review.new }

    before do
      subject.add_entry(entry)
    end

    it 'should add new entry to entries' do
      subject.entries.should include(entry)
    end
  end

end

