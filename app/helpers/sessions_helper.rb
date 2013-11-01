module SessionsHelper
  def sign_in(employee)
    remember_token = Employee.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    employee.update_attribute(:remember_token, Employee.encrypt(remember_token))
    self.current_employee = employee
  end
  def signed_in?
    !current_employee.nil?
  end

  def current_employee=(employee)
    @current_employee = employee
  end
  def current_employee
    remember_token = Employee.encrypt(cookies[:remember_token])
    @current_employee ||= Employee.find_by(remember_token: remember_token)     # Useless! Don't use this line.
  end
  def sign_out
    self.current_employee = nil
    cookies.delete(:remember_token)
  end

end
