class AddUniqueIndexToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_index :bookmarks, [:movie_id, :list_id], unique: true, name: 'index_bookmarks_on_movie_id_and_list_id'
  end
end
