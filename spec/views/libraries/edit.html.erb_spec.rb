require 'spec_helper'

describe "libraries/edit" do
  before(:each) do
    @library = assign(:library, stub_model(Library,
      :name => "MyString",
      :address => "MyString",
      :address_cont => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders the edit library form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", library_path(@library), "post" do
      assert_select "input#library_name[name=?]", "library[name]"
      assert_select "input#library_address[name=?]", "library[address]"
      assert_select "input#library_address_cont[name=?]", "library[address_cont]"
      assert_select "input#library_city[name=?]", "library[city]"
      assert_select "input#library_state[name=?]", "library[state]"
      assert_select "input#library_zip[name=?]", "library[zip]"
    end
  end
end
