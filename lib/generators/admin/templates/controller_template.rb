class <%= class_name.pluralize %>Controller < AdminController
  before_filter :set_body_class
  
  def index
    @<%= class_name.pluralize.downcase %> = <%= class_name %>.all(:order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @<%= class_name.pluralize.downcase %> }
    end
  end

  def new
    @<%= class_name.downcase %> = <%= class_name %>.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @<%= class_name.downcase %> }
    end
  end
  
  def edit
     @<%= class_name.downcase %> = <%= class_name %>.find(params[:id])
  end
  
  def create
      @<%= class_name.downcase %> = <%= class_name %>.new(params[:<%= class_name.downcase %>])

     respond_to do |format|
       if @<%= class_name.downcase %>.save
         format.html { redirect_to(<%= class_name.pluralize.downcase %>_path) }
         format.xml  { render :xml => @<%= class_name.downcase %>, :status => :created, :location => @<%= class_name.pluralize.downcase %> }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @<%= class_name.downcase %>.errors, :status => :unprocessable_entity }
       end
     end
   end

   def update
     @<%= class_name.downcase %> = <%= class_name %>.find(params[:id])

     respond_to do |format|
       if @<%= class_name.downcase %>.update_attributes(params[:<%= class_name.downcase %>])
         flash[:notice] = '<%= class_name %> was successfully updated.'
         format.html { redirect_to(<%= class_name.pluralize.downcase %>_path) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @<%= class_name.downcase %>.errors, :status => :unprocessable_entity }
       end
     end
   end
   
   def destroy
     @<%= class_name.downcase %> = <%= class_name %>.find(params[:id])
     @<%= class_name.downcase %>.destroy

     respond_to do |format|
       flash[:notice] =  '<%= class_name %> was successfully deleted.'
       format.html { redirect_to(<%= class_name.pluralize.downcase %>_path) }
       format.xml  { head :ok }
     end
   end
   
   def set_body_class
     @bodyClass = 'admin <%= class_name.pluralize.downcase %>'
   end

end
