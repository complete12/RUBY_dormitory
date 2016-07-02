class CreateCroomdbs < ActiveRecord::Migration
  def change
    create_table :croomdbs do |t|

      t.integer :domitory_id
      t.integer :student_number
      t.date :apply_date
      t.integer :apply, default:0
      t.timestamps null: false
    end
  end
end