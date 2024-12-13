class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :update, :destroy, :vivienda_actual, :viviendas_propietarias]

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

  private

  def set_persona
    @persona = Persona.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Persona no encontrada' }, status: :not_found
  end

  def persona_params
    params.require(:persona).permit(:nombre, :edad, :vivienda_id, :telefono, :sexo)
  end
end
