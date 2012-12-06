# encoding: UTF-8

require 'ipaddr'
module Rack
  class FakeIP

    DEFAULT_OPTIONS = {
      :static => true
    }

    # @param [#call] app
    # @param [Hash] options
    # @option options [true,false] :static Keep the same address during a session.
    # @option options [String] :ip An IPv4 address you wish to use. Static in all cases.
    def initialize( app, options={} )
      @app, @options = app, DEFAULT_OPTIONS.merge(options)
    end


    def call(env)
      env["REMOTE_ADDR"] = if @options[:ip]
        @options[:ip]
      elsif @options[:static]
        Rack::Request.new(env).session["fake_ip"] ||= generate_ip4
      else
        generate_ip4
      end
      @app.call(env)
    end

    # Generates a random (using `rand`) IPv4 address.
    # @return [String]
    def generate_ip4
      IPAddr.new(rand(2**32),Socket::AF_INET).to_s
    end
  end
end
