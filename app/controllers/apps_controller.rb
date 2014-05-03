class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  # GET /apps
  # GET /apps.json
  def index
    @apps = App.all
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
  end

  # POST /apps
  # POST /apps.json
  def create
    # build an app and pass it into a block to set other attributes
    @app = App.new(app_params)
    #@app = App.new(app_params) do |a|
    #  if params[:app][:file_upload]
    #    a.file_data  = params[:app][:file_upload].read
    #    a.file_name  = params[:app][:file_upload].original_filename
    #    a.file_mime_type = params[:app][:file_upload].content_type
    #  end
    #end

    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update
    # build an app and pass it into a block to set other attributes
    #params_with_file_stuff = app_params
    #if params[:app][:file_upload]
    #  params_with_file_stuff[:file_data]  = params[:app][:file_upload].read
    #  params_with_file_stuff[:file_name]  = params[:app][:file_upload].original_filename
    #  params_with_file_stuff[:file_mime_type] = params[:app][:file_upload].content_type
    #end
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url }
      format.json { head :no_content }
    end
  end

  #def download
  #  @app = App.find(params[:id])
  #  send_data(@app.file_data, :type => @app.file_mime_type, :filename => @app.file_name, :disposition => "attachment")
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :description, :author, :price, :binary)
    end
end
