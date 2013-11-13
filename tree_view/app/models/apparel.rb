class Apparel < ActiveRecord::Base
  has_ancestry

  attr_accessible :ancestry, :name, :parent_id

  validates_presence_of :name

  def self.search filter
    apparels =  if filter
                  Apparel.select('id, ancestry').where("name LIKE ? ", "%"+filter+"%").all
                else
                  Apparel.select('id, ancestry').all
                end

    apparel_path_ids = apparels.inject([]){|arr, item| arr|item.path_ids} # ids of nodes need to be shown
    roots = Apparel.where(:ancestry => nil).where(:id => apparel_path_ids).all

    [roots, apparel_path_ids]
  end
end