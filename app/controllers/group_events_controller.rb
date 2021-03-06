class GroupEventsController < ApplicationController
  before_action :set_group_event, only: [:show, :edit, :update, :destroy]

  # GET /group_events.json
  def index
    @group_events = GroupEvent.all
  end

  # GET /group_events/1.json
  def show
  end

  # GET /group_events/new
  def new
    @group_event = GroupEvent.new
  end

  # GET /group_events/1/edit
  def edit
  end

  # POST /group_events.json
  def create
    @group_event = GroupEvent.new(group_event_params)
    if @group_event.save
      render :show, status: :created, location: @group_event
    else
      render json: @group_event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /group_events/1.json
  def update
    if @group_event.update(group_event_params)
      render :show, status: :ok, location: @group_event
    else
      render json: @group_event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /group_events/1.json
  def destroy
    @group_event.update_attribute(:removed, true)
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_event
      @group_event = GroupEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_event_params
      params.require(:group_event).permit(:name, :description, :location, :start_at, :end_at, :status, :duration)
    end
  end
