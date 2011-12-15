 class UsersController < ApplicationController
#   # GET /users
#   # GET /users.json
   def index
     @users = User.all
 
     respond_to do |format|
       format.html # index.html.erb
       format.json { render :json  => @users }
     end
   end

  def leaderboard
    if params[:type] == "global"
        @users = User.find(:all, :order => "score", :limit => 10)
    end
    #this probably needs some more checking for edge cases
    if params[:type]=="friends"
      if params[:user]
        friends = []
        User.where_fb_id(params[:user]).followed_users.each do |friend|
          friends << User.find(friend)
        end
        @users=friends.compact.sort {|a,b| b.score <=> a.score}.slice(0,9)
        
      end
    end
    #PLACEHOLDER!!! FIX FIX FIX!
    if params[:type] == "local"
        @users = User.find(:all, :order => "score", :limit => 10)
    end
        
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json  => @users }
    end
  
  
  end

  def find_fb_friends_from_list
    @users = []
    friend_list=params[:friend_list].slice(1,params[:friend_list].length-2).split(",")
    friend_list.each do |friend|
       @users << User.where_fb_id(friend.to_i)
    end
    @users.compact!
    
    respond_to do |format|
      #format.html # new.html.erb
      format.json { render :json  => @users }
    end
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    if params[:fb_login]
      @user = User.where_fb_id(params[:id])
    else
      @user = User.find(params[:id])
    end
    

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @user.to_json(:include => [:workouts, :favorites])}
    end
  end
  
  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json  => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice  => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action  => "new" }
        format.json { render :json  => @user.errors, :status  => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice  => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action  => "edit" }
        format.json { render :json  => @user.errors, :status  => :unprocessable_entity }
      end
    end
  end
  
  def add_followed_user
    #NOTE: THIS ONLY INTAKES A SINGLE USER...COULD BE FIXED W/O TOO MUCH TROUBLE THOUGH
    #this and its counterpart assume fb_id
    
    @user = User.where_fb_id(params[:id])
    @followed_user = User.where_fb_id(params[:followed_user])
    
    if @user && @followed_user
      @user.followed_users << @followed_user.id
    end
    respond_to do |format|
    
      if @user.save && @followed_user
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action  => "edit" }
        format.json { render :json  => @user.errors, :status  => :unprocessable_entity }
      end
    end
  end

  def remove_followed_user
    #NOTE: THIS ONLY INTAKES A SINGLE USER...COULD BE FIXED W/O TOO MUCH TROUBLE THOUGH
    #this and its counterpart assume fb_id
    
    @user = User.where_fb_id(params[:id])
    @followed_user = User.where_fb_id(params[:followed_user])
    
    if @user && @followed_user
      @user.followed_users.delete @followed_user.id
    end
    respond_to do |format|
    
      if @user.save && @followed_user
        format.html { redirect_to @user, :notice  => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action  => "edit" }
        format.json { render :json  => @user.errors, :status  => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
 end
