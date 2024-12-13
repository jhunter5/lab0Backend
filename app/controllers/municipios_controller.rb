class MunicipiosController < ApplicationController
  before_action :set_municipio, only: [:show, :edit, :update, :destroy, :viviendas, :alcalde]

  # GET /municipios
  def index
    @municipios = Municipio.all
    render json: @municipios
  end

  # GET /municipios/:id
  def show
    render json: @municipio
  end

  # GET /municipios/new
  def new
    @municipio = Municipio.new
  end

  # GET /municipios/:id/edit
  def edit
  end

  # POST /municipios
  def create
    @municipio = Municipio.new(municipio_params)
    if @municipio.save
      render json: @municipio, status: :created
    else
      render json: @municipio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /municipios/:id
  def update
    if @municipio.update(municipio_params)
      render json: @municipio
    else
      render json: @municipio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /municipios/:id
  def destroy
    @municipio.destroy
    head :no_content
  end

  # Acción personalizada: Dado un municipio, recuperar todas las casas que pertenecen a ese municipio
  def viviendas
    render json: @municipio.viviendas
  end

  # Acción personalizada: Dado un municipio, recuperar a la persona que es su alcalde
  def alcalde
    render json: @municipio.alcade
  end

  private

  def set_municipio
    @municipio = Municipio.find(params[:id])
  end

  def municipio_params
    params.require(:municipio).permit(:nombre, :persona_id, :area, :presupuesto )
  end
end
