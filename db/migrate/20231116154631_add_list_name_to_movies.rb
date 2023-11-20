class AddListNameToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :list_name, :string
  end
end
