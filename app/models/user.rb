class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :time_entries, dependent: :destroy

  def timer_running?
    TimeEntry.exists?(user_id: self.id, finishes_at: nil)
  end  
end
