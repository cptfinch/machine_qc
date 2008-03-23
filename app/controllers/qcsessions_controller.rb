class QcsessionsController < ApplicationController
  # GET /qcsessions
  # GET /qcsessions.xml
  def index
    @qcsessions = Qcsession.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @qcsessions }
    end
  end

  # GET /qcsessions/1
  # GET /qcsessions/1.xml
  def show
    @qcsession = Qcsession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @qcsession }
    end
  end

  # GET /qcsessions/new
  # GET /qcsessions/new.xml
  def new
    @qcsession = Qcsession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @qcsession }
    end
  end

  # GET /qcsessions/1/edit
  def edit
    @qcsession = Qcsession.find(params[:id])
  end

  # POST /qcsessions
  # POST /qcsessions.xml
  def create
    @qcsession = Qcsession.new(params[:qcsession])

    respond_to do |format|
      if @qcsession.save
        flash[:notice] = 'Qcsession was successfully created.'
        format.html { redirect_to(@qcsession) }
        format.xml  { render :xml => @qcsession, :status => :created, :location => @qcsession }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @qcsession.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /qcsessions/1
  # PUT /qcsessions/1.xml
  def update
    @qcsession = Qcsession.find(params[:id])

    respond_to do |format|
      if @qcsession.update_attributes(params[:qcsession])
        flash[:notice] = 'Qcsession was successfully updated.'
        format.html { redirect_to(@qcsession) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @qcsession.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /qcsessions/1
  # DELETE /qcsessions/1.xml
  def destroy
    @qcsession = Qcsession.find(params[:id])
    @qcsession.destroy

    respond_to do |format|
      format.html { redirect_to(qcsessions_url) }
      format.xml  { head :ok }
    end
  end
end
