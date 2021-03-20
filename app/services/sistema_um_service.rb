require 'net/http'

class SistemaUmService
  HOST = 'http://localhost:3000/'

  def initialize(endpoint)
    @endpoint = HOST + endpoint
  end

  def update_address(lat, long)
    params = { lat: lat, long: long }
    uri = URI(@endpoint)
    uri.query = URI.encode_www_form(params)
    req = Net::HTTP::Put.new(uri.to_s)
    res = Net::HTTP.start(uri.host, uri.port, use_ssl: false) do |http|
      http.request(req)
    end
    @response = res.body
  end
end