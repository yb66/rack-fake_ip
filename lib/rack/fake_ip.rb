# encoding: UTF-8

require 'ipaddr'
module Rack
  class FakeIP

    def initialize( app, options={} )
      @app, @options = app, options
      
    end


    def call(response)
      response["REMOTE_ADDR"] = IPAddr.new(rand(2**32),Socket::AF_INET).to_s
      #warn response.inspect
      @app.call(response)
    end
  end
end
