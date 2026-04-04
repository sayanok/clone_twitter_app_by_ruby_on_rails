# users テーブル（db/migrate/20260322070616_create_users.rb 相当）
# - account: string, NOT NULL, UNIQUE インデックス（URL 等の識別子）
# - user_name: string, NOT NULL
# - description: text
# - password_digest: string, NOT NULL（has_secure_password が利用）
# - birth_of_date: date
# - created_at / updated_at: timestamps
class User < ApplicationRecord
  has_secure_password

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def to_param
    account
  end
end
