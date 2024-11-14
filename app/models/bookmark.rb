class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, presence: true , uniqueness: { case_sensitive: false } , length: { minimum: 6 }
end
