class CatEntriesController < ApplicationController
  # Load the cat entry
  before_filter :load_cat_entry, only: [:show, :edit, :update, :destroy]

  # GET /cat_entries
  def index
    authorize! :read, CatEntry

    @cat_entries = CatEntry.all
  end

  # Get /cat_entries/:id
  def show
    authorize! :read, CatEntry
  end

  # GET /cat_entries/new
  def new
    authorize! :create, CatEntry
    entry_type = params[:type] if %w(lost found).include?(params[:type])
    @cat_entry = CatEntry.new(entry_type: entry_type, contact_email: session[:user_information][:email])
  end

  # POST /cat_entries
  def create
    authorize! :create, CatEntry

    @cat_entry = CatEntry.new(params[:cat_entry])

    if @cat_entry.save
      redirect_to cat_entry_path(id: @cat_entry.id)
    else
      render :new
    end
  end

  # GET /cat_entries/:id/edit
  def edit
    authorize! :update, @cat_entry
  end

  # PUT/PATCH /cat_entries/:id
  def update
    authorize! :update, @cat_entry

    @cat_entry.attributes= params[:cat_entry]

    if @cat_entry.save
      redirect_to cat_entry_path(id: @cat_entry.id)
    else
      render :new
    end
  end

  # DELETE /cat_entries/:id
  def destroy
    authorize! :destroy, @cat_entry

    @cat_entry.destroy
    redirect_to cat_entries_path
  end

  private

  # Retrieves the cat entry with the given id
  def load_cat_entry
    @cat_entry = CatEntry.find(params[:id])
  end
end
