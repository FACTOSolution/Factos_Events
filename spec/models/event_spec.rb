require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :value }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :contact }
    it { is_expected.to validate_presence_of :image_url }
  end
end
