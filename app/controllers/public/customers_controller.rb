class Public::CustomersController < ApplicationController

  def show
  end

  def edit
  end

  def search
    if params[:name].present?
      @customers = Customer.where('name LIKE ?',"%#{params[:name]}%")
    else
      @customers = Customer.none
    end
  end

end