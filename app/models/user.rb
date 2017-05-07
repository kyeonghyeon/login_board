class User < ActiveRecord::Base
    has_secure_password
    has_many :contents
    validates :email, uniqueness: true  # email이라는 속성 하나에 대해 여러 옵션 줄 수 있음
    
    # validates_uniqueness_of :email    # email 속성에 uniqueness 검사
end
