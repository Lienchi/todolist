class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :todolists, :completed, :boolean
  end
end
