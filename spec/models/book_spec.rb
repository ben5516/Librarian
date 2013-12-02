require 'spec_helper'

describe Book do
  
  it "should have a valid factory" do
    FactoryGirl.build(:book).should be_valid
  end
  
  it "should not be valid without a title" do
    FactoryGirl.build(:book, title: nil).should_not be_valid
  end
  
  it "should not be valid without an ISBN" do
    FactoryGirl.build(:book, ISBN: nil).should_not be_valid
  end
  
  it "should should have a valid ISBN number" do
    FactoryGirl.build(:book, ISBN: '234-3').should_not be_valid
  end
  
  it "should have a unique ISNB" do
    isbn = Faker::Code.isbn
    FactoryGirl.create(:book, ISBN: isbn)
    FactoryGirl.build(:book, ISBN: isbn).should_not be_valid
  end
  
end
