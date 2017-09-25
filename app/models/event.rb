class Event < ApplicationRecord
  include Filterable
  before_save :set_default_values

  validates_with EventValidator
  validates :date, :name, :description, :value, :address,
        :contact, :type, :lat, :long, presence:true
  has_many :comments, dependent: :delete_all
  has_many :images, dependent: :delete_all
  belongs_to :user
  enum event_status: [:pending, :approved, :rejected]

  accepts_nested_attributes_for :images

  def self.published
    where(published: true)
  end

  def set_default_values
    self.event_status ||= 'pending'
  end
end
