class Measurement < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient

  validates :ingredient_size, :presence => true

  def ingredient_name
    ingredient && ingredient.name
  end

  def ingredient_name=(name)
    self.ingredient = Ingredient.find_or_create_by_name(name) unless name.blank?
  end

end
