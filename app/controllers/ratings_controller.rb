class RatingsController < ApplicationController
  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ratings }
    end
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    @rating = Rating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @rating }
    end
  end

  # GET /ratings/new
  # GET /ratings/new.json
  def new
    @rating = Rating.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @rating }
    end
  end

  # GET /ratings/1/edit
  def edit
    @rating = Rating.find(params[:id])
  end

  # POST /ratings
  # POST /ratings.json
  def create
    if params[:fb_login]
      params[:user_id]=User.where(:fb_id => params[:user_id]).first
    end
    #check to make sure fb_id is valid?  Or will this be caught in validation
    @rating = Rating.new(params[:rating])

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, :notice => 'Rating was successfully created.' }
        format.json { render :json => @rating, :status => :created, :location => @rating }
      else
        format.html { render :action => "new" }
        format.json { render :json => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ratings/1
  # PUT /ratings/1.json
  def update
    @rating = Rating.find(params[:id])

    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        format.html { redirect_to @rating, :notice => 'Rating was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to ratings_url }
      format.json { head :ok }
    end
  end
end
