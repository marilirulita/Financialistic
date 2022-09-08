class GroupsController < ApplicationController
  # GET /groups or /groups.json
  def index
    @groups = current_user.groups.all
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find(params[:id])
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

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
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
