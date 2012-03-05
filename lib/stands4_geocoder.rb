require 'httparty'

module Stands4Geocoder

  include HTTParty
  base_uri 'www.stands4.com'

  # GET http://www.stands4.com/services/v1/zip.aspx?tokenid=tk1902&zip=90210
  def self.reverse_geocode(zipcode, tokenid)
    options = {
      :query => { :zip => zipcode, :tokenid => tokenid }
    }
    geocode = get('/services/v1/zip.aspx', options)
    if geocode['results'] && geocode['results']['result']
      geocode['results']['result']
    else
      nil
    end
  end

end
