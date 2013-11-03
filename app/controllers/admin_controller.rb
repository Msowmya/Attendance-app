class AdminController < ApplicationController
  http_basic_authenticate_with name: "cp", password: "secret"
  def dashboard
  end
end
