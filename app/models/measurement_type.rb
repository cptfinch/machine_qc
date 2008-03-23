class MeasurementType < ActiveRecord::Base
  has_many :measurements
  belongs_to :category
end
