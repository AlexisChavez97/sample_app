class AddNameToMemes < ActiveRecord::Migration[5.2]
  def change
    add_column :memes, :name, :string
  end
end
