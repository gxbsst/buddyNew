module Refinery
  module Pictures
    class Picture < Refinery::Core::BaseModel
      self.table_name = 'refinery_pictures'

      attr_accessible :title, :url, :photo_id, :position

      acts_as_indexed :fields => [:title, :url]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
