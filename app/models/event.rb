class Event < ApplicationRecord
  include Filterable

  validates_with EventValidator
  validates :date, :name, :description, :value, :address,
        :contact, :type, :lat, :long, presence:true
  has_many :comments, dependent: :delete_all
  has_many :images, dependent: :delete_all
  belongs_to :user

  accepts_nested_attributes_for :images

  def self.published
    where(published: true)
  end
end
