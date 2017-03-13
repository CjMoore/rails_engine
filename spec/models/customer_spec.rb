require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "relationships" do
    it { should have_many(:invoices) }
    it { should have_many(:transactions) }
  end
  context "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end
end
