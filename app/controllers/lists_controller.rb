class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  # GET /lists
  def index
    @lists = List.all
    @movies = Movie.all
  end

  # GET /lists/:id
  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new

  end

  # GET /lists/new
  def new
    @list = List.new
    @bookmark = @list.bookmarks.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created.'
    else
      render :new
    end
  end

  # GET /lists/:id/edit
  def edit
    @list = List.find(params[:id])
  end

  # PATCH/PUT /lists/:id
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lists/:id
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, notice: 'List was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def list_params
    params.require(:list).permit(:name)
  end
end
