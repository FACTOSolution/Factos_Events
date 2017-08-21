class Event < ApplicationRecord
  include ImageUploader[:cover]
  include Filterable

  validates :date, :name, :description, :cover, :value_in_real, :address,
        :contact, :type, presence:true
  has_many :comments, dependent: :delete_all
  belongs_to :user
end
