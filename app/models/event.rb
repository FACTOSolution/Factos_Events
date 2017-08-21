class Event < ApplicationRecord
  include ImageUploader[:cover]
  include Filterable

  validates :date, :name, :description, :cover, :value_in_real, :address,
        :contact, :type,  presence:false
  has_many :comments
  belongs_to :user
end
