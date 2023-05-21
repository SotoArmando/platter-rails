require_relative "../helpers/fatsecret/fatsecret"


class SourcesController < ApplicationController
  before_action :set_sources, only: %i[ request ]


  def request
    # @fatsecretsource = FatsecretSource.init()
    respond_to do |format|
      msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
      format.json  { render :json => params[:query] } # don't do msg.to_json
    end
    # return @fatsecretsource.get(params[:query])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sources
      @source = sources_params
    end

    # Only allow a list of trusted parameters through.
    def sources_params
      params.fetch(:query, {})
      # params.require(query: {})
    end
end
