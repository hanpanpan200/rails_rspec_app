require 'minitest/autorun'
require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "is valid with firstname, lastname, email and 3 phones" do
    contact=Contact.new(firstname:'Tim',lastname:'Macor',email:'tim@gmail.com')
    expect(contact).to  be_valid
  end
  it "is invalid without firstname" do
    contact=Contact.new(firstname:nil)
  end

  it "is invalid without lastname"
  it "is invalid without email"
  it "is invalid with duplicate email address"
  it "returns a cotact's full name as a string"
end
