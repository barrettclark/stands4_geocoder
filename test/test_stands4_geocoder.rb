require 'test/unit'
require 'stands4_geocoder'
require 'webmock/test_unit'

class Stands4GeocoderTest < Test::Unit::TestCase
  def setup
    filename = File.join(File.expand_path(File.dirname(__FILE__)), 'geocode.xml')
    stub_request(:get, 'http://www.stands4.com/services/v1/zip.aspx?tokenid=ab1234&zip=90210').
      to_return(:body => File.new(filename),
                :status => 200,
                :headers => {'Content-Type' => 'application/xml'})
  end

  def test_reverse_geocode
    geocode = Stands4Geocoder.reverse_geocode('90210', 'ab1234')
    assert_equal "Beverly Hills, CA", geocode['location']
  end

  def test_reverse_geocode_not_found
    assert_raises WebMock::NetConnectNotAllowedError do
    geocode = Stands4Geocoder.reverse_geocode('00000', 'ab1234')
    end
  end
end
