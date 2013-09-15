class NicknamesController < ApplicationController
  before_action :set_nickname, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with  name: ENV['NICKNAME_USERNAME'], password: ENV['NICKNAME_PASSWORD']
  # GET /nicknames
  # GET /nicknames.json
  def index
    @nicknames = Nickname.all
  end

  # GET /nicknames/1
  # GET /nicknames/1.json
  def show
  end

  # GET /nicknames/new
  def new
    @nickname = Nickname.new
  end

  # GET /nicknames/1/edit
  def edit
  end

  # POST /nicknames
  # POST /nicknames.json
  def create
    @nickname = Nickname.new(nickname_params)

    respond_to do |format|
      if @nickname.save
        format.html { redirect_to @nickname, notice: 'Nickname was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nickname }
      else
        format.html { render action: 'new' }
        format.json { render json: @nickname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nicknames/1
  # PATCH/PUT /nicknames/1.json
  def update
    respond_to do |format|
      if @nickname.update(nickname_params)
        format.html { redirect_to @nickname, notice: 'Nickname was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nickname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nicknames/1
  # DELETE /nicknames/1.json
  def destroy
    @nickname.destroy
    respond_to do |format|
      format.html { redirect_to nicknames_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nickname
      @nickname = Nickname.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nickname_params
      params.require(:nickname).permit(:name, :comment, :rating, :submitter, :week_id)
    end
end
