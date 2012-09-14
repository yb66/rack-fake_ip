

module Example
  def self.app
    app = Rack::Builder.app do
      x = lambda {|e|
        request = Rack::Request.new(e)
        warn %Q!  IP: #{e["REMOTE_ADDR"]}!
        Rack::Response.new(e["REMOTE_ADDR"],200,{"Content-Type" => "text/html"}).finish
      }
      use Rack::FakeIP
      run x
    end
  end # def app
end


shared_context "Application" do
  include Rack::Test::Methods
  let(:app){ Example.app }
end