class ImportsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    @imports = current_user.imports.all
    respond_with @imports
  end

  def show
    @import = current_user.imports.find(params[:id])
    respond_with @import
  end

  def new
    @import = current_user.imports.new
    respond_with @import
  end

  def create
    @import = current_user.imports.new(params[:import])
    if @import.save
      Resque.enqueue ImportBookmark, @import.id
    end
    respond_with @import
  end

  def destroy
    @import = current_user.imports.find(params[:id])
    @import.destroy
    respond_with @import
  end
end
