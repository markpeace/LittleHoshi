class Invitation < ActiveRecord::Base
  attr_accessible :count, :notes, :token
end
