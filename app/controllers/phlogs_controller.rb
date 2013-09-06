class PhlogsController < ApplicationController
  def index
    @phlogs = Phlog.all
    @uploader = Phlog.new.picture
    @uploader.success_action_redirect = new_phlog_url
  end
  # GET /phlogs/new
  # GET /phlogs/new.json
  def new
    @phlog = Phlog.new(key: params[:key])
  end

  # POST /phlogs
  # POST /phlogs.json
  def create
    @phlog = Phlog.new(params[:phlog])
    if @phlog.save
      flash[:notice] = "Successfully created phlog."
      redirect_to @phlog.gallery
    else
      render :action => 'new'
    end
  end

  # GET /phlogs/1/edit
  def edit
    @phlog = Phlog.find(params[:id])
  end

  # PUT /phlogs/1
  # PUT /phlogs/1.json
  def update
    @phlog = Phlog.find(params[:id])
    if @phlog.update_attributes(params[:phlog])
      flash[:notice] = "Successfully updated phlog."
      redirect_to @phlog.gallery
    else
      render :action => 'edit'
    end
  end

  def destroy
    @phlog = Phlog.find(params[:id])
    @phlog.destroy
    flash[:notice] = "Successfully destroyed phlog."
    redirect_to @phlog.gallery
  end
end

