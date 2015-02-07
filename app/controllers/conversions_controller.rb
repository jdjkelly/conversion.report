class ConversionsController < ApplicationController
  # We deliberately want to allow any client to submit conversions. This is
  # not a security concern because authenticity_tokens are relavent for
  # validating that a visitor requested content from our domain before executing
  # PUT/POST/PATCH/DELETE on resources
  skip_before_action :verify_authenticity_token, only: [:create]

  # POST /conversions
  # POST /conversions.json
  def create
    @conversion = Conversion.new(conversion_params.merge({
      user_agent: request.user_agent,
      ip_address: request.ip
    }))

    respond_to do |format|
      if @conversion.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def conversion_params
    params.require(:conversion).permit(:tracker_id)
  end
end
