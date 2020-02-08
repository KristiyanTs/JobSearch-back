class AddPricingToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :pricing, index: true
  end
end
