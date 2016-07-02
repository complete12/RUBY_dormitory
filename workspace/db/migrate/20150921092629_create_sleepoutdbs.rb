class CreateSleepoutdbs < ActiveRecord::Migration
  def change
    create_table :sleepoutdbs do |t|

      t.integer :domitory_id
      t.integer :student_number
      t.date  :apply_start_date
      t.date  :apply_end_date
      t.integer :apply
      
      t.timestamps null: false
      
    end
  end
end
