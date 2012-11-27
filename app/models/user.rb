require 'bcrypt'

class User < ActiveRecord::Base
	attr_accessible :email, :password, :password_confirmation, :is_admin, :registration_of_interest, :invitation_token
	attr_accessor :password, :password_confirmation, :invitation_token

	has_one :invitation, :primary_key=>:token, :foreign_key=>:invitation_token

	validates_presence_of :email
	validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
	validate :uniqueness_of_email, :on=>:create
	def uniqueness_of_email
		if u=User.find_by_email(self.email)
			if u.registration_of_interest 
				u.destroy			
			else
				self.errors.add(:email, "A user has already registered with this email")
			end
		end
		self
	end
	
	
	validates_presence_of :password, :on=>:create
	validates_length_of :password, :in=>5..15, :on=>:create
	validates_confirmation_of :password, :if=>:password_changed?
	
	validate :check_invitation_token?, :on=>:create
	
	before_save :hash_new_password, :if=>:password_changed?
	after_create :consume_token
	after_create :welcome_email
	
	def password_changed?
		Proc.new { @password.blank? }
	end
	
	def check_invitation_token? 
		if self.invitation_token==nil then
			self.registration_of_interest=true
			return false
		else
			self.errors.add(:base, "Invalid Invitation Token") unless Invitation.find_by_token(self.invitation_token)
			return true
		end
	end

	def consume_token
		return unless i=Invitation.find_by_token(self.invitation_token)
		i.uses=i.uses-1
		i.save
	end

	def welcome_email
		UserMailer.welcome_email(self.email).deliver unless self.registration_of_interest
		UserMailer.holding_email(self.email).deliver if self.registration_of_interest
	end

	def self.authenticate(email,password)
		return nil unless u=User.where(:email=>email, :registration_of_interest=>false).first
		return nil unless BCrypt::Password.new(u.hashed_password).is_password? password
		u
	end
	
	private
    def hash_new_password
      self.hashed_password = BCrypt::Password.create(@password)
    end

end
