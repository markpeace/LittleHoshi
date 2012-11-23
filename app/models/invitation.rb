class Invitation < ActiveRecord::Base
	attr_accessible :count, :notes, :token

	validates_uniqueness_of :token

	before_validation :generate_token
	def generate_token
		self.token=Digest::SHA1.hexdigest([Time.now, rand].join) if self.token==nil
	end
	def default_count
		self.uses=1 if self.uses==nil
	end

	def self.to_user(email)
		return nil if email.nil?
		
		u=User.find_or_create_by_email(email)
		Invitation.create(:notes=>"for #{u.email}")
	end

	def self.to_users(number)
		User.limit(number).each { |u| Invitation.to_user(u.email) }
	end
	
	def self.consume(token)
		return nil unless i=Invitation.find_by_token(token)
		i.uses=i.uses-1
		i.save if i.uses>0
		i.destroy if i.uses==0
		return i
	end

end
