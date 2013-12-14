class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :posttype
      t.text :body
      t.datetime :date

      t.timestamps
    end
  end
end
