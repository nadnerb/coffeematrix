require "spec_helper"

feature %q{
  When adding a review to a caffein dealer
  As a coffee matrix reviewer
  I would like to see reviews in order by rank
} do

  background do
    @caffein_dealer = CaffeinDealer.create(:name => 'nottooshabby cafe')
    @caffein_dealer.add_entry(existing_review('1st Review', 1))
    @caffein_dealer.add_entry(existing_review('2nd Review', 3))
    @caffein_dealer.add_entry(existing_review('3rd Review', 2))
  end

  scenario 'when I view reviews, they are ordered best to worst' do
    visit root_path

    ordered_entry_content(1, '2nd Review')
    ordered_entry_content(2, '3rd Review')
    ordered_entry_content(3, '1st Review')
  end

  #fabricator
  def existing_review(title, rating)
    Review.new(:title => title, :consistency => 1, :price => rating, :speed => 1)
  end

  def ordered_entry_content(order, content)
    within("entry:nth(#{order})") do
      page.should have_content(content)
    end
  end

end
