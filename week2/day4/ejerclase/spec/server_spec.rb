require "./server"
require "rspec"
require "rack/test"

describe "Server service" do
  include Rack::Test::Methods
    def app
      Sinatra::Application
    end

    describe "GET/" do
      it "returns 200 OK" do
        get "/"
        expect(last_response).to be_ok

    end

    it "includes I'm home" do
      get "/"
      expect(last_response.body).to include("I'm in home")
    end
  end


      it "redirect to /" do
        get "/come_back"

        expect(last_response.redirect?).to  be(true)
        follow_redirect!
        expect(last_request.path).to  eql("/")
      end
    end
