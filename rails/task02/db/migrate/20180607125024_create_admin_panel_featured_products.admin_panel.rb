# This migration comes from admin_panel (originally 20180607124657)
class CreateAdminPanelFeaturedProducts < ActiveRecord::Migration
  def change
    create_table :admin_panel_featured_products do |t|
      t.string :title
      t.string :image
      t.decimal :price, :precision => 8, :scale => 2
      t.string :image

      t.timestamps
    end
  end
end
