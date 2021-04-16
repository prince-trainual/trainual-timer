class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :time_entries, dependent: :destroy

  def current_timer
    time_entries.find_by(finishes_at: nil)
  end  

  def timer_running?
    current_timer.present?
  end  
end
