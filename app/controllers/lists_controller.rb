class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
    set_list
  end

   # GET /lists/new
   def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
    set_list
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: "List was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

   # PATCH/PUT /restaurants/1
   def update
    if @list.update(list_params)
      redirect_to @list, notice: "List was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #DELETE /lists/1
  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name, :photo)
    end
