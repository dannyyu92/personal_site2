class AboutController < ApplicationController
  def index
    @smsmessage = SmsMessage.new
  end

  def create
    @smsmessage = SmsMessage.new(sms_params)
    if @smsmessage.valid?
      SmsWorker.perform_async(@smsmessage.name, @smsmessage.message)
      redirect_to about_index_path, notice: "SMS successfully sent. Thanks!"
    else
      flash.now[:notice] = "Name or message field cannot be blank!"
      render :index
    end
  end

  private
  def sms_params
    params.require(:sms_message).permit(:name, :message)
  end
end