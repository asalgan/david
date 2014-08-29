class CreateBlog < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.datetime :date
      t.text :content
      t.timestamps
    end
  end
end
