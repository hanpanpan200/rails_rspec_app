require 'minitest/autorun'
require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "is valid with firstname, lastname, email and 3 phones" do
    contact=Contact.new(firstname:'Tim',lastname:'Macor',email:'tim@gmail.com')
    expect(contact).to  be_valid
  end
  it "is invalid without firstname" do
    contact=Contact.create(firstname:nil)
    expect(contact.errors).to have_key(:firstname)
  end
  it "is invalid without lastname" do
    contact=Contact.create(lastname:nil)
    expect(contact.errors).to have_key(:lastname)
  end
  it "is invalid without email" do
    contact=Contact.create(email:nil)
    expect(contact.errors).to have_key(:email)
  end
  it "is invalid with duplicate email address" do

  end
  it "returns a cotact's full name as a string" do
    contact=Contact.new(firstname:'Tim',lastname:'Macro',email:'123@gmail.com')
    expect(contact.name).to eq 'Tim Macro'
  end
end
