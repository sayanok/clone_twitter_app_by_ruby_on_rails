class Tweet < ApplicationRecord
  belongs_to :user

  validates :tweet_text, length: { maximum: 140 }
end