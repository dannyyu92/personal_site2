class Project < ActiveRecord::Base
  validates :name, :body, presence: true
end
