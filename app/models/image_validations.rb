module ImageValidations
  IMAGE_VALIDATOR_REGEX = /^https?:\/\/(?:[a-z\-\d]+\.)+[a-z]{2,6}(?:\/[^\/#?]+)+\.(?:jpg|gif|png)$/ix
  def self.allow_amazon_uploads(params=true)
    allow_amazon_uploads = true
  end

  def self.included(source)
    source.validates_presence_of :link, message: "You must provide a link to an image."
    source.validates_format_of :link, :with => IMAGE_VALIDATOR_REGEX, message: "URL must start with http and be a .jpg, .gif, or .png"
    source.validates_length_of :link, :within => 3..2048, message: "Given URL needs to be less then 2048 characters"
    source.validates_length_of :comment, :within => 3..256, :allow_blank => true
    source.after_validation :send_photo_to_amazon if true
  end
end