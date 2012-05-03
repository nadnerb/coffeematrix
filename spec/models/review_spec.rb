require 'spec_helper'

describe Review do

  context 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe '#publish' do

    subject do
      Review.new.tap do |r|
        r.caffein_dealer = caffein_dealer
      end
    end

    context 'valid review' do

      before do
        subject.stub!(:valid?).and_return(true)
      end

      context 'published date' do

        let(:caffein_dealer) { mock(CaffeinDealer).as_null_object }

        let(:clock) { mock('clock') }

        let(:now) { 'some time' }

        before do
          clock.should_receive(:now).and_return(now)
          subject.publish(clock)
        end

        it 'should be updated to current time' do
          subject.published_date.should == now
        end

      end

      context 'caffein dealer' do

        let(:caffein_dealer) { mock(CaffeinDealer) }

        before do
          caffein_dealer.should_receive(:add_entry).with(subject)
        end

        it 'should have this review as an entry' do
          subject.publish
        end
      end

    end

    context 'invalid review' do

      let(:caffein_dealer) { mock(CaffeinDealer).as_null_object }

      it 'should return false' do
        subject.publish.should == false
      end

      context 'published date' do

        before do
          subject.publish
        end

        it 'should not update published date' do
          subject.published_date.should == nil
        end
      end

      context 'caffein dealer' do

        let(:caffein_dealer) { mock(CaffeinDealer) }

        it 'should not have this review as an entry' do
          subject.publish
        end
      end

    end

  end

end
