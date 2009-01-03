class CreateLocks < ActiveRecord::Migration
  def self.up
    create_table :locks do |t|
      t.integer :locked_id
      t.string :locked_type
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :locks
  end
end
