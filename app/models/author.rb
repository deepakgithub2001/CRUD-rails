class Author < ApplicationRecord
  validates :name, presence: true 
  validates :email, uniqueness:{case_sensitive: false, message: "is alraedy taken."}
  has_many :books, dependent: :destroy
end 