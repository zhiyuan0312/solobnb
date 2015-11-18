class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	mount_uploaders :pictures, PictureUploader

	def country_name
    country = ISO3166::Country[self.location]
    country.translations[I18n.locale.to_s] || country.name
  end

end
