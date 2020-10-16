class Review < ActiveRecord::Base
  belongs_to :user
  validates :game_title, :description, :score, presence: true
end
