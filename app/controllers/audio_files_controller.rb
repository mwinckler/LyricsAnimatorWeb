class AudioFilesController < ApplicationController
  def index
    @audio_files = current_user.audio_files
  end

  def new
    @audio_file = AudioFile.new
  end

  def edit
    @audio_file = AudioFile.find_by_id(params[:id])

    if @audio_file.nil?
      flash[:error] = "This Audio file no longer exists."
      redirect_to audio_files_path
    end
  end

  def create
    @audio_file = AudioFile.new(audio_file_params)
    @audio_file.user = current_user

    if @audio_file.save
      redirect_to audio_file_url(@audio_file)
    else
      render "new"
    end
  end

  def show
    @audio_file = AudioFile.find_by_id(params[:id])

    if @audio_file.nil? || current_user != @audio_file.user
      flash[:error] = "You don't have permission to view that."
      redirect_to root_path
    end
  end

def destroy
  @audio_file = AudioFile.find(params[:id])
  @audio_file.destroy

  if @audio_file.nil?
    flash[:error] = "This Audio file no longer exists."
    redirect_to audio_files_path
  end
  flash[:error] = "Deletion successful."
  redirect_to audio_files_path
end

def update
    @audio_file = AudioFile.find_by_id(params[:id])

    if @audio_file.nil?
      flash[:error] = "This Audio file no longer exists."
      redirect_to audio_files_path
    elsif @audio_file.update(audio_file_params)
      redirect_to @audio_file
    else
      render 'edit'
    end
end

  private

  def audio_file_params
    return params.require(:audio_file).permit(:song_title, :song_file)
  end
end
