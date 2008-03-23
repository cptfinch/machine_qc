class CreateMeasurements < ActiveRecord::Migration
  def self.up
    create_table :measurements do |t|
      t.integer :measurement_type_id
      t.integer :qcsession_id
      t.integer :value
      t.integer :machine_id

      t.timestamps 
    end
    Measurement.create(:measurement_type_id => 1, :qcsession_id => 1, :value => 10, :machine_id => 1)
  end

  def self.down
    drop_table :measurements
  end
end
