class Room < ApplicationRecord
  belongs_to :player
  has_many :questions

  accepts_nested_attributes_for :questions
end
