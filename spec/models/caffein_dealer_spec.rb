require 'spec_helper'
require 'ostruct'

describe CaffeinDealer do

  describe '#entries' do

    it 'should have entries' do
      subject.entries.should_not be_nil
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
end

