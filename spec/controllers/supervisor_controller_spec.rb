require 'spec_helper'

describe SupervisorController do
  describe "GET 'dashboard'" do
    it "returns http success" do
      http_login('ms', 'secret')
      get 'dashboard'
      response.should be_success
    end
  end

end
