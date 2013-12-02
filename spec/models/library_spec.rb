require 'spec_helper'

describe Library do
  
  
  # validations
  it "should have a valid factory" do
    FactoryGirl.build(:library).should be_valid
  end
  
  it "should not be valid without a name" do
    FactoryGirl.build(:library, {name: nil}).should_not be_valid
  end
  
  it "should not be valid without a street address" do
    FactoryGirl.build(:library, {address: nil}).should_not be_valid
  end
  
  it "should not be valid without a city" do
    FactoryGirl.build(:library, {city: nil}).should_not be_valid
  end
  
  it "should not be valid without a state" do
    FactoryGirl.build(:library, {state: nil}).should_not be_valid
  end
  
  it "should not be valid without a zip" do
    FactoryGirl.build(:library, {zip: nil}).should_not be_valid
  end
  
end
