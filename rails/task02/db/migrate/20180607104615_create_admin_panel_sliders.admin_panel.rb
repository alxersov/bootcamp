# This migration comes from admin_panel (originally 20180607090410)
class CreateAdminPanelSliders < ActiveRecord::Migration
  def change
    create_table :admin_panel_sliders do |t|
      t.string :title
      t.string :catption
      t.string :banner
      t.string :button_url
      t.string :button_text

      t.timestamps
    end
  end
end
