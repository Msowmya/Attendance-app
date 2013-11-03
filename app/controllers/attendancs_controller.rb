class AttendancsController < ApplicationController
  def show

  end
  def calendar

  end
  def create
    @attendanc = current_employee.attendancs.build(attendanc_params)
     @attendanc.save
      redirect_to root_path
  end
  private
  def attendanc_params
    params.require(:attendanc).permit(:signin_time, :signout_time)
  end
end
