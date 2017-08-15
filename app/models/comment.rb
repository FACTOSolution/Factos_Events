class Comment < ApplicationRecord
  validates  :description, :event,  presence: true
  belongs_to :event
end
