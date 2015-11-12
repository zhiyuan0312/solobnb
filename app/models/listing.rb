class Listing < ActiveRecord::Base
	belongs_to :user

	def country_name
    country = ISO3166::Country[self.location]
    country.translations[I18n.locale.to_s] || country.name
  end

end
