require 'minitest/autorun'
require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe Contact do
    it "create valid contact from factory" do
      expect(build(:contact)).to be_valid
    end
  end

  it "is invalid without firstname" do
    contact=build(:contact,firstname:nil)
    contact.save
    expect(contact.errors).to have_key(:firstname)
  end
  it "is invalid without lastname" do
    contact=build(:contact,lastname:nil)
    contact.save
    expect(contact.errors).to have_key(:lastname)
  end
  it "is invalid without email" do
    contact=build(:contact,email:nil)
    contact.save
    expect(contact.errors).to have_key(:email)
  end
  it "is invalid with duplicate email address" do
    create(:contact,email:"1@example.com")
    contact=build(:contact,email:"1@example.com")
    contact.save
    expect(contact.errors).to have_key(:email)
  end
  it "returns a cotact's full name as a string" do
    contact=build(:contact,firstname:"Tim",lastname:"Macro")
    contact.save
    expect(contact.name).to eq 'Tim Macro'
  end

  describe 'filter letter by lastname' do
    before :each do
      @smith=create(:contact,firstname: 'Smith', lastname: 'Jone', email: 'jone@example.com')
      @jack=create(:contact,firstname: 'Jack', lastname: 'Tim', email: 'tim@example.com')
      @jason=create(:contact,firstname: 'Sam', lastname: 'Jason', email: 'jason@example.com')
    end
    context 'matching letter' do
      it 'returns a sorted array of result that match' do
        expect(Contact.by_letter 'J').to eq [@jason, @smith]
      end
    end
    context 'not matching letter' do
      it 'returns a sorted array of results that not match' do
        expect(Contact.by_letter('J')).to_not include @jack
      end
    end
  end

  it "has three phone numbers" do
    expect(create(:contact).phones.count).to eq 3
  end

end
