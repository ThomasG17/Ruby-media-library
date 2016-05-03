require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      :date_debut => "",
      :date_fin => ""
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input#location_date_debut[name=?]", "location[date_debut]"

      assert_select "input#location_date_fin[name=?]", "location[date_fin]"
    end
  end
end
