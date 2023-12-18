class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.string :source
      t.text :extract
      t.datetime :date

      t.timestamps
    end
  end
end
