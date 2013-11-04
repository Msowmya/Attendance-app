class AttendancsController < ApplicationController
  before_action :signed_in_user, only: :create
  def show
    @attendanc = Attendanc.find(params[:id])
  end

  def create
    @attendanc = current_employee.attendanc
    @attendanc.save

  end
 # private
  #def attendanc_params

   # params.require(:attendanc).permit(:signin_time, :signout_time)
  #end
end
