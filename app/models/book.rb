class Book < ApplicationRecord
    has_one_attached :book_image
    belongs_to :author
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true
end 
