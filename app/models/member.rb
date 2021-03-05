class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :address, dependent: :destroy
  has_many :orders

  enum withdrawal_status: { 有効: 0, 無効: 1 }

  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, presence: true

  include JpPrefecture
  jp_prefecture :perfecture_code

  def prefecture_name
  	JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  	# "tryメソッド"は、実行したオブジェクトに指定したメソッドがあればメソッドの戻り値を返し、メソッドがなければnilを返すメソッド。
  	# 構文："オブジェクト.try(:メソッド名)"
  end

  def prefecture_name=(prefecture_name)
  	self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  def active_for_authentication?
  	super && (self.is_deleted == false)
  end
end
