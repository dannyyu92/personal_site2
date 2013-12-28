class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.text :body
      t.string :site_link

      t.timestamps
    end
  end
end
