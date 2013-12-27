class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :body
      t.string :github
      t.string :site_link

      t.timestamps
    end
  end
end
