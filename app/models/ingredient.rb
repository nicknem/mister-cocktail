class Ingredient < ActiveRecord::Base
  has_many :doses
  has_many :cocktails, through: :doses, :dependent => :restrict_with_exception
  validates :name, presence: true, uniqueness: true
  before_destroy :check_for_cocktails
end
