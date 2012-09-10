require 'refinerycms-core'

module Refinery
  autoload :PicturesGenerator, 'generators/refinery/pictures_generator'

  module Pictures
    require 'refinery/pictures/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
