require 'rails_helper'

describe Restaurant, type: :model do

  it { is_expected.to have_many(:reviews).dependent(:destroy) }

  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    user = User.create(email: 'email@email.com', password: 'password')
    Restaurant.create(name: "Moe's Tavern", user_id: user.id)
    restaurant = Restaurant.new(name: "Moe's Tavern", user_id: user.id)
    expect(restaurant).to have(1).error_on(:name)
  end

  it "it can edit a restaurant" do
   user = User.create(email: 'email@email.com', password: 'password')
   Restaurant.create(name: "Moe's Tavern", user_id: user.id)
   restaurant = Restaurant.find_by(name: "Moe's Tavern")
   restaurant.update(name: "Joe's Tavern")
   expect(restaurant.name).to eq("Joe's Tavern")
 end

 it "it can delete a restaurant" do
   user = User.create(email: 'email@email.com', password: 'password')
   Restaurant.create(name: "Moe's Tavern", user_id: user.id)
   restaurant = Restaurant.find_by(name: "Moe's Tavern")
   restaurant.destroy
   expect(restaurant.destroyed?).to be true
 end

 it "responds to the build review method" do
   user = User.create(email: "test@test.com", password: "testtest")
   restaurant = Restaurant.create(name: "Moe's Tavern", user_id: user.id)
   expect(restaurant).to respond_to(:build_review).with(2).arguments
 end
end

describe 'reviews' do
  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com' }
    let(:restaurant) { Restaurant.create name: 'Test' }
    let(:review_params) { {rating: 5, thoughts: 'yum'} }

    subject(:review) { restaurant.reviews.build_with_user(review_params, user) }

    it 'builds a review' do
      expect(review).to be_a Review
    end

    it 'builds a review associated with the specified user' do
      expect(review.user).to eq user
    end
  end

  describe '#average_rating' do
    context 'no reviews' do
      it 'returns "N/A" when there are no reviews' do
        restaurant = Restaurant.create(name: 'The Ivy')
        expect(restaurant.average_rating).to eq 'N/A'
      end
    end

    context '1 review' do
      it 'returns that rating' do
        user = User.create(email: 'email@email.com', password: 'password')
        restaurant = Restaurant.create(name: 'The Ivy', user_id: user.id)
        restaurant.reviews.create(rating: 4, user_id: user.id)
        expect(restaurant.average_rating).to eq 4
      end
    end

    context 'multiple reviews' do
      it 'returns the average' do
        user = User.create(email: 'email@email.com', password: 'password')
        user2 = User.create(email: 'email2@email.com', password: 'password')
        restaurant = Restaurant.create(name: 'The Ivy', user_id: user.id)
        restaurant.reviews.create(rating: 1, user_id: user.id)
        restaurant.reviews.create(rating: 5, user_id: user2.id)
        expect(restaurant.average_rating).to eq 3
      end
    end

  end
end
