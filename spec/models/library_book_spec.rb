require 'spec_helper'

describe LibraryBook do
  
  # validations
  it "should have a valid factory" do
    FactoryGirl.build(:library_book).should be_valid
  end
  
  it "should not be valid without a library" do
    FactoryGirl.build(:library_book, library_id: nil).should_not be_valid
  end
  
  it "should not be valid without a book" do
    FactoryGirl.build(:library_book, book_id: nil).should_not be_valid
  end
  
end
