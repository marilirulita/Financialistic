class GroupsController < ApplicationController
  # GET /groups or /groups.json
  def index
    @groups = current_user.groups.all
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = current_user.groups.find(params[:id])
    @moves = @group.group_moves.map(&:move_id)
    @moves = Move.where(id: @moves).sort_by(&:created_at).reverse
    @total = @moves.inject(0) { |sum, move| sum + move.amount }
    @title = @group.name
  end

  # GET /groups/new
  def new
    @group = Group.new
    @title = 'New Category'
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
