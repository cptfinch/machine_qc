xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.chart do
  # xml.message "You can broadcast any message to chart from data XML file", :bg_color => "#FFFFFF", :text_color => "#000000"
  xml.series do    
    @measurements.each_with_index do |measurement, index|
      xml.value measurement.machine.name, :xid => index
    end
  end
  xml.graphs do
   #the gid is used in the settings file to set different settings just for this graph
    xml.graph :gid => 1 do
      @measurements.each_with_index do |measurement, index|
        measured_value = measurement.value
        if measured_value >32
          # When the population is > 1 million, show the bar in red/pink
          xml.value measured_value, :xid => index, :color => "#444444", :gradient_fill_colors => "#444444,#000055", :description => measurement.machine.name
        else
          xml.value measured_value, :xid => index, :color => "#444444", :gradient_fill_colors => "#444444,#000000", :description => measurement.machine.name
        end
      end
    end
  end
end