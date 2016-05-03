require 'rails_helper'

RSpec.describe "produits/new", type: :view do
  before(:each) do
    assign(:produit, Produit.new(
      :nom => "MyString",
      :disponibilite => false,
      :description => "MyText",
      :image => "MyText",
      :ean => "MyString"
    ))
  end

  it "renders new produit form" do
    render

    assert_select "form[action=?][method=?]", produits_path, "post" do

      assert_select "input#produit_nom[name=?]", "produit[nom]"

      assert_select "input#produit_disponibilite[name=?]", "produit[disponibilite]"

      assert_select "textarea#produit_description[name=?]", "produit[description]"

      assert_select "textarea#produit_image[name=?]", "produit[image]"

      assert_select "input#produit_ean[name=?]", "produit[ean]"
    end
  end
end
