class Ingredientisation < ActiveRecord::Base
  attr_accessible :activity_id, :ingredient_id, :ingredient, :quantity

	belongs_to :activity
	belongs_to :ingredient

	validates_presence_of :activity
	validates_presence_of :ingredient

end
