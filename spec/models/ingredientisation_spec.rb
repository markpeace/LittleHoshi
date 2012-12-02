require 'spec_helper'

describe Ingredientisation do

	it { should belong_to(:ingredient) }
	it { should validate_presence_of(:ingredient) }	
	
	it { should belong_to(:box) }
	it { should validate_presence_of(:box) }
	
end
