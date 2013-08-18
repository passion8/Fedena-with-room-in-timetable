class RoomsController < ApplicationController
  
  def index
    @rooms = Room.find :all
  end

  def create
    h = Room.new(params[:rooms])
    if h.save
      flash[:notice] = "#{params[:rooms][:name]} room successfully created"
    else
      flash[:notice] = "Error occuried"
    end
    redirect_to :action => :index
  end

  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(params[:room])
      flash[:success] = "Room changed"
    else
      flash[:notice] = "Error occuried"
    end
    redirect_to :action => :index  
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      flash[:notice]="Room  Deleted"
    else
      flash[:notice]="Room cannot be deleted"
    end
    redirect_to :action => "index"
  end

end
