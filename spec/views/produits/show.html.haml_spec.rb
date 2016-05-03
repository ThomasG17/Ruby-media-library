require 'rails_helper'

RSpec.describe "produits/show", type: :view do
  before(:each) do
    @produit = assign(:produit, Produit.create!(
      :nom => "Nom",
      :disponibilite => false,
      :description => "MyText",
      :image => "MyText",
      :ean => "Ean"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Ean/)
  end
end
