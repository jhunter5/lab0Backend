class AlcaldiasController < ApplicationController
  before_action :set_alcaldia, only: [:show, :update, :destroy]
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

  private

  def set_alcaldia
    @alcaldia = Alcaldia.find(params[:id])
  end

  def alcaldia_params
    params.require(:alcaldia).permit(:direccion, :email, :presupuesto_anual, :fecha_inicio, :fecha_fin, :activo, :municipio_id)
  end
end
