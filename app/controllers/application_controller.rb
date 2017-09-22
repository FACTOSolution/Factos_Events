class ApplicationController < ActionController::Base
  rescue_from ApiExceptions::BaseException, with: :render_error_response
  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :set_format

  def render_error_response(error)
    render json: error, serializer: ApiExceptionSerializer, status: 200
  end

  def set_format
    request.format = 'json'
  end
end
