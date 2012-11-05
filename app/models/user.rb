require 'bcrypt'

class User < ActiveRecord::Base
	attr_accessible :email, :password, :password_confirmation
	attr_accessor :password, :password_confirmation

	validates_presence_of :email
	validates_uniqueness_of :email
	validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
	
	validates_presence_of :password, :on=>:create
	validates_length_of :password, :in=>5..15
	validates_confirmation_of :password, :if=>:password_changed?
	
	before_save :hash_new_password, :if=>:password_changed?
	
	def password_changed?
		Proc.new { @password.blank? }
	end

	def self.authenticate(email, password)
		u=User.find_by_email(email)
		return false if u.nil?
		return false if u.hashed_password!=BCrypt::Password.create(password)
		return u
	end
	
	private
    def hash_new_password
      self.hashed_password = BCrypt::Password.create(@password)
    end

end
