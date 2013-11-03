require 'spec_helper'

describe AdminController do
  describe "GET 'dashboard'" do
    it "returns http success" do
      http_login('cp', 'secret')
      get 'dashboard'
      response.should be_success
    end
  end
end
