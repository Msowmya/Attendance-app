class SupervisorController < ApplicationController
  http_basic_authenticate_with name: "ms", password: "secret"
  def dashboard
  end


end
