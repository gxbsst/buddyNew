module Refinery
  module Pictures
    module Admin
      class PicturesController < ::Refinery::AdminController

        crudify :'refinery/pictures/picture', :xhr_paging => true

      end
    end
  end
end
