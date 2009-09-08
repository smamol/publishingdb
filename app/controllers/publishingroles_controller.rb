class PublishingrolesController < AdminController
  before_filter :set_body_class
  
  def index
    @publishingroles = Publishingrole.all(:order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @publishingroles }
    end
  end

  def new
    @publishingrole = Publishingrole.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @publishingrole }
    end
  end
  
  def edit
     @publishingrole = Publishingrole.find(params[:id])
  end
  
  def create
      @publishingrole = Publishingrole.new(params[:publishingrole])

     respond_to do |format|
       if @publishingrole.save
         format.html { redirect_to(publishingroles_path) }
         format.xml  { render :xml => @publishingrole, :status => :created, :location => @publishingroles }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @publishingrole.errors, :status => :unprocessable_entity }
       end
     end
   end

   def update
     @publishingrole = Publishingrole.find(params[:id])

     respond_to do |format|
       if @publishingrole.update_attributes(params[:publishingrole])
         flash[:notice] = 'Role was successfully updated.'
         format.html { redirect_to(publishingroles_path) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @publishingrole.errors, :status => :unprocessable_entity }
       end
     end
   end
   
   def destroy
     @publishingrole = Publishingrole.find(params[:id])
     @publishingrole.destroy

     respond_to do |format|
       flash[:notice] =  'Role was successfully deleted.'
       format.html { redirect_to(publishingroles_path) }
       format.xml  { head :ok }
     end
   end
   
   def set_body_class
     @bodyClass = 'admin publishingroles'
   end

end
