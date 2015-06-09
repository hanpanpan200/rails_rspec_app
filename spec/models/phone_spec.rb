require 'rails_helper'

RSpec.describe Phone, type: :model do
  describe Phone do
    it "does not allow duplicate phone numbers for one contact" do
      contact=create(:contact)
      create(:home_phone,contact:contact,phone:"787-555-1234")
      mobile_phone=build(:mobile_phone,contact:contact,phone:"787-555-1234")
      mobile_phone.save
      expect(mobile_phone.errors).to have_key(:phone)
    end
    it "allow two contacts have same number" do
      create(:home_phone,phone:'123-555-456')
      expect(build(:home_phone,phone:'123-555-456')).to be_valid
    end
  end
end
