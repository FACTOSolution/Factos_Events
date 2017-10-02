require 'rails_helper'

RSpec.describe Event, type: :model do

  describe "Validations" do
    context "With invalid objects" do
      it "Should raise MissingNameError" do
        expect{
          Event.create(attributes_for(:event, name: nil))
        }.to raise_error(ApiExceptions::CreateEventError::MissingNameError)
      end

      it "Should raise MissingDateError" do
        expect{
          Event.create(attributes_for(:event, date: nil))
        }.to raise_error(ApiExceptions::CreateEventError::MissingDateError)
      end

      it "Should raise MissingValueError" do
        expect{
          Event.create(attributes_for(:event, value: nil))
        }.to raise_error(ApiExceptions::CreateEventError::MissingValueError)
      end

      it "Should raise MissingDescriptionError" do
        expect{
          Event.create(attributes_for(:event, description: nil))
        }.to raise_error(ApiExceptions::CreateEventError::MissingDescriptionError)
      end
    end
  end
end
