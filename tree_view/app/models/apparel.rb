class Apparel < ActiveRecord::Base
	has_ancestry

  attr_accessible :ancestry, :name, :parent_id

  validates_presence_of :name
end