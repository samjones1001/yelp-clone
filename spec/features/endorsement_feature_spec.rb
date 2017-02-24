require 'rails_helper'

feature 'endorsing reviews' do
  before do
    user = User.create(email: 'test@email.com', password: ' password')
    kfc = Restaurant.create(name: 'KFC', user_id: user.id)
    kfc.reviews.create(rating: 3, thoughts: 'It was an abomination', user_id: user.id)
  end

  scenario 'a review has no endorments' do
    visit '/restaurants'
    expect(page).to have_content('0 endorsements')
  end

  scenario 'a review has one endorsement' do
    user = User.create(email: 'test1@email.com', password: ' password')
    ph = Restaurant.create(name: 'Pizza Hut', user_id: user.id)
    review = ph.reviews.create(rating: 3, thoughts: 'It was an abomination', user_id: user.id)
    review.endorsements.create
    visit '/restaurants'
    expect(page).to have_content('1 endorsement')
  end

  scenario 'a user can endorse a review, which updates the review endorsement count', js: true do
    visit '/restaurants'
    click_link 'Endorse' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 endorsement')
  end

end
