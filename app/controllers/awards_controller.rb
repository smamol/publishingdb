class AwardsController < AdminController
  before_filter :set_body_class
  
  def index
    @awards = Award.all(:order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @awards }
    end
  end

  def new
    @award = Award.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @award }
    end
  end
  
  def edit
     @award = Award.find(params[:id])
  end
  
  def create
      @award = Award.new(params[:award])

     respond_to do |format|
       if @award.save
         format.html { redirect_to(awards_path) }
         format.xml  { render :xml => @award, :status => :created, :location => @awards }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @award.errors, :status => :unprocessable_entity }
       end
     end
   end

   def update
     @award = Award.find(params[:id])

     respond_to do |format|
       if @award.update_attributes(params[:award])
         flash[:notice] = 'Award was successfully updated.'
         format.html { redirect_to(awards_path) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @award.errors, :status => :unprocessable_entity }
       end
     end
   end
   
   def destroy
     @award = Award.find(params[:id])
     @award.destroy

     respond_to do |format|
       flash[:notice] = 'Award was successfully deleted.'
       format.html { redirect_to(awards_path) }
       format.xml  { head :ok }
     end
   end
   
   def set_body_class
     @bodyClass = 'admin awards'
   end

end
