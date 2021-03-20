require 'net/http'

class GoogleApiService
  HOST = 'http://maps.googleapis.com/maps/api/geocode/json'

  def initialize; end

  def search_coordinate(address)
    uri = URI(HOST)
    params = { address: address }
    uri.query = URI.encode_www_form(params)
    integration_result(call(uri))
  end

  private

  def integration_result(response)
    return { success: false } unless response.is_a?(Net::HTTPSuccess)

    {
      success: true,
      lat: "21312321321", # response['results']['lat'],
      long: "21312321321" # response['results']['long']
    }
  end

  def call(uri)
    Net::HTTP.get_response(uri)
  end
end
