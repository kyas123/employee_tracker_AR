class AddLocalEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :remote, :boolean
  end
end
