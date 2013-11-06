class AttendancsController < ApplicationController
  before_action :signed_in_user, only: :create
  def show
    @attendanc = find_attendanc
  end

  def create
    @attendanc = current_employee.attendanc
    @attendanc.save

  end
  def update
    @attendanc = find_attendanc
     @attendanc.update_attributes(params[:attendanc])
  end
  private
  def find_attendanc
    Attendanc.find params[:id]
    #params.require(:attendanc).permit(:signin_time, :signout_time)
  end
end
