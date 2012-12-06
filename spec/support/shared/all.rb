

module Example
  def self.app( options={} )
    app = Rack::Builder.app do
      use Rack::FakeIP, options
      use Rack::Session::Cookie
      x = lambda {|e|
        Rack::Response.new(e["REMOTE_ADDR"],200,{"Content-Type" => "text/html"}).finish
      }
      run x
    end
  end # def app
end


shared_context "Application" do |options={}|
  include Rack::Test::Methods
  let(:app){ Example.app( options ) }
end