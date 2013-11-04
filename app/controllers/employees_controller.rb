class EmployeesController < ApplicationController

  def new
    @employee = Employee.new
  end
  def show
    @employee = Employee.find(params[:id])
    @events = @employee.events
    #@attendancs = @employee.where(employee_id:@employee.id)
  end
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      sign_in @employee
     redirect_to @employee
    else
      render 'new'
    end
  end
  private
  def employee_params
    params.require(:employee).permit(:name, :email, :password,
                                 :password_confirmation)
  end


end
