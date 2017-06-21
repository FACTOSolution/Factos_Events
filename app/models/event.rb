class Event < ApplicationRecord
  include ImageUploader[:cover]

  validates :date, :name, :description, :cover, :value_in_real, :address,
        :contact, presence:true
end
