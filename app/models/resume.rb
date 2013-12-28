class Resume < ActiveRecord::Base
  has_attached_file :pdf, :default_url => "#"
  validates_attachment :pdf, content_type: { content_type: "application/pdf" }
end
