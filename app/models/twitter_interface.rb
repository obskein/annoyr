class TwitterInterface
  class << self

    def consumer_key
      "91mjsSA21JD45dMIMtWpw"
    end

    def consumer_secret
      "DsLyvzfN3hQeXqJfsYyX3oCXgd7fxBWFovEcq2geCjU"
    end

    def callback_url
      'http://annoyr.com:3000/'
    end

    def tweet! message
      client.update(@client.update)
    end

    def main_settings
      GlobalAccountSetting.main_settings
    end

    def main_access_token
      main_settings.twitter_request_token
    end

    def main_secret_token
      main_settings.twitter_request_token_secret
    end

    def tweet!(message)
      client.update(message)
    end

    def client(session = {})
      TwitterOAuth::Client.new(
        :consumer_key => consumer_key,
        :consumer_secret => consumer_secret,
        :token => session[:access_token] || main_access_token,
        :secret => session[:secret_token] || main_secret_token
      )
    end

    def get_settings_from session, params

      client = TwitterInterface.client(session)
      begin
        @access_token = client.authorize(
          session[:request_token],
          session[:request_token_secret],
          :oauth_verifier => params[:oauth_verifier]
        )
      rescue OAuth::Unauthorized
      end
      
      if client.authorized? && @access_token

        # Persisting the access tokens so we don't have to go back to Twitter again
        return @access_token.token, @access_token.secret
      else
      end
    end
  end
end
