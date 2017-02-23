require 'rails_helper'

describe User do
  it { is_expected.to have_many(:restaurants).dependent(:destroy) }

  it { is_expected.to have_many(:reviews).dependent(:destroy) }

  it { is_expected.to have_many :reviewed_restaurants}
end
