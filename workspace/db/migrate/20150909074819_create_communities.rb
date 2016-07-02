class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :com_category
      t.string :com_title
      t.text :com_content
      t.string :com_writer #글번호
      t.integer :com_hits
      t.integer :com_studentID #작성자 학번

      t.timestamps null: false
    end
  end
end
