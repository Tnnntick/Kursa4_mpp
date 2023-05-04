class UserPaymentsController < ApplicationController
  before_action :set_user_payment, only: %i[ show edit update destroy ]

  # GET /user_payments or /user_payments.json
  def index
    @user_payments = UserPayment.all
  end

  # GET /user_payments/1 or /user_payments/1.json
  def show
  end

  # GET /user_payments/new
  def new
    @user_payment = UserPayment.new
  end

  # GET /user_payments/1/edit
  def edit
  end

  # POST /user_payments or /user_payments.json
  def create
    @user_payment = UserPayment.new(user_payment_params)

    respond_to do |format|
      if @user_payment.save
        format.html { redirect_to user_payment_url(@user_payment), notice: "User payment was successfully created." }
        format.json { render :show, status: :created, location: @user_payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_payments/1 or /user_payments/1.json
  def update
    respond_to do |format|
      if @user_payment.update(user_payment_params)
        format.html { redirect_to user_payment_url(@user_payment), notice: "User payment was successfully updated." }
        format.json { render :show, status: :ok, location: @user_payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_payments/1 or /user_payments/1.json
  def destroy
    @user_payment.destroy

    respond_to do |format|
      format.html { redirect_to user_payments_url, notice: "User payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_payment
      @user_payment = UserPayment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_payment_params
      params.require(:user_payment).permit(:user_id, :code, :cvv, :date, :name)
    end
end
