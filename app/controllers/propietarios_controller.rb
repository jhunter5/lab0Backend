class PropietariosController < ApplicationController
  before_action :set_propietario, only: [:show, :edit, :update, :destroy]

  # GET /propietarios
  def index
    @propietarios = Propietario.all
    render json: @propietarios
  end

  # GET /propietarios/:id
  def show
    render json: @propietario
  end

  # GET /propietarios/new
  def new
    @propietario = Propietario.new
  end

  # GET /propietarios/:id/edit
  def edit
  end

  # POST /propietarios
  def create
    @propietario = Propietario.new(propietario_params)
    if @propietario.save
      render json: @propietario, status: :created
    else
      render json: @propietario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /propietarios/:id
  def update
    if @propietario.update(propietario_params)
      render json: @propietario
    else
      render json: @propietario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /propietarios/:id
  def destroy
    @propietario.destroy
    head :no_content
  end

  private

  def set_propietario
    @propietario = Propietario.find(params[:id])
  end

  def propietario_params
    params.require(:propietario).permit(:persona_id, :vivienda_id)
  end
end
