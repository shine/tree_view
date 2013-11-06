class CreateApparels < ActiveRecord::Migration
  def change
    create_table :apparels do |t|
      t.string :ancestry
      t.string :name

      t.timestamps
    end

    add_index :apparels, :ancestry
  end
end
