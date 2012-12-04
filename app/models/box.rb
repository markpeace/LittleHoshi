class Box < ActiveRecord::Base
  attr_accessible :notes, :theme

	has_many :activities, :dependent=>:destroy

	validates_presence_of :theme
	validates_uniqueness_of :theme, :case_sensitive=>false

	def cost
		self.activities.reduce(0) { |sum,a| sum + a.cost }
	end

end
