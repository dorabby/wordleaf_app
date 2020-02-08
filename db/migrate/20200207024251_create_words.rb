class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :name,null:false
      t.string :text,null:false
      t.text :details
      t.string :image
      
      t.references :user,foreign_key: true
      t.references :book,foreign_key: true
      t.timestamps
    end
  end
end
