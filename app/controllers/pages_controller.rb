class PagesController < ApplicationController
  def blog
    @event = current_employee.events.build if signed_in?
  end
end
