require 'spec_helper'

describe "libraries/new" do
  before(:each) do
    assign(:library, stub_model(Library,
      :name => "MyString",
      :address => "MyString",
      :address_cont => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ).as_new_record)
  end

  it "renders new library form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", libraries_path, "post" do
      assert_select "input#library_name[name=?]", "library[name]"
      assert_select "input#library_address[name=?]", "library[address]"
      assert_select "input#library_address_cont[name=?]", "library[address_cont]"
      assert_select "input#library_city[name=?]", "library[city]"
      assert_select "input#library_state[name=?]", "library[state]"
      assert_select "input#library_zip[name=?]", "library[zip]"
    end
  end
end
