class ZombiesController < ApplicationController
  before_action :set_zombie, only: [:show, :edit, :update, :destroy, :age]
  before_action :authenticate_zombie!
  before_action :can_edit?, only: [:edit]

  # GET /zombies
  # GET /zombies.json
  def index
    @zombies = Zombie.all
    respond_to do |format|
        format.html { render :index }
        format.json { render json: @zombies }
    end
  end

  # GET /zombies/1
  # GET /zombies/1.json
  def show
  end

  # GET /zombies/new
  def new
    @zombie = Zombie.new
  end

  # GET /zombies/1/edit
  def edit
    @roles = Role.all
  end

  # POST /zombies
  # POST /zombies.json
  def create
    @zombie = Zombie.new(zombie_params)

    respond_to do |format|
      if @zombie.save
        format.html { redirect_to @zombie, notice: 'Zombie was successfully created.' }
        format.json { render :show, status: :created, location: @zombie }
      else
        format.html { render :new }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zombies/1
  # PATCH/PUT /zombies/1.json
  def update
    @zombie.roles = Role.where(:id => params[:role_ids])

    respond_to do |format|
      if @zombie.update(zombie_params)
        format.html { redirect_to @zombie, notice: 'Zombie was successfully updated.' }
        format.json { render :show, status: :ok, location: @zombie }
      else
        format.html { render :edit }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  def age
    render json: @zombie.to_json({ include: :brain, except: [:created_at, :updated_at, :id] }), status: :ok
  end

  def fresh
    @zombies_fresh = Zombie.where("age < ?", 13)
    render json: @zombies_fresh, status: :ok
  end

  # DELETE /zombies/1
  # DELETE /zombies/1.json
  def destroy
    @zombie.destroy
    respond_to do |format|
      format.html { redirect_to zombies_url, notice: 'Zombie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zombie
      @zombie = Zombie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zombie_params
      params.require(:zombie).permit(:name, :bio, :age, :role_ids)
    end

    def can_edit?
      if !(@zombie == current_zombie || current_zombie.admin?)
        redirect_to @zombie, flash: { danger: 'You can\'t edit this zombie.' }
      end
    end
end
