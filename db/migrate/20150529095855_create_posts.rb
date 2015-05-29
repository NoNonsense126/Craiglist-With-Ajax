class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |p|
      p.string :title
      p.integer :category_id
      p.text :body
      p.timestamps
    end
  end
end
