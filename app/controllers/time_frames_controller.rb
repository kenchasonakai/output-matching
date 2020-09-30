class TimeFramesController < ApplicationController
	def create
		time_frame = DateTime.parse(params[:time_frame][:time_frame]).advance(hours: -9)
		@time_frame = current_user.time_frames.build(time_frame: time_frame, matching_post_id: params[:time_frame][:matching_post_id])
		respond_to do |format|
      if @time_frame.save
      	format.js
			else
				format.js	{ render :errors }
      end
    end
	end

	def destroy
		@time_frame = TimeFrame.find(params[:id])
		@time_frame.destroy!
		respond_to do |format|
      	format.js
				format.html { redirect_back(fallback_location:root_path) }
    end

	end

	private
	def timeframe_params
		params.require(:time_frame).permit(:time_frame, :matching_post_id)
	end
end
