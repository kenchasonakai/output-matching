class TimeFramesController < ApplicationController
  def create
    time_frame = DateTime.parse(params[:time_frame][:time_frame]).advance(hours: -9)
    @time_frame = current_user.time_frames.build(time_frame: time_frame, matching_post_id: params[:time_frame][:matching_post_id])
    render :errors unless @time_frame.save
  end

  def destroy
    @time_frame = TimeFrame.find(params[:id])
    @time_frame.destroy!
  end

  private

  def timeframe_params
    params.require(:time_frame).permit(:time_frame, :matching_post_id)
  end
end
