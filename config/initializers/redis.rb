encoded_url = URI.encode(ENV["REDISTOGO_URL"])
uri = URI.parse(encoded_url)
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
