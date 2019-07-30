class ChangeForPosts < ActiveRecord::Migration[5.2]
  def change
  	remove_column :categories,:post_id
  	add_column :posts,:category_id,:integer
  end
end
