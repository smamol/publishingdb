class SpecialtiesController < AdminController
  before_filter :set_body_class
  
  def index
    @specialties = Specialty.all(:order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @specialties }
    end
  end

  def new
    @specialty = Specialty.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @specialty }
    end
  end
  
  def edit
     @specialty = Specialty.find(params[:id])
  end
  
  def create
      @specialty = Specialty.new(params[:specialty])

     respond_to do |format|
       if @specialty.save
         format.html { redirect_to(specialties_path) }
         format.xml  { render :xml => @specialty, :status => :created, :location => @specialties }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @specialty.errors, :status => :unprocessable_entity }
       end
     end
   end

   def update
     @specialty = Specialty.find(params[:id])

     respond_to do |format|
       if @specialty.update_attributes(params[:specialty])
         flash[:notice] = 'Specialty was successfully updated.'
         format.html { redirect_to(specialties_path) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @specialty.errors, :status => :unprocessable_entity }
       end
     end
   end
   
   def destroy
     @specialty = Specialty.find(params[:id])
     @specialty.destroy

     respond_to do |format|
       flash[:notice] =  'Specialty was successfully deleted.'
       format.html { redirect_to(specialties_path) }
       format.xml  { head :ok }
     end
   end
   
   def set_body_class
     @bodyClass = 'admin specialties'
   end

end
