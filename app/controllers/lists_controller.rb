class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    # @lists = @board.lists.all
    @lists = List.all_lists(@board.id)
  end

  def show
  end

  def new
    @list = @board.lists.new
  end

  def create
    @list = @board.lists.new(list_params)

    if @list.save
      redirect_to board_list_path(@board, @list)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to board_list_path(@board, @list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to board_lists_path(@board)
  end

  private 
    def set_board
      @board = Board.single_board(params[:board_id])
    end

    def list_params
      params.require(:list).permit(:name, :position)
    end

    def set_list
      @list = List.single_list(@board.id, params[:id])
    end
end
