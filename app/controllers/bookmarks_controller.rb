class BookmarksController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!
  helper_method :bookmark

  def index
    @search = Bookmark.search(:include => [:tags]) do
      fulltext params[:q]
      with(:user_id, current_user.id)
      facet(:created_month, :sort => :index)
      with(:created_month, params[:month]) if params[:month].present?
      facet(:created_day, :sort => :index) if params[:month].present?
      with(:created_day, params[:day]) if params[:day].present?
      paginate :page => params[:page], :per_page => 25
      order_by :created_day, :desc
    end
    @bookmarks = @search.results
    @tags = current_user.bookmarks.tag_counts_on(:tags).order('count desc')[0..30]
    respond_with @bookmarks
  end

  def show
    respond_with bookmark
  end

  def new
    respond_with bookmark
  end

  def edit
    respond_with bookmark
  end

  def create
    bookmark.save
    respond_with bookmark
  end

  def update
    bookmark.update_attributes params[:bookmark]
    respond_with bookmark
  end

  def destroy
    bookmark.destroy
    respond_with bookmark
  end

  def bookmark
    @bookmark ||= if params[:id].present?
      current_user.bookmarks.find params[:id]
    else
      current_user.bookmarks.build params[:bookmark]
    end
  end
end
