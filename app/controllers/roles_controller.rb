class RolesController < ApplicationController
  before_action :set_rol, only: [:show, :update, :destroy]

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
    head: no_content
  end

  private

  def set_rol
    @rol = Rol.find(params[:id])
  end

  def rol_params
    params.require(:role).permit(:nombre, :descripcion, :activo)
  end
end
