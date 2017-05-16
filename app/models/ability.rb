class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # if user
    # if user.admin? # 관리자 권한 확인
    if user.has_role? :admin 
      #관리자 권한
      can :manage, :all # manage = 7가지 다 할 수 있음(index, show, edit, destroy 등)
    elsif user.has_role? :moder
      can :read, :all
      can :new, :all
      can :create, :all
      can :destroy, :all #삭제 가능
      can :manage, Content, user_id: user.id
    else
      # 일반 회원 권한
      can :read, :all  # read => index, show
      can :new, :all # 새글 쓰기 
      can :create, :all
      can :manage, Content, user_id: user.id
    end
  end
end