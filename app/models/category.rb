class Category < ActiveRecord::Base
  has_many :measurement_types
end
