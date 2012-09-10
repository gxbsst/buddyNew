# This migration comes from refinery_origins (originally 1)
class CreateOriginsOrigins < ActiveRecord::Migration

  def up
    create_table :refinery_origins do |t|
      t.integer :photo_id
      t.text :description
      t.integer :position
      t.string :title

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-origins"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/origins/origins"})
    end

    drop_table :refinery_origins

  end

end
