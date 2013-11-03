class SessionsController < ApplicationController
  def new

  end
  def create
    employee = Employee.find_by(email: params[:session][:email].downcase)
    if employee && employee.authenticate(params[:session][:password])
      sign_in employee

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
