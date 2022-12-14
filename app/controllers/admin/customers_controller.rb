class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def destroy
    @customers = Customer.find(params[:id])
    @customers.destroy
    redirect_to admin_customers_path
  end

  def show
    #error後の更新時indexに移ってしまうため
    if params[:id]
      redirect_to edit_admin_customer_path
      return
    end
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    if @customers.update(customer_params)
      redirect_to admin_customers_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :image, :email, :is_deleted)
  end

end
