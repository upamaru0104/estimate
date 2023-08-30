class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
		# 半角英数字混合での入力が必須
    validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "は半角英字と数字を含めてください" }
  end

  has_many :estimates
end
