class MaterialsController < ApplicationController
  def get_tour
    @tour = current_user.tour.where(id: params[:tour_id).first
  end
  # GET /materials
  # GET /materials.json
  def index
    @tour = current_user.tour.where(id: params[:tour_id]).first
    @materials = @tour.material

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @materials }
    end
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
    @tour = current_user.tour.where(id: params[:tour_id]).first
    unless @tour
      return redirect_to tours_path, alert: "Asset doesn't exist for that tour"
    end
    @material = @tour.material.where(id: params[:id]).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @material }
    end
  end

  # GET /materials/new
  # GET /materials/new.json
  def new
    @tour = current_user.tour.where(id: params[:tour_id]).first
    unless @tour
      return redirect_to tours_path, alert: "can't create material for that tour"
    end
    @material = Material.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @material }
    end
  end

  # GET /materials/1/edit
  def edit
    @tour = current_user.tour.where(id: params[:tour_id]).first
    @material = @tour.material.where(id: params[:id]).first
  end

  # POST /materials
  # POST /materials.json
  def create
    @tour = current_user.tour.where(id: params[:tour_id]).first
    unless @tour
      return redirect_to tour_materials_path(@tour), alert: "Attempting to add material to invalid tour"
    end
    @material = @tour.material.build(params[:material])

    respond_to do |format|
      if @material.save
        format.html { redirect_to tour_material_path(@tour, @material), notice: 'Material was successfully created.' }
        format.json { render json: @material, status: :created, location: @material }
      else
        format.html { render action: "new" }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /materials/1
  # PUT /materials/1.json
  def update
    @tour = current_user.tour.where(id: params[:tour_id]).first
    unless @tour
      return redirect_to tour_materials_path(@tour), alert: "Can't update asset for unknown tour"
    end
    @material = @tour.material.where(id: params[:id]).first

    respond_to do |format|
      if @material.update_attributes(params[:material])
        format.html { redirect_to tour_material_path(@tour, @material), notice: 'Material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material = Tour.find(params[:tour_id]).material.where(id: params[:id]).first
    @material.destroy

    respond_to do |format|
      format.html { redirect_to materials_url }
      format.json { head :no_content }
    end
  end
end
