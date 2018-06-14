class CreateAdminPanelFeaturedProducts < ActiveRecord::Migration
  def change
    create_table :admin_panel_featured_products do |t|
      t.string :title
      t.decimal :price, :precision => 8, :scale => 2
      t.string :image

      t.timestamps
    end
  end
end
