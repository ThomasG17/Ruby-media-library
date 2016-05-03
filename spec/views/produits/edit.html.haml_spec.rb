require 'rails_helper'

RSpec.describe "produits/edit", type: :view do
  before(:each) do
    @produit = assign(:produit, Produit.create!(
      :nom => "MyString",
      :disponibilite => false,
      :description => "MyText",
      :image => "MyText",
      :ean => "MyString"
    ))
  end

  it "renders the edit produit form" do
    render

    assert_select "form[action=?][method=?]", produit_path(@produit), "post" do

      assert_select "input#produit_nom[name=?]", "produit[nom]"

      assert_select "input#produit_disponibilite[name=?]", "produit[disponibilite]"

      assert_select "textarea#produit_description[name=?]", "produit[description]"

      assert_select "textarea#produit_image[name=?]", "produit[image]"

      assert_select "input#produit_ean[name=?]", "produit[ean]"
    end
  end
end
