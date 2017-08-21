class Comment < ApplicationRecord
  include Filterable

  validates  :description, :event,  presence: true
  belongs_to :event
  belongs_to :user
end
