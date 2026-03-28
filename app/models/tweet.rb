class Tweet < ApplicationRecord
  validates :tweet_text, length: { maximum: 140 }
end
