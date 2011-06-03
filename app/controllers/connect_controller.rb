require 'twitter_interface'
class ConnectController < ApplicationController
  def show
    request_token = client.request_token(
      :oauth_callback => TwitterInterface.callback_url
    )
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    redirect_to request_token.authorize_url.gsub('authorize', 'authenticate') 
  end

  protected

  def client
    @client ||= TwitterInterface.client(session)
  end

end
