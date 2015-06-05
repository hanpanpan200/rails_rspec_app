require 'minitest/autorun'
require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "is valid with firstname, lastname and email"
  it "is invalid without firstname"
  it "is invalid without lastname"
  it "is invalid without email"
  it "is invalid with duplicate email address"
  it "returns a cotact's full name as a string"
end
