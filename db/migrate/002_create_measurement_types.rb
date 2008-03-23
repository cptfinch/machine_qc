class CreateMeasurementTypes < ActiveRecord::Migration
  def self.up
    create_table :measurement_types do |t|
      t.integer :category_id
      t.string :name
      t.text :description

      t.timestamps 
    end
    MeasurementType.create(:category_id => 1, :name => "Output Measurement", :description => "you know the score")
  end

  def self.down
    drop_table :measurement_types
  end
end
