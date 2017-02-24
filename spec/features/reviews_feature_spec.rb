require 'rails_helper'

feature 'reviewing' do
  before do
    user = User.create(email: 'email@email.com', password: 'password')
    user2 = User.create(email: 'email2@email.com', password: 'password')
    Restaurant.create(name: 'KFC', user_id: user.id)
  end

  scenario 'allows user to leave a review' do
    visit '/'
    click_link('Sign in')
    fill_in('Email', with: 'email@email.com')
    fill_in('Password', with: 'password')
    click_button("Log in")
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'displays an average rating for all reviews' do
    visit '/'
    click_link('Sign in')
    fill_in('Email', with: 'email@email.com')
    fill_in('Password', with: 'password')
    click_button("Log in")
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'pretty grim'
    select 1, from: 'Rating'
    click_button 'Leave Review'
    click_link 'Sign out'
    click_link('Sign in')
    fill_in('Email', with: 'email2@email.com')
    fill_in('Password', with: 'password')
    click_button("Log in")
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'tolerable'
    select 3, from: 'Rating'
    click_button 'Leave Review'

  expect(page).to have_content('Average rating: ★★☆☆☆')
  end

end

def leave_review(thoughts, rating)
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end
