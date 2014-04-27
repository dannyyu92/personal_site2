class SmsMessage < ActiveRecord::Base
  has_no_table

  column :name, :string
  column :message, :string

  validates_presence_of :name
  validates_presence_of :message
  validates_length_of :message, maximum: 500

end