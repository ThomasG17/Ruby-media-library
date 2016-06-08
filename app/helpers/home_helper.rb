module HomeHelper

  def produits_random_by_type(id)
    @type = Type.find(id)
    p = @type.produits.where(:disponibilite => 'true')
    @random_ids = p.ids.sort_by { rand }.slice(0, 4)
  end

end
