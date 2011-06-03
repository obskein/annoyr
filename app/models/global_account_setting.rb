require 'twitter_interface'

class GlobalAccountSetting < ActiveRecord::Base

  class << self
    def main_settings
      GlobalAccountSetting.first || GlobalAccountSettings.create!
    end

    def set_twitter_stuff session, params
      begin
        @access_token = TwitterInterface.client(session).authorize(
          session[:request_token],
          session[:request_token_secret],
          :oauth_verifier => params[:oauth_verifier]
        )
      rescue OAuth::Unauthorized
      end

      if @client.authorized?
        # Persisting the access tokens so we don't have to go back to Twitter again
        main_settings.update_attributes({
          :twitter_request_token => @access_token.token,
          :twitter_request_token_secret => @access_token.secret
        })
      else
        raise 'Something terrible happened!, no twitter account stored!'
      end


    end
  end
end
