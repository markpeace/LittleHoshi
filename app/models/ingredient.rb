class Ingredient < ActiveRecord::Base
  attr_accessible :name, :stock, :unitcost

	has_many :ingredientisations, :dependent=>:destroy
	has_many :ingredients, :through=>:ingredientisations

	validates_presence_of :name
	validates_uniqueness_of :name, :case_sensitive=>false
	
	validates_presence_of :unitcost

end
