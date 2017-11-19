class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :todolists, :due_date, :date
  end
end
