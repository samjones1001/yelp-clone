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
end
