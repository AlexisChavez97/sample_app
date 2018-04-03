class CreateCategoriesMemesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :memes do |t|
      t.index :category_id
      t.index :meme_id
    end
  end
end
