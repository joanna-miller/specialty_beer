require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).on(:create).case_insensitive }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }

end