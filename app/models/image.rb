# == Schema Information
#
# Table name: images
#
#  id          :integer         not null, primary key
#  description :text
#  url         :text
#  poster_id   :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

# Posts with images
class Image < ActiveRecord::Base
  attr_accessible :description, :poster_id, :url

  include ExternalContent

  validates_format_of( :url,
                       with: /.*\.(jpg|jpeg|png|bmp|gif)$/,
                       message: "Invalid image url or type")
end
