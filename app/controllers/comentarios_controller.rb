class ComentariosController < ApplicationController
  before_action :set_comentario, only: %i[ show edit update destroy ]

  before_action only: [:destroy] do
    authorize_request(["admin"])
  end

  # GET /comentarios or /comentarios.json
  def index
    @comentarios = Comentario.all
  end

  # GET /comentarios/1 or /comentarios/1.json
  def show
    @notice = Notice.find(params[:notice_id])
   
  end

  # GET /comentarios/new
  def new
    @notice = Notice.find(params[:notice_id])
    @comentario = @notice.comentario.build
  end

  # GET /comentarios/1/edit
  def edit
  end

  # POST /comentarios or /comentarios.json
 def create
    @notice = Notice.find(params[:notice_id])
    @comentario = @notice.comentario.build(comentario_params)
    @comentario.user_id = current_user.id

    if @comentario.save
      redirect_to @notice, notice: 'El comentario se ha creado exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comentarios/1 or /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to comentario_url(@comentario), notice: "Comentario was successfully updated." }
        format.json { render :show, status: :ok, location: @comentario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1 or /comentarios/1.json
  def destroy
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to notice_path, notice: "Comentario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comentario_params
      params.require(:comentario).permit(:contenido)
    end
end
