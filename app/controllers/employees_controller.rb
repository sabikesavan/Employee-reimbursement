class EmployeesController < ApplicationController
  before_action :validate_admin_user
  before_action :fetch_employee, only: [:show, :update, :destroy]
  before_action :fetch_departments, only: [:new, :show]

  def index
    @employees = Employee.all
  end

  def new
  end

  def create
    @employee = Employee.create(employee_params)

    if @employee.save
      redirect_to employees_path
    else
      flash.now[:danger] = 'Invalid email/password'
      render 'new'
    end
  end

  def show
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path
    else

    end
  end

  def destroy
    @employee.destroy
  end

  private

  def employee_params
    params.permit(:first_name, :last_name, :email, :designation, :department_id)
  end

  def validate_admin_user
    redirect_to bills_path unless current_user.is_admin?
  end

  def fetch_employee
    @employee = Employee.find_by(id: params[:id])
  end

  def fetch_departments
    @departments = Department.all
  end
end