class AddAttachmentPdfToResumes < ActiveRecord::Migration
  def self.up
    change_table :resumes do |t|
      t.attachment :pdf
    end
  end

  def self.down
    drop_attached_file :resumes, :pdf
  end
end
