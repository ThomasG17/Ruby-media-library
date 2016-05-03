require 'rails_helper'

RSpec.describe "produits/index", type: :view do
  before(:each) do
    assign(:produits, [
      Produit.create!(
        :nom => "Nom",
        :disponibilite => false,
        :description => "MyText",
        :image => "MyText",
        :ean => "Ean"
      ),
      Produit.create!(
        :nom => "Nom",
        :disponibilite => false,
        :description => "MyText",
        :image => "MyText",
        :ean => "Ean"
      )
    ])
  end

  it "renders a list of produits" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Ean".to_s, :count => 2
  end
end
