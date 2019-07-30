class AddTagsToPosts < ActiveRecord::Migration[5.2]
  def change
  	change_table :posts do |t|
  		t.text :tags
  	end
  end
end
