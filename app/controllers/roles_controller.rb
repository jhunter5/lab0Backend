class RolesController < ApplicationController
  before_action :set_rol, only: [:show, :update, :destroy, :empleados]

  def index
    roles = Rol.all
    render json: roles
  end

  def show
    render json: @rol
  end

  def create
    @rol = Rol.new(rol_params)
    if @rol.save
        render json: @rol, status: :created
    else
        render json: @rol.error, status: :unprocessable_entity
    end
  end

  def update
    if @rol.update(rol_params)
      render json: @rol, status: :accepted
    else
      render json: @rol.error, status: :unprocessable_entity
    end
  end

  def destroy
    @rol.destroy
    head :no_content
  end



  # dado un rol recuperar todos los empleados que tienen ese rol

  def empleados
    empleados = @rol.empleados.includes(:persona) # Incluye la relación 'persona' para cargarla en la consulta
    if empleados.any?
      render json: empleados.map do |empleado|
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
    else
      render json: { error: 'No se encontraron empleados con ese rol' }, status: 404
    end
  end

  private

  def set_rol
    @rol = Rol.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render json: { error: 'Rol no encontrado', mensaje: "No se encontró un rol con ID #{params[:id]}" }, status: :not_found
  end

  def rol_params
    params.require(:role).permit(:nombre, :descripcion, :activo)
  end

end
