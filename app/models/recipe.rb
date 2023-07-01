class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods,  dependent: :destroy

  scope :public_recipes, -> { where(public: true) }


  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true
end
