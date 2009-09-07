class OccupationsController < AdminController
  before_filter :set_body_class
  
  def index
    @occupations = Occupation.all(:order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @occupations }
    end
  end

  def new
    @occupation = Occupation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @occupation }
    end
  end
  
  def edit
     @occupation = Occupation.find(params[:id])
  end
  
  def create
      @occupation = Occupation.new(params[:occupation])

     respond_to do |format|
       if @occupation.save
         format.html { redirect_to(occupations_path) }
         format.xml  { render :xml => @occupation, :status => :created, :location => @occupations }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @occupation.errors, :status => :unprocessable_entity }
       end
     end
   end

   def update
     @occupation = Occupation.find(params[:id])

     respond_to do |format|
       if @occupation.update_attributes(params[:occupation])
         flash[:notice] = 'Occupation was successfully updated.'
         format.html { redirect_to(occupations_path) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @occupation.errors, :status => :unprocessable_entity }
       end
     end
   end
   
   def destroy
     @occupation = Occupation.find(params[:id])
     @occupation.destroy

     respond_to do |format|
       flash[:notice] =  'Occupation was successfully deleted.'
       format.html { redirect_to(occupations_path) }
       format.xml  { head :ok }
     end
   end
   
   def set_body_class
     @bodyClass = 'admin occupations'
   end

end
