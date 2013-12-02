class LibraryBook < ActiveRecord::Base
  
  # associations
  belongs_to :library
  belongs_to :book
  
  # validations
  validates :book_id, presence: true
  validates :library_id, presence: true
  validates :book_id, uniqueness: { scope: :library_id, message: "is already in this library." }
  
  scope :popular, -> { order(request_count: :desc) }
  
  def request!
    self.update_attribute(:request_count, self.request_count.to_i + 1)
  end
  
end
