class RepliesController < ApplicationController
before_action :user_signed_in?
before_action :get_map
before_action :correct_user, only: [:destroy]
  
  def create
    @reply = @map.replies.build(reply_params)
    @reply.user_id = current_user.id
    if @reply.save
      flash[:sucess] = 'この投稿にコメントしました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'コメントを投稿することができませんでした'
    end


  end

  def destroy
    @user_reply.destroy
    flash[:success] = 'コメントを削除しました'
    redirect_back(fallback_location: root_path)
  end


  private

  def get_map
    @map = Map.find(params[:map_id])
  end  

  def reply_params
    params.require(:reply).permit(:reply)
  end

  def correct_user
    @user_reply = current_user.replies.find_by(id: params[:reply_id])

    unless @user_reply
      redirect_back(fallback_location: root_path)
    end
  end
end
