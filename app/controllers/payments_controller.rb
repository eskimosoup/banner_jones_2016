class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to payment_path(@payment.code)
    else
      render :new
    end
  end

  def show
    @payment = Payment.find_by!(code: params[:id])
  end

  private

  def payment_params
    params.require(:payment).permit(:invoice_number, :name, :contact_number, :amount)
  end
end
