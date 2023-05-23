require_relative "../helpers/fatsecret/fatsecret"
require "json"

# @fatsecretsource = FatsecretSource.init()
# respond_to do |format|
#   msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
#   format.json  { render :json => params[:query] } # don't do msg.to_json
# end
# return

class SourcesController < ApplicationController
  before_action :set_sources, only: %i[ request ]
  skip_before_action :verify_authenticity_token

  def open
    respond_to do |format|
      key = sources_params.values.join("/")
      response = Rails.cache.fetch(key, expires_in: 24.hours) do
        FatsecretSource.query(sources_params, oauth_secret[:oauth_secret] || "")
      end
      format.json { render :json => response } # don't do msg.to_json
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sources
    @source = sources_params
  end

  # Only allow a list of trusted parameters through.
  def sources_params
    params.except(:oauth_secret).permit!
  end

  def oauth_secret
    params.permit(:oauth_secret)
  end
end
