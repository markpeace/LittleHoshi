class Activity < ActiveRecord::Base
    attr_accessible :box_id, :name, :notes, :ingredientisations_attributes

	belongs_to :box
	validates_presence_of :box
	
	has_many :ingredientisations, :dependent=>:destroy
	has_many :ingredients, :through=>:ingredientisations
	accepts_nested_attributes_for :ingredientisations, :reject_if => lambda { |a| true if a[:ingredient_id].blank? or a[:quantity].blank? }
	
	validates_presence_of :name
	validates_uniqueness_of :name, :scope=>:box_id, :case_sensitive=>false

end
