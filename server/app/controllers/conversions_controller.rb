class ConversionsController < ApplicationController
  before_action :set_conversion, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:create]

  # We deliberately want to allow any client to submit conversions. This is
  # not a security concern because authenticity_tokens are relavent for
  # validating that a visitor requested content from our domain before executing
  # PUT/POST/PATCH/DELETE on resources
  skip_before_action :verify_authenticity_token, only: [:create]

  # GET /conversions
  # GET /conversions.json
  def index
    @conversions = Conversion.all
  end

  # GET /conversions/1
  # GET /conversions/1.json
  def show

  end

  # GET /conversions/new
  def new
    @conversion = Conversion.new
  end

  # GET /conversions/1/edit
  def edit
  end

  # POST /conversions
  # POST /conversions.json
  def create

    @conversion = Conversion.new(conversion_params.merge({user_agent: request.user_agent, ip_address: request.ip}))

    respond_to do |format|
      if @conversion.save
        format.html { redirect_to @conversion, notice: 'Conversion was successfully created.' }
        format.json { render :show, status: :created, location: @conversion }
      else
        format.html { render :new }
        format.json { render json: @conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversion
      @conversion = Conversion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversion_params
      params.require(:conversion).permit(:tracker_id)
    end
end
