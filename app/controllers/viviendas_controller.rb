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
    propietarios = @vivienda.propietarios
    if propietarios
      render json: {
        direccion: @vivienda.direccion,
        municipio: @vivienda.municipio.nombre,
        dueños: propietarios.map { |propietario| propietario.persona }
      }
    else
      render json: { error: 'No hay propietarios para esta vivienda' }, status: :not_found
    end

  end

  # Acción personalizada: Dada una vivienda, recuperar el municipio al que pertenece
  def municipio
    render json: @vivienda.municipio
  end

  private

  def set_vivienda
    @vivienda = Vivienda.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render json: { error: 'Vivienda no encontrada', mensaje: "No se encontró una vivienda con ID #{params[:id]}" }, status: :not_found
  end

  def vivienda_params
    params.require(:vivienda).permit(:direccion, :capacidad, :niveles, :municipio_id)
  end
end
