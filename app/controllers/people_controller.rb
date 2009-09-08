class PeopleController < ApplicationController
  before_filter :set_body_class
  
  # GET /people
  # GET /people.xml
  def index
    @people = Person.all(:order => :last_name).paginate(:per_page => PER_PAGE,:page => params[:page])
    @occupations = Occupation.all(:order => :name)
    @publications = Publication.all(:order => :name)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  # GET /people/1
  # GET /people/1.xml
  def show
    @person = Person.find(params[:id])
    @occupations = Occupation.all(:order => :name)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/new
  # GET /people/new.xml
  def new
    @person = Person.new
    @occupations = Occupation.all(:order => :name)
    @publications = Publication.all(:order => :name)
    @publishings = @person.publishings
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
    @occupations = Occupation.all(:order => :name)
    @publications = Publication.all(:order => :name)
    @publishings = @person.publishings
  end

  # POST /people
  # POST /people.xml
  def create
    @person = Person.new(params[:person])
    @occupations = Occupation.all(:order => :name)
    @publications = Publication.all(:order => :name)
    @publishings = @person.publishings
    
    respond_to do |format|
      if @person.save
        flash[:notice] = 'Person was successfully created.'
        format.html { redirect_to(@person) }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update
    @person = Person.find(params[:id])
    @occupations = Occupation.all(:order => :name)
    @publications = Publication.all(:order => :name)
    @publishings = @person.publishings
    
    respond_to do |format|
      if @person.update_attributes(params[:person])
        flash[:notice] = 'Person was successfully updated.'
        format.html { redirect_to(@person) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.xml
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(people_url) }
      format.xml  { head :ok }
    end
  end

  #POST /people/search
  def search
    @people = Person.search_people_by_name(params[:term])
    @records_found = @people.size 
    @people = @people.paginate(:per_page => PER_PAGE,:page => params[:page])  
    @occupations = Occupation.all(:order => :name)
    @publications = Publication.all(:order => :name)
    
    respond_to do |format|
      format.html { render :action => "index" }# index.html.erb
      format.xml  { render :xml => @people }
    end
  end
  
  def filter_people_by_occupation_publishings
     @people = Person.filter_person_by_occupation_publishings(params[:occupation], params[:publication])
     @records_found = @people.size 
     @people = @people.paginate(:per_page => PER_PAGE,:page => params[:page])
     @occupations = Occupation.all(:order => :name)
     @publications = Publication.all(:order => :name)

     respond_to do |format|
       format.html { render :action => "index" }# index.html.erb
       format.xml  { render :xml => @people }
     end
  end
  
  def set_body_class
    @bodyClass = 'people'
  end
end
