class BillsController < ApplicationController
  before_action :validate_employee, only: [:new]
  before_action :fetch_user

  def index
    @bills = Bill.all
    @approved_count = @bills.select(:id).where(status: 'approved').count
  end

  def new
    @employee = Employee.find_by(user_id: @current_user.id)
  end

  def create
    @bill = Bill.new(bill_params)

    if @bill.save
      redirect_to bills_path
    else
      flash.now[:danger] = ''
      render 'new'
    end
  end

  def update
    @bill = Bill.find_by(id: params[:id])
    @bill.update(status: params[:bill][:status])
    redirect_to bills_path
  end

  private

  def bill_params
    params.permit(:bill_type, :amount, :employee_id)
  end

  def fetch_user
    @current_user = current_user
  end

  def validate_employee
    redirect_to root_path unless current_user.is_employee?
  end
end