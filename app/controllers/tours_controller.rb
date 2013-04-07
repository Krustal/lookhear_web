class ToursController < ApplicationController
  before_filter :authenticate_user!

  # GET /tours
  # GET /tours.json
  def index
    @tours = current_user.tour

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tours }
    end
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    @tour = current_user.tour.where(id: params[:id]).first
    unless @tour
      return redirect_to tours_path
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tour }
    end
  end

  # GET /tours/new
  # GET /tours/new.json
  def new
    @tour = Tour.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tour }
    end
  end

  # GET /tours/1/edit
  def edit
    @tour = current_user.tour.find(params[:id])
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = current_user.tour.build(params[:tour])

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render json: @tour, status: :created, location: @tour }
      else
        format.html { render action: "new" }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tours/1
  # PUT /tours/1.json
  def update
    @tour = current_user.tour.find(params[:id])

    respond_to do |format|
      if @tour.update_attributes(params[:tour])
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour = current_user.tour.find(params[:id])
    @tour.destroy

    respond_to do |format|
      format.html { redirect_to tours_url }
      format.json { head :no_content }
    end
  end
end
