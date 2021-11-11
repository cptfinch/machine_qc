class MeasurementTypesController < ApplicationController
  before_filter :get_category#, :except => :index
  
  # GET /measurement_types
  # GET /measurement_types.xml
  def index
    @measurement_types = @category.measurement_types

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @measurement_types }
    end
  end

  # GET /measurement_types/1
  # GET /measurement_types/1.xml
  def show
    @measurement_type = MeasurementType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @measurement_type }
    end
  end

  # GET /measurement_types/new
  # GET /measurement_types/new.xml
  def new
    @measurement_type = MeasurementType.new
    @categories = Category.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @measurement_type }
    end
  end

  # GET /measurement_types/1/edit
  def edit
    @measurement_type = MeasurementType.find(params[:id])
  end

  # POST /measurement_types
  # POST /measurement_types.xml
  def create
    @measurement_type = MeasurementType.new(params[:measurement_type])
    puts 'arse1'
    @measurement_type.category = @category
    puts 'arse2'
    respond_to do |format|
      if @measurement_type.save
        flash[:notice] = 'MeasurementType was successfully created.'
        format.html { redirect_to(@category) }
        format.xml  { render :xml => @measurement_type, :status => :created, :location => @measurement_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @measurement_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /measurement_types/1
  # PUT /measurement_types/1.xml
  def update
    @measurement_type = MeasurementType.find(params[:id])

    respond_to do |format|
      if @measurement_type.update_attributes(params[:measurement_type])
        flash[:notice] = 'MeasurementType was successfully updated.'
        format.html { redirect_to(@measurement_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @measurement_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /measurement_types/1
  # DELETE /measurement_types/1.xml
  def destroy
    @measurement_type = MeasurementType.find(params[:id])
    @measurement_type.destroy

    respond_to do |format|
      format.html { redirect_to(measurement_types_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def get_category
    @category = Category.find(params[:category_id])
  end
end
