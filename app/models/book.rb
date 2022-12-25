class Book < ApplicationRecord
  validates :title, presence: true
end
