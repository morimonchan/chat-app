class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?
  # メソッドの返り値がfalseならバリデーションによる検証を行うという意味

  def was_attached?
    self.image.attached?
    # self.image.attached?で画像があればtrue、画像がなければfalseが返る。
  end
end
