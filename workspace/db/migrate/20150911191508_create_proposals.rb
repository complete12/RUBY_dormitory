class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :p_category
      t.string :p_answer
      t.string :p_title
      t.text :p_content
      t.integer :p_studentID

      t.timestamps null: false
    end
  end
end
