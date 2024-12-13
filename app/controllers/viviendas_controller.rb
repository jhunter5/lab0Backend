class ViviendasController < ApplicationController
  before_action :set_vivienda, only: [:show, :edit, :update, :destroy, :habitantes, :propietarios, :municipio]

  # GET /viviendas
  def index
    @viviendas = Vivienda.all
    render json: @viviendas
  end

  # GET /viviendas/:id
  def show
    render json: @vivienda
  end

  # GET /viviendas/new
  def new
    @vivienda = Vivienda.new
  end

  # GET /viviendas/:id/edit
  def edit
  end

  # POST /viviendas
  def create
    @vivienda = Vivienda.new(vivienda_params)
    if @vivienda.save
      render json: @vivienda, status: :created
    else
      render json: @vivienda.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /viviendas/:id
  def update
    if @vivienda.update(vivienda_params)
      render json: @vivienda
    else
      render json: @vivienda.errors, status: :unprocessable_entity
    end
  end

  # DELETE /viviendas/:id
  def destroy
    @vivienda.destroy
    head :no_content
  end

  # Acción personalizada: Dada una vivienda, recuperar todas las personas que viven en ella
  def habitantes
    render json: @vivienda.personas
  end

  # Acción personalizada: Dada una vivienda, recuperar todas las personas que son dueñas
  def propietarios
    render json: @vivienda.dueños
  end

  # Acción personalizada: Dada una vivienda, recuperar el municipio al que pertenece
  def municipio
    render json: @vivienda.municipio
  end

  private

  def set_vivienda
    @vivienda = Vivienda.find(params[:id])
  end

  def vivienda_params
    params.require(:vivienda).permit(:direccion, :municipio_id)
  end
end
