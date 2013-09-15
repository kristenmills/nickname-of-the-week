class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy, :nicknameify]
  http_basic_authenticate_with  name: ENV['NICKNAME_USERNAME'],  password: ENV['NICKNAME_PASSWORD'], except: [:new, :create]
  # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = Suggestion.all
  end

  # GET /suggestions/1
  # GET /suggestions/1.json
  def show
  end

  # GET /suggestions/new
  def new
    @suggestion = Suggestion.new
  end

  # GET /suggestions/1/edit
  def edit
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = Suggestion.new(suggestion_params)

    respond_to do |format|
      if @suggestion.save
        SuggestionMailer.new_suggestion(@suggestion).deliver
        format.html { redirect_to root_path, notice: 'Suggestion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @suggestion }
      else
        format.html { render action: 'new' }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggestions/1
  # PATCH/PUT /suggestions/1.json
  def update
    respond_to do |format|
      if @suggestion.update(suggestion_params)
        format.html { redirect_to @suggestion, notice: 'Suggestion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestions/1
  # DELETE /suggestions/1.json
  def destroy
    @suggestion.destroy
    respond_to do |format|
      format.html { redirect_to suggestions_url }
      format.json { head :no_content }
    end
  end

  def nicknameify
    @nickname = Nickname.new(name: @suggestion.name, comment: @suggestion.description, submitter: @suggestion.submitter)
    respond_to do |format|
      if @nickname.save
        @suggestion.destroy
        format.html { redirect_to nicknames_path, notice: 'Nickname was succcesfully created. '}
        format.json { head :no_content}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:suggestion).permit(:name, :description, :submitter)
    end
end
