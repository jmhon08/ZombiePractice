class BrainsController < ApplicationController
  before_action :set_brain, only: [:show, :edit, :update, :destroy]

  # GET /brains
  # GET /brains.json
  def index
    @brains = Brain.all
    respond_to do |format|
        format.html { render :index }
        format.json { render json: @brains }
    end

  end

  # GET /brains/1
  # GET /brains/1.json
  def show
  end

  # GET /brains/new
  def new
    @brain = Brain.new
  end

  # GET /brains/1/edit
  def edit
  end

  # POST /brains
  # POST /brains.json
  def create
    if !params[:brain][:zombie_name].empty?
      zombie = Zombie.find_by_name(params[:brain][:zombie_name])
      unless zombie.nil?
        brain_params[:zombie_id] = zombie.id
      end
    end

    @brain = Brain.new(brain_params)

    respond_to do |format|
      if @brain.save
        format.html { redirect_to brains_url, notice: 'Brain was successfully created.' }
        format.json { render :show, status: :created, location: brains_url }
      else
        format.html { render :new }
        format.json { render json: @brain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brains/1
  # PATCH/PUT /brains/1.json
  def update
    respond_to do |format|
      if @brain.update(brain_params)
        format.html { redirect_to brains_url, notice: 'Brain was successfully updated.' }
        format.json { render :show, status: :ok, location: brains_url }
      else
        format.html { render :edit }
        format.json { render json: @brain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brains/1
  # DELETE /brains/1.json
  def destroy
    @brain.destroy
    respond_to do |format|
      format.html { redirect_to brains_url, notice: 'Brain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brain
      @brain = Brain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brain_params
      @brain_params ||= params.require(:brain).permit(:zombie_id, :zombie_name, :status, :flavor)
    end
end
