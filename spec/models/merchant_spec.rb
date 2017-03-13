require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "relationships" do
    it { should have_many(:items) }
    it { should have_many(:invoices) }
    it { should have_many(:transactions)} 
  end
  context "validations" do
    it { should validate_presence_of(:name) }
  end
end
