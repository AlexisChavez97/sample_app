class AddCategoryToMeme < ActiveRecord::Migration[5.2]
  def change
    add_column :memes, :category, :integer, default: 0, null: false
  end
end
