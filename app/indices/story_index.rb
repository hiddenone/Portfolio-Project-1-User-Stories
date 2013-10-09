ThinkingSphinx::Index.define :story, :with => :active_record do
  indexes i_want_to, :sortable=>true
  indexes so_that,   :sortable=>true
  indexes notes

indexes status(:name), :as=>:status_name, :sortable=>true
has status(:status_order), :as=>:status_order
has "status_id", :as => :status_id, :type => :integer


indexes priority(:name), :as=>:priority_name, :sortable=>true
has priority(:priority_order), :as=>:priority_order
has "priority_id", :as => :priority_id, :type => :integer

has "stories.created_at", :as => :days_old, :type => :integer
#has story(:created_at), :as => :created_at
  #has status.id,  :as => :status_id, :type=> :integer
 # has priority.id,  :as => :priority_id, :type=> :integer
  #has priority, status
  #has priority_id, status_id
  #has story.tagging(:id), :as => :taggings_id

  #indexes content
  #indexes author(:name), :as => :author, :sortable => true

  #has author_id, created_at, updated_at
end
#ThinkingSphinx::Index.define :status, :with => :active_record do
 
#  indexes :name, :as => :status_name, :sortable=>true
#  has 'status_order', :as=> :status_order, :type =>:integer
#end
#ThinkingSphinx::Index.define :priority, :with => :active_record do
#  indexes priority_order, :type => integer
# has :name, :as => priority_name
#end
