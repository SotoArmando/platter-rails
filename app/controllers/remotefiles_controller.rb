class RemotefilesController < ApplicationController
  before_action :set_remotefile, only: %i[ show edit update destroy ]

  # GET /remotefiles or /remotefiles.json
  def index
    @remotefiles = Remotefile.all
  end

  # GET /remotefiles/1 or /remotefiles/1.json
  def show
  end

  # GET /remotefiles/new
  def new
    @remotefile = Remotefile.new
  end

  # GET /remotefiles/1/edit
  def edit
  end

  # POST /remotefiles or /remotefiles.json
  def create
    @remotefile = Remotefile.new(remotefile_params)

    respond_to do |format|
      if @remotefile.save
        format.html { redirect_to remotefile_url(@remotefile), notice: "Remotefile was successfully created." }
        format.json { render :show, status: :created, location: @remotefile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @remotefile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /remotefiles/1 or /remotefiles/1.json
  def update
    respond_to do |format|
      if @remotefile.update(remotefile_params)
        format.html { redirect_to remotefile_url(@remotefile), notice: "Remotefile was successfully updated." }
        format.json { render :show, status: :ok, location: @remotefile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @remotefile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remotefiles/1 or /remotefiles/1.json
  def destroy
    @remotefile.destroy

    respond_to do |format|
      format.html { redirect_to remotefiles_url, notice: "Remotefile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remotefile
      @remotefile = Remotefile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def remotefile_params
      params.fetch(:remotefile, {})
    end
end
