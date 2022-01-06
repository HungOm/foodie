class User < ApplicationRecord
  enum user_type: [:customer, :admin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, :dependent => :destroy,:foreign_key =>:user_id
  after_initialize :set_default_type, :if => :new_record?


  private
  def set_default_type
    self.user_type||= :customer
  end


end
