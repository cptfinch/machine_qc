class Measurement < ActiveRecord::Base
  belongs_to :measurement_type
  belongs_to :qcsession
  belongs_to :machine
  
  delegate :name, :to => :measurement_type
end
