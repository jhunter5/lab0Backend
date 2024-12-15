class AlcaldiasController < ApplicationController
  before_action :set_alcaldia, only: [:show, :update, :destroy, :empleados]
  def index
    alcaldias = Alcaldia.all
    render json: alcaldias
  end

  def show
    render json: @alcaldia
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Alcaldia no encontrada' }, status: :not_found
  end

  def create
    @alcaldia = Alcaldia.new(alcaldia_params)
    if @alcaldia.save
        render json: @alcaldia, status: :created
    else
        render json: @alcaldia.erros, status: :unprocessable_entity
    end
  end

  def update
    if @alcaldia.update(alcaldia_params)
      render json: @alcaldia
    else
      render json: @alcaldia.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @alcaldia.destroy
    head :no_content
  end

  def empleados
    @empleados_activos = @alcaldia.empleados.where(activo: true)
  
    empleados_json = @empleados_activos.map do |empleado|
      {
        id: empleado.id,
        salario: empleado.salario,
        tipo_contrato: empleado.tipo_contrato,
        años_experiencia: empleado.años_experiencia,
        fecha_ingreso: empleado.fecha_ingreso,
        persona: {
          id: empleado.persona.id,
          nombre: empleado.persona.nombre,
          edad: empleado.persona.edad,
          telefono: empleado.persona.telefono,
          sexo: empleado.persona.sexo
        },
        rol: {
          id: empleado.rol.id,
          nombre: empleado.rol.nombre
        }
      }
    end
    
    render json: empleados_json
  end
  
  
  private

  def set_alcaldia
    @alcaldia = Alcaldia.find(params[:id])
  end

  def alcaldia_params
    params.require(:alcaldia).permit(:direccion, :email, :presupuesto_anual, :fecha_inicio, :fecha_fin, :activo, :municipio_id)
  end
end
