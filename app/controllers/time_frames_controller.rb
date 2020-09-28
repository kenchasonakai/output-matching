class TimeFramesController < ApplicationController
	def create
		@time_frame = current_user.time_frames.build(timeframe_params)
		redirect_to root_path 
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
