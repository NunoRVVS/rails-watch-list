class Movie < ApplicationRecord
  validates :title, presence: true , uniqueness: { case_sensitive: false }
  validates :overview, presence: true
  validates :rating, presence: true , numericality: { only_integer: true } , inclusion: {in: 0..5}
end
