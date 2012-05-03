require 'spec_helper'

describe Review do

  describe '#publish' do

    subject do
      Review.new.tap do |r|
        r.caffein_dealer = caffein_dealer
      end
    end

    context 'published date' do

      let(:caffein_dealer) { mock(CaffeinDealer).as_null_object }

      let(:clock) { mock('clock') }

      let(:now) { 'some time' }

      before do
        clock.should_receive(:now).and_return(now)
        subject.publish(clock)
      end

      it 'should update published date to time' do
        subject.published_date.should == now
      end

    end

    context 'caffein dealer' do

      let(:caffein_dealer) { mock(CaffeinDealer) }

      before do
        caffein_dealer.should_receive(:add_entry).with(subject)
      end

      it 'should add review to dealer' do
        subject.publish
      end
    end

  end

end
