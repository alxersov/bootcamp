# This migration comes from admin_panel (originally 20180608104335)
class CreateAdminPanelInspirations < ActiveRecord::Migration
  def change
    create_table :admin_panel_inspirations do |t|
      t.string :title
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
