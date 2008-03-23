class ReportsController < ApplicationController
  
  def measurement
    @measurements = Measurement.find(:all)
    @measurement_data_link = formatted_measurement_reports_url(:xml)
    respond_to do |format|
      format.html
      format.xml  { render :action => "measurement.xml.builder", :layout => false }
    end
  end
  
end
