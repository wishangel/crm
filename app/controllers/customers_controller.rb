class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:edit, :new]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @customers = Customer.page(params[:page])
  end

  def new
    @customer = Customer.new
    # @companies = Company.all
    @comment = Comment.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  def edit
    # @customer = Customer.find(params[:id])
    
  end

  def update
    # @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    # @customer = Customer.find(params[:id])
    @comments = @customer.comments
    # @comments = Comment.where(customer_id: params[:id].to_i)
    @users = User.all
  end

  def destroy
    # @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_url
  end
  private
  
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def set_company
    @companies = Company.all
  end

  
  private 

  def customer_params
    params.require(:customer).permit(:family_name,:given_name,:email, :company_id)
  end

end
