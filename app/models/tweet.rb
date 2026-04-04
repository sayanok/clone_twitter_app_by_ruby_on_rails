class Tweet < ApplicationRecord
  belongs_to :user

  has_many :favorites

  validates :tweet_text, length: { maximum: 140 }
end
