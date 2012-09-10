# This migration comes from refinery_pictures (originally 1)
class CreatePicturesPictures < ActiveRecord::Migration

  def up
    create_table :refinery_pictures do |t|
      t.string :title
      t.string :url
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pictures"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pictures/pictures"})
    end

    drop_table :refinery_pictures

  end

end
