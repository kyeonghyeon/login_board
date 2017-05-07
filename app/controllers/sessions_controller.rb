class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      # 로그인 성공
      session[:user_id] = user.id
      redirect_to contents_path
    else
      # 로그인 실패
      flash[:alert] = '아이디나 비밀번호가 잘못되었습니다.'
      redirect_to 'new'
    end
  end
end
