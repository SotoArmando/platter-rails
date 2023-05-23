require "openssl"
require "base64"
require "digest/md5"
require "net/http"
require 'pp'

class String
  def esc
    CGI.escape(self).gsub("%7E", "~").gsub("+", "%20")
  end
end

class FatsecretSource < ActiveRecord::Base
  # attr_accessible :title, :body

  KEY = ENV["FATSECRET_CONSUMER_KEY"]
  SECRET = ENV["FATSECRET_CONSUMER_SECRET"]
  SHA1 = "HMAC-SHA1"
  SITE = "https://platform.fatsecret.com/rest/server.api"

  class String
    def esc
      CGI.escape(self).gsub("%7E", "~").gsub("+", "%20")
    end
  end

  class << self
    class String
      def esc
        CGI.escape(self).gsub("%7E", "~").gsub("+", "%20")
      end
    end
  end

  def self.query(query, accesssecret)
    milliseconds_since_epoch = DateTime.now.strftime('%Q').to_i

    params = {
      :oauth_consumer_key => KEY,
      :oauth_nonce => Digest::MD5.hexdigest(rand(11).to_s),
      :oauth_signature_method => SHA1,
      :oauth_timestamp => (milliseconds_since_epoch / 100).round ,
      :oauth_version => "1.0",
    #   :method => "foods.search",
    #   :search_expression => expression,
    }
    params.merge!(query);

    sorted_params = params.sort { |a, b| a.first.to_s <=> b.first.to_s }
    puts("sorted_params")
    pp(sorted_params)

    base = base_string("GET", sorted_params)
    http_params = http_params("GET", params)
    sig = sign(base, token:  accesssecret).esc
    uri = uri_for(http_params, sig)
    results = Net::HTTP.get(uri)
  end

  def self.search(expression)
    params = {
      :oauth_consumer_key => KEY,
      :oauth_nonce => Digest::MD5.hexdigest(rand(11).to_s),
      :oauth_signature_method => SHA1,
      :oauth_timestamp => Time.now.to_i,
      :oauth_version => "1.0",
      :method => "foods.search",
      :search_expression => expression,
    }
    sorted_params = params.sort { |a, b| a.first.to_s <=> b.first.to_s }
    base = base_string("GET", sorted_params)
    http_params = http_params("GET", params)
    sig = sign(base, accesssecret).esc
    uri = uri_for(http_params, sig)
    results = Net::HTTP.get(uri)
  end

  def self.base_string(http_method, param_pairs)
    param_str = param_pairs.collect { |pair| "#{pair.first}=#{pair.last}" }.join("&")
    list = [http_method.esc, SITE.esc, param_str.esc]
    puts("list")
    puts(list)
    list.join("&")
  end

  def self.http_params(method, args)
    pairs = args.sort { |a, b| a.first.to_s <=> b.first.to_s }
    list = []
    pairs.inject(list) { |arr, pair| arr << "#{pair.first.to_s}=#{pair.last}" }
    list.join("&")
  end

  def self.sign(base, token: "")
    secret = "#{SECRET.esc}&#{token.esc}"
    base64 = Base64.encode64(OpenSSL::HMAC.digest("sha1", secret, base)).gsub(/\n/, "")
  end

  def self.uri_for(params, signature)
    parts = params.split("&")
    parts << "oauth_signature=#{signature}"
    URI.parse("#{SITE}?#{parts.join("&")}")
  end
end
