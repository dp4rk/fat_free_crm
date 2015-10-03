class AddFieldsToOpportunities < ActiveRecord::Migration
  def change
    change_table :opportunities do |t|
      t.integer :futon
    end
  end
end
