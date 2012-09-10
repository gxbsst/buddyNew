module Refinery
  module Pictures
    class PicturesController < ::ApplicationController

      before_filter :find_all_pictures
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @picture in the line below:
        present(@page)
      end

      def show
        @picture = Picture.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @picture in the line below:
        present(@page)
      end

    protected

      def find_all_pictures
        @pictures = Picture.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pictures").first
      end

    end
  end
end
