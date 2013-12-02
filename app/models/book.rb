class Book < ActiveRecord::Base
  
  
  # associations
  has_many :library_books, dependent: :destroy
  has_many :libraries, through: :library_books
  
  #validations
  validates :title, presence: true
  validates :ISBN, isbn_format: true, uniqueness: true
  
  default_scope -> { order(title: :asc) }
  
  def has_library?(library_id)
    !!(self.library_books.where(library_id: library_id).exists?)
  end
  
end
