class AddTimeToShow < ActiveRecord::Migration
  def change
      add_column :shows, :time, :time
  end
end
