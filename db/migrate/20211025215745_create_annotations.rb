class CreateAnnotations < ActiveRecord::Migration[6.0]
  def change
    create_table :annotations do |t|
      t.string :title
      t.text :body
      t.date :date
      t.integer :priority

      t.timestamps
    end
  end
end
