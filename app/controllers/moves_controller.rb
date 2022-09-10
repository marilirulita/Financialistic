class MovesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_move, only: %i[show edit update destroy]

  # GET /moves or /moves.json
  def index
    @moves = current_user.moves.all
  end

  # GET /moves/1 or /moves/1.json
  def show; end

  # GET /moves/new
  def new
    @group = current_user.groups.find(params[:group_id])
  end

  # POST /moves or /moves.json
  def create
    @move = Move.new(move_params)
    @group = current_user.groups.find(params[:move][:group_id])

    if @move.save
      @group.group_moves.create(move_id: @move.id)
      redirect_to group_path(@group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /moves/1 or /moves/1.json
  def destroy
    @move.destroy

    respond_to do |format|
      format.html { redirect_to moves_url, notice: 'Move was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_move
    @move = Move.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def move_params
    params.require(:move).permit(:name, :amount, :author_id)
  end
end
