class EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:show, :update, :destroy]

  def index
    empleados = Empleado.all
    render json: empleados
  end


  def show
    render json: @empleado
  end

  def create
    @empleado = Empleado.new(empleado_params)
    if @empleado.save
        render json: @empleado, status: :created
    else
        render json: @empleado.erros, status: :unprocessable_entity
    end
  end

  def update
    if @empleado.update(empleado_params)
      render json: @empleado
    else
      render json: @empleado.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @empleado.destroy
    head :no_content
  end

  private

  def set_empleado
    @empleado = Empleado.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Empleado no encontrado', mensaje: "No se encontró un empleado con ID #{params[:id]}" }, status: :not_found
  end

  def empleado_params
    params.require(:empleado).permit(:salario, :tipo_contrato, :años_experiencia, :fecha_ingreso, :activo, :alcaldias_id, :persona_id, :roles_id)
  end
end
