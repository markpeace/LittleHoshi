class Ingredient < ActiveRecord::Base
  attr_accessible :name, :stock, :unitcost
end
