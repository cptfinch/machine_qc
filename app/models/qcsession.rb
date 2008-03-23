class Qcsession < ActiveRecord::Base
  belongs_to :machine
  has_many :measurements
end
