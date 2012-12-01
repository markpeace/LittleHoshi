class Activity < ActiveRecord::Base
  attr_accessible :box_id, :name, :notes

	belongs_to :box
	validates_presence_of :box
	
	validates_presence_of :name
	validates_uniqueness_of :name, :scope=>:box_id, :case_sensitive=>false

end
