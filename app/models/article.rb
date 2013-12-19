class Article < ActiveRecord::Base
	validates :name, :body, :date, presence: true
end
