class Category < ApplicationRecord
  has_many :cars, dependent: :destroy

  validates :code, presence: true, uniqueness: true, length: {maximum: 50, minimum: 2}
  validates :name, presence: true, length: {maximum: 255, minimum: 2}
  validates :description, length: {maximum: 1000}
end
