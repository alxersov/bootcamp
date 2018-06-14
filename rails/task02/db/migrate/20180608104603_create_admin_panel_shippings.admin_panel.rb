# This migration comes from admin_panel (originally 20180608104505)
class CreateAdminPanelShippings < ActiveRecord::Migration
  def change
    create_table :admin_panel_shippings do |t|
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
