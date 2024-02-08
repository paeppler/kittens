class Kitten < ApplicationRecord
  validates :name, format: {with: /\A[A-Z]+\z/i }, presence: true, uniqueness: true

end
