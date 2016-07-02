class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :notice_title
      t.text :notice_content
      t.integer :notice_hits
      t.timestamps null: false
    end
  end
end
