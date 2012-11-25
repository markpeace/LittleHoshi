class UserMailer < ActionMailer::Base

	default from: "robot@littlehoshi.com"

	def welcome_email(email)
		mail(to:email, subject:"Welcome to Little Hoshi")
	end

	def invitation_email(user, token)
		@user=user
		@token=token
		mail(to:user.email, subject:"You have been invited to join Little Hoshi")
	end

	def holding_email(email)
		mail(to:email, subject:"You will be invited to join Little Hoshi soon...")
	end


end
