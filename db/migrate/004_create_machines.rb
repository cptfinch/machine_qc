class CreateMachines < ActiveRecord::Migration
  def self.up
    create_table :machines do |t|
      t.string :name

      t.timestamps 
    end
    Machine.create(:name => "Oncor H3")
  end

  def self.down
    drop_table :machines
  end
end
