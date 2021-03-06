class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true
  has_many :questions,dependent: :destroy
  has_many :answers,dependent: :destroy
  has_many :upvote,dependent: :destroy
  def follow_relation user_id
     return UserRelations::SELF if id == user_id
     if CreateFollowMapping.where(:followee_id => user_id, :follower_id => id).length > 0
       return UserRelations::FOLLOWED
     else
       return UserRelations::NOTFOLLOWED
     end
   end
 
   def can_follow user_id
     return follow_relation(user_id) == UserRelations::NOTFOLLOWED
   end
    def can_un_follow user_id
     return follow_relation(user_id) == UserRelations::FOLLOWED
   end
 
   class UserRelations
     SELF = 0
     FOLLOWED = 1
     NOTFOLLOWED = 2
   end
end
