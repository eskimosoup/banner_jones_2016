class CallbackRequestsController < ApplicationController
  before_action :load_modules

  def new
    @callback_request = CallbackRequest.new
  end

  def create
    @callback_request = CallbackRequest.new(callback_request_params)
    process_callback_request(@callback_request)
  end

  private

  def process_callback_request(callback_request)
    if callback_request.valid?
      CallbackRequestMailer.new_callback_request(callback_request).deliver_now
      record_form_submission(callback_request)
    end
    respond_to do |format|
      format.html { html_callback_request(callback_request) }
      format.js { js_callback_request(callback_request) }
    end
  end

  def html_callback_request(callback_request)
    if callback_request.valid?
      redirect_to new_callback_request_path, notice: 'Thank you for your submission.'
    else
      render :new
    end
  end

  def js_callback_request(callback_request)
    flash.notice = 'Thank you for contacting us' if callback_request.valid?
  end

  def callback_request_params
    params.require(:callback_request)
          .permit!
  end

  def load_modules
    @offices = Office.displayed if Flipflop.offices?
  end
end
