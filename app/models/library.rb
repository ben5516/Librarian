class Library < ActiveRecord::Base
  
  
  # associations
  has_many :library_books, dependent: :destroy
  has_many :books, through: :library_books
  
  # validations
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true 
  
  default_scope -> { order(name: :asc) }
  
  def has_book?(book_id)
    !!(self.library_books.where(book_id: book_id).exists?)
  end
  
end
