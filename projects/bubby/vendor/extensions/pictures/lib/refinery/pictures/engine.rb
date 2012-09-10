module Refinery
  module Pictures
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Pictures

      engine_name :refinery_pictures

      initializer "register refinerycms_pictures plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pictures"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pictures_admin_pictures_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/pictures/picture'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Pictures)
      end
    end
  end
end
