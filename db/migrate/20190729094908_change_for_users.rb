class ChangeForUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :posts,:tags
  	add_column :categories,:post_id,:integer
  end
end
