class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]

  # GET /players or /players.json
  def index
    @players = Player.all
  end

  # GET /players/1 or /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    @player = Player.where(username: player_params[:username]).first_or_initialize

    respond_to do |format|
      if @player.new_record?
        if @player.save
          session[:current_player_id] = @player.id
          format.html { redirect_to player_url(@player), notice: "Player was successfully created." }
          format.json { render :show, status: :created, location: @player }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @player.errors, status: :unprocessable_entity }
        end
        @player.broadcast_replace_later_to 'players', partial: 'players/player'
      else
        session[:current_player_id] = @player.id
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to player_url(@player), notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
      @player.broadcast_replace_later_to 'players', partial: 'players/player'
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:username, :wins)
    end
end
