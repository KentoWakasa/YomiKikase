class Public::CustomersController < ApplicationController

  def show
    #error後の更新時indexに移ってしまうため
    if params[:id]
      redirect_to edit_public_customer_path
      return
    end
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    if @customers.update(customer_params)
      if @customers.is_deleted == false
        redirect_to public_voice_posts_path(controller: 'voice_posts', action: 'index', id: @customers.id)
      else
        reset_session
        redirect_to root_path
      end
    else
      render :edit
    end
  end

  def search
    if params[:name].present?
      @customers = Customer.where('name LIKE ?',"%#{params[:name]}%")
    else
      @customers = Customer.none
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :image, :email, :is_deleted)
  end

end