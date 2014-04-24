class SmsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false 

  def perform(name, msg)
    # set up a client to talk to the Twilio REST API 
    client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_AUTH_TOKEN"]
    client.account.sms.messages.create({
      :from => ENV["TWILIO_PHONE_FROM"],
      :to => ENV["TWILIO_PHONE_TO"],
      :body => "#{name}: #{msg}"
    })
  end

end