class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :trackable, :validatable

  # Removido o :registerable para não permitir criar novos cadastros (/users/sing_up);      
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

end
