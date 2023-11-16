class AddRatingToMovie < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :rating, :decimal, precision: 10, scale: 1
  end
end
