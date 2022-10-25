class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def destroy
    @customers = Customer.find(params[:id])
    @customers.destroy
    redirect_to admin_customers_path
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    @customers.update(customer_params)
    redirect_to admin_customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :image, :email, :is_deleted)
  end

end
