require 'debugger'
class StoriesController < ApplicationController
  before_filter :require_login
  
  # GET /stories
  # GET /stories.json
  # note:  tagged_with is defined in story.rb
  def index

    if params[:tag]
      @stories = Story.tagged_with(params[:tag]).properly_ordered
    else
      @stories = Story.properly_ordered
        
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

=begin
  # GET /stories/search
  # GET /stories/search.json
  # note:  tagged_with is defined in story.rb
  def searchXXXXXXX #EXCEPT FOR SORT ORDER#OLD ONE THAT WORKED

      

      #@stories = Story.ordered_properly.search(params[:search])
      #@stories = Story.search(params[:search])
      @stories = Story.search params[:search],:sql => {
              :include => :tags,
              
              :joins => [:status, :priority],
              :sort_mode => :extended,
              :select =>  'stories.*, statuses.status_order as status_order,
                                statuses.name as status_name,
                                 priorities.priority_order as priority_order,
                                 priorities.name as priority_name',
               :order =>" statuses.status_order, priorities.priority_order,created_at DESC"
             }


 respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

def searchxxx0#DOES NOT WORK GETS THIS ERROR:
           #sphinxql: syntax error, unexpected CONST_FLOAT, expecting FROM or ',' near '.*, statuses.status_order as status_order,
           #                     statuses.name as status_name,
           #                      priorities.priority_order as priority_order,
           #                     priorities.name as priority_name FROM `story_core` WHERE MATCH('find') AND `sphinx_deleted` = 0 ORDER BY `statuses.status_order,` priorities.priority_order,created_at DESC LIMIT 0, 20; SHOW META'

      

      #@stories = Story.ordered_properly.search(params[:search])
      #@stories = Story.search(params[:search])
      #@stories = Story.ordered_prop0.search(params[:search])
     @stories = Story.ordered_propall.search(params[:search]).populate
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end
def searchWORKS01#### This is the first time that totally searches full text 
           #sphinxql: syntax error, unexpected CONST_FLOAT, expecting FROM or ',' near '.*, statuses.status_order as status_order,
           #                     statuses.name as status_name,
           #                      priorities.priority_order as priority_order,
           #                     priorities.name as priority_name FROM `story_core` WHERE MATCH('find') AND `sphinx_deleted` = 0 ORDER BY `statuses.status_order,` priorities.priority_order,created_at DESC LIMIT 0, 20; SHOW META'

      

      #@stories = Story.ordered_properly.search(params[:search])
      #@stories = Story.search(params[:search])
      #@stories = Story.ordered_prop0.search(params[:search])
     #@stories = Story.ordered_propall.search(params[:search]).populate

    @stories = Story.search 'database',
              :sort_mode => :extended,
              :joins => [:status,:priority],
              :order => 'status_order DESC, priority_order DESC',
              :include => :tags,
    :sql => {
              :include => :tags,
              
              :joins => [:status, :priority],
              :sort_mode => :extended,
              :select =>  'stories.*, statuses.status_order as status_order,
                                statuses.name as status_name,
                                 priorities.priority_order as priority_order,
                                 priorities.name as priority_name',
               :order =>" statuses.status_order, priorities.priority_order,created_at DESC"
             }
     put 'DEBUG from StoriesController#search'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end
=end
def search   #### This is the first time that totally searches full text 
           #sphinxql: syntax error, unexpected CONST_FLOAT, expecting FROM or ',' near '.*, statuses.status_order as status_order,
           #                     statuses.name as status_name,
           #                      priorities.priority_order as priority_order,
           #                     priorities.name as priority_name FROM `story_core` WHERE MATCH('find') AND `sphinx_deleted` = 0 ORDER BY `statuses.status_order,` priorities.priority_order,created_at DESC LIMIT 0, 20; SHOW META'

      

      #@stories = Story.ordered_properly.search(params[:search])
      #@stories = Story.search(params[:search])
      #@stories = Story.ordered_prop0.search(params[:search])
     #@stories = Story.ordered_propall.search(params[:search]).populate
    @stories = Story.search  params[:search],
    # This from here to
             :sort_mode => :extended,
             :joins => [:status,:priority],
             :order => 'status_order ASC, priority_order DESC, days_old DESC',
             :include => :tags,
    #here could be put into a sphinx scope
    :sql => {
              :include => :tags,
              
              :joins => [:status, :priority],
              :sort_mode => :extended,
              :select =>  'stories.*, statuses.status_order as status_order,
                                statuses.name as status_name,
                                 priorities.priority_order as priority_order,
                                 priorities.name as priority_name',
               :order =>" statuses.status_order , priorities.priority_order  ,created_at "
             }


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end


  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.json
  def new
    @story = Story.new
    @story.user_id = current_user.id
    @priority_default = Priority.where(:name => 'Medium').first.id
    @status_default = Status.where(:name => "Backlog").first.id
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
    @priority_default = @story.priority_id
    @status_default = @story.status_id
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_multiple
    if params[:story_ids]
      #@stories = Story.find(params[:story_ids])
      @stories = Story.where(id: params[:story_ids]).order("statuses.status_order, priorities.priority_order, 
        created_at DESC").
          joins(:status, :priority).
          select('stories.*, statuses.status_order as status_order, 
            statuses.name as status_name,
            priorities.priority_order as priority_order,
            priorities.name as priority_name')
            

      @users = User.all
      # TODO: Change the "order" field to a valid name and sort by that.
      #@stati = Status.all(:status_order => 'id ASC')
    else
      redirect_to :stories
    end
  end
  
  def update_multiple
    #@stories = Story.find(params[:story_ids])
    @stories = Story.where(id: params[:story_ids]).order("statuses.status_order, priorities.priority_order, 
        created_at DESC").
          joins(:status, :priority).
          select('stories.*, statuses.status_order as status_order, 
            statuses.name as status_name,
            priorities.priority_order as priority_order,
            priorities.name as priority_name')
            
    # the view ensures that we have numbers coming back instead of text for the priorities
    #    TODO: for status
    
    @tags_to_add = params[:tags_to_add]
    @tags_to_remove = params[:tags_to_remove]
    @stories.reject! do |story|
      story.update_attributes(params[:story].reject { |k,v| v.blank? })
    end
    if @stories.empty?
      redirect_to :stories
    else
      render "edit_multiple"
    end
  end

  

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :ok }
    end
  end

def search_notes
   @stories =  Story.search params[:search]
end
end

