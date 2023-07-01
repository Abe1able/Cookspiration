class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'food_id'

  attribute :measurement_unit, :string
  attribute :price, :decimal, precision: 8, scale: 2

  validates :name, presence: true, length: { maximum: 50 }

end
