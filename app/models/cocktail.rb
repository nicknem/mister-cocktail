class Cocktail < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses # find doses ingredients
end
