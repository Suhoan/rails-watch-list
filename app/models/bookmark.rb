class Bookmark < ApplicationRecord
  belongs_to :movie #bookmark.movie => movie instances
  belongs_to :list

  validates :comment, length: {minimum: 6}
  validates :movie_id, uniqueness: { scope: :list_id }
  #movie_id는 유니크한데 list_id랑 연결이 되어있다.
end

#이 다음에 콘솔 가서 bookmark = bookmark.new 하소 bookmark.valid? 하면 불리언으로 결과가 나옴
