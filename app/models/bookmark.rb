class Bookmark < ApplicationRecord
  validates :comment, presence: true, length: { minimum: 6 }
  belongs_to :movie
  belongs_to :list
  validates :movie_id, uniqueness: { scope: :list_id, message: "should be unique per list" }
end
