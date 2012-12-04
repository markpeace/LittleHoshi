class Activity < ActiveRecord::Base
    attr_accessible :box_id, :name, :notes

	belongs_to :box
	validates_presence_of :box
	
	has_many :ingredientisations, :dependent=>:destroy
	has_many :ingredients, :through=>:ingredientisations
	
	validates_presence_of :name
	validates_uniqueness_of :name, :scope=>:box_id, :case_sensitive=>false

	def cost
		self.ingredientisations.reduce(0) { |sum,i| sum + (i.ingredient.unitcost * i.quantity) }
	end

end
