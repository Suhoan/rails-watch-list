class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: {minimum: 6}
  validates :movie_id, uniqueness: { scope: :list_id }
  #movie_id는 유니크한데 list_id랑 연결이 되어있다.
end
