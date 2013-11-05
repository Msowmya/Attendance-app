class SessionsController < ApplicationController
  def new

  end
  def create
    employee = Employee.find_by(email: params[:session][:email].downcase)
    if employee && employee.authenticate(params[:session][:password])
      sign_in employee
      x = DateTime.now
      @attendanc = Attendanc.new(employee_id:employee.id,signin_time:DateTime.now,signout_time:DateTime.new(x.year, x.month, x.day, x.hour, x.min, x.sec))
      @attendanc.save
      redirect_to employee
    else
      render 'new'
    end

  end
  def destroy
    sign_out


    redirect_to root_url
  end


end
