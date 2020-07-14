class Book < ApplicationRecord
	belongs_to :user
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true, length: { in: 1..20 }
	validates :body, presence: true, length: { in: 1..20 }
	has_many :book_comments
	has_many :favorites
	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    end
end
