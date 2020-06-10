class AudioFilesController < ApplicationController
  def new
    @audio_file = AudioFile.new
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

  private

  def audio_file_params
    return params.require(:audio_file).permit(:song_title, :song_file)
  end
end
