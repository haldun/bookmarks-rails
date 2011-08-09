class TagsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tags = current_user.bookmarks.tag_counts_on(:tags)
                                  .where('name like ?', "#{params[:q]}%")
                                  .order('count desc')
                                  .limit(20)
    respond_to do |format|
      format.html
      format.json { render :json => @tags.map(&:attributes) }
    end
  end
end
