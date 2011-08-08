class BookmarksController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  def index
    @search = Bookmark.search(:include => [:tags]) do
      fulltext params[:q]
      with(:user_id, current_user.id)
      facet(:created_month, :sort => :index)
      with(:created_month, params[:month]) if params[:month].present?
      facet(:created_day, :sort => :index) if params[:month].present?
      with(:created_day, params[:day]) if params[:day].present?
      paginate :page => params[:page], :per_page => 25
    end

    # @bookmarks = @search.results
    # @bookmarks = current_user.bookmarks.page params[:page]
    # @bookmarks

    respond_with @search
  end

  def show
    @bookmark = current_user.bookmarks.find(params[:id])
    respond_with @bookmark
  end

  def new
    @bookmark = current_user.bookmarks.build params[:bookmark]
    respond_with @bookmark
  end

  def edit
    @bookmark = current_user.bookmarks.find(params[:id])
    respond_with @bookmark
  end

  def create
    @bookmark = current_user.bookmarks.build params[:bookmark]
    @bookmark.save
    respond_with @bookmark
  end

  def update
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.update_attributes params[:bookmark]
    respond_with @bookmark
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.destroy
    respond_with @bookmark
  end
end
