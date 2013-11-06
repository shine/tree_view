class Apparel < ActiveRecord::Base
	has_ancestry

  attr_accessible :ancestry, :name
end