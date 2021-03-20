class AddressesController < ApplicationController
  before_actio :set_services, only: [:coordinates]

  def coordinates
    filter = params[:addres]
    @result = @google_service.search_coordinate(filter)
    if @result[:success]
      sucess_with_google
    else
      error_with_google
    end
    render json: { body: @body }, status: @status
  end

  private

  def sucess_with_google
    @sistema_um_service.update_address(@result[:lat], @result[:long])
    @status = 200
    @body = 'Sucesso na integração'
  end

  def error_with_google
    @status = 404
    @body = 'Erro na integração com a api do google'
  end

  def set_services
    @google_service = GoogleApiService.new
    request_id = params[:request_id]
    @sistema_um_service = SistemaUmService.new("api/v1/set_address_request_coordinates/#{request_id}")
  end
end
