class TwitterInterface
  unloadable
  class << self

    def consumer_key
      "91mjsSA21JD45dMIMtWpw"
    end

    def consumer_secret
      "DsLyvzfN3hQeXqJfsYyX3oCXgd7fxBWFovEcq2geCjU"
    end

    def callback_url
      'http://annoyr.com:3000'
    end

    def username
      'AnnoyrBot'
    end

    def password
      'wildfire'
    end

    def client(session)
      TwitterOAuth::Client.new(
        :consumer_key => consumer_key,
        :consumer_secret => consumer_secret,
        :token => session[:access_token],
        :secret => session[:secret_token]
      )
    end
  end
end
