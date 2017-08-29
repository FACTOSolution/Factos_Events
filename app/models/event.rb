class Event < ApplicationRecord
  include Filterable

  validates :date, :name, :description, :image_url, :value, :address,
        :contact, :type, presence:true
  has_many :comments, dependent: :delete_all
  belongs_to :user
end
