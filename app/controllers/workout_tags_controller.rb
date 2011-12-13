class WorkoutTagsController < ApplicationController
  # GET /workout_tags
  # GET /workout_tags.json
  def index
    @workout_tags = WorkoutTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workout_tags }
    end
  end

  # GET /workout_tags/1
  # GET /workout_tags/1.json
  def show
    @workout_tag = WorkoutTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workout_tag }
    end
  end

  # GET /workout_tags/new
  # GET /workout_tags/new.json
  def new
    @workout_tag = WorkoutTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workout_tag }
    end
  end

  # GET /workout_tags/1/edit
  def edit
    @workout_tag = WorkoutTag.find(params[:id])
  end

  # POST /workout_tags
  # POST /workout_tags.json
  def create
    @workout_tag = WorkoutTag.new(params[:workout_tag])

    respond_to do |format|
      if @workout_tag.save
        format.html { redirect_to @workout_tag, notice: 'Workout tag was successfully created.' }
        format.json { render json: @workout_tag, status: :created, location: @workout_tag }
      else
        format.html { render action: "new" }
        format.json { render json: @workout_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workout_tags/1
  # PUT /workout_tags/1.json
  def update
    @workout_tag = WorkoutTag.find(params[:id])

    respond_to do |format|
      if @workout_tag.update_attributes(params[:workout_tag])
        format.html { redirect_to @workout_tag, notice: 'Workout tag was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @workout_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_tags/1
  # DELETE /workout_tags/1.json
  def destroy
    @workout_tag = WorkoutTag.find(params[:id])
    @workout_tag.destroy

    respond_to do |format|
      format.html { redirect_to workout_tags_url }
      format.json { head :ok }
    end
  end
end
