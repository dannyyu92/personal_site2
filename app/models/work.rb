class Work < ActiveRecord::Base
  validates :name, :body, presence: true
end
