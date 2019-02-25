class Commit < ApplicationRecord
  validates :date, :user_id, :sha, :message, presence: true
  belongs_to :user

  paginates_per 30
  max_paginates_per 30
end
