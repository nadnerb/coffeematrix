require "spec_helper"

feature %q{
  When adding a review to a caffein dealer
  As a coffee matrix reviewer
  I would like to see reviews in order by rank
} do

  background do
    @caffein_dealer = CAFFEIN_DEALER
    #@caffein_dealer.add_entry(existing_review('1st', 1))
    #@caffein_dealer.add_entry(existing_review('2nd', 3))
  end

  scenario 'when I add a review', :js => true do
    visit root_path
    click_link('write review')

    fill_in('review_title', :with => '3rd')
    select('1', :from => 'review_consistency')
    select('2', :from => 'review_price')
    select('1', :from => 'review_speed')

    click_button('Create Review')

    # assert order 2, 3, 1
  end

  def existing_review(title, rating)
    Review.new(:title => title, :consistency => 1, :price => rating, :speed => 1)
  end

end
