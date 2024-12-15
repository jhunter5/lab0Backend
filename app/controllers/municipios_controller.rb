class MunicipiosController < ApplicationController
  before_action :set_municipio, only: [:show, :edit, :update, :destroy, :viviendas, :alcaldia, :alcalde]

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

  def alcaldia
    alcaldia = @municipio.alcaldias.find_by(activo: true)

    if alcaldia
      render json: alcaldia
    else
      render json: { error: 'No se encontró una alcaldía activa para este municipio' }, status: 404
    end
  end

  def alcalde
    rol_id = Rol.find_by(nombre: 'Alcalde').id
    alcalde = @municipio.alcaldias.find_by(activo: true).empleados.find_by(rol_id: rol_id)

    if alcalde
      render json: {
        municipio: @municipio.nombre,
        nombre: alcalde.persona.nombre,
        edad: alcalde.persona.edad,
        sexo: alcalde.persona.sexo
      }
    else
      render json: { error: 'No se encontró un alcalde activo para este municipio' }, status: 404
    end
  end


  private

  def set_municipio
    @municipio = Municipio.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Municipio no encontrado', mensaje: "No se encontró un municipio con ID #{params[:id]}" }, status: :not_found
  end

  def municipio_params
    params.require(:municipio).permit(:nombre, :area, :presupuesto)
  end
end
