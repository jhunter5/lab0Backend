class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :update, :destroy, :vivienda_actual, :viviendas_propietarias, :empleado]

  # GET /personas
  def index
    personas = Persona.all
    render json: personas
  end

  # GET /personas/:id
  def show
    render json: @persona
  end

  # POST /personas
  def create
    persona = Persona.new(persona_params)
    if persona.save
      render json: persona, status: :created
    else
      render json: { errors: persona.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /personas/:id
  def update
    if @persona.update(persona_params)
      render json: @persona
    else
      render json: { errors: @persona.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /personas/:id
  def destroy
    @persona.destroy
    head :no_content
  end

  # Dada una persona, obtener la casa en la que vive
  def vivienda_actual
    render json: @persona.vivienda
  end

  # Dada una persona, obtener las casas de las que es dueño
  def viviendas_propietarias
    render json: @persona.viviendas_propietarias
  end

  #Dada una pesona recuperar si es empleado de una alcaldia
  def empleado
    empleado = @persona.empleado
    if empleado
      render json: {
        salario: empleado.salario,
        tipo_contrato: empleado.tipo_contrato,
        años_experiencia: empleado.años_experiencia,
        fecha_ingreso: empleado.fecha_ingreso,
        activo: empleado.activo,
        rol_nombre: empleado.rol.nombre, # Aquí recuperamos el nombre del rol asociado
        alcaldia: empleado.alcaldia.municipio.nombre # Aquí recuperamos el nombre del municipio asociado a la alcaldía
      }
    else
      render json: { error: 'No se encontró un empleado asociado a esta persona' }, status: :not_found
    end
  end


  private

  def set_persona
    @persona = Persona.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Persona no encontrada', mensaje: "No se encontró una persona con ID #{params[:id]}" }, status: :not_found
  end

  def persona_params
    params.require(:persona).permit(:nombre, :edad, :vivienda_id, :telefono, :sexo)
  end
end
