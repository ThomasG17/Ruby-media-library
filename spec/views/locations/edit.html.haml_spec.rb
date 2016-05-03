require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :date_debut => "",
      :date_fin => ""
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do

      assert_select "input#location_date_debut[name=?]", "location[date_debut]"

      assert_select "input#location_date_fin[name=?]", "location[date_fin]"
    end
  end
end
