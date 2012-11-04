require 'bcrypt'

class User < ActiveRecord::Base
	attr_accessible :email, :password, :password_confirmation
	attr_accessor :password, :password_confirmation

	validates_uniqueness_of :email
	validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
	
	validates_presence_of :password, :on=>:create
	validates_confirmation_of :password, :if=>:password_changed?
	
	before_save :hash_new_password, :if=>:password_changed?
	
	def password_changed?
		Proc.new { @password.blank? }
	end
	
	private
    def hash_new_password
      self.hashed_password = BCrypt::Password.create(@password)
    end

end
