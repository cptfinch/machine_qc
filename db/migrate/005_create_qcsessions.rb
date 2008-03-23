class CreateQcsessions < ActiveRecord::Migration
  def self.up
    create_table :qcsessions do |t|
      t.integer :machine_id

      t.timestamps 
    end
    Qcsession.create(:machine_id => 1 )
  end

  def self.down
    drop_table :qcsessions
  end
end
