class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  # validates :password, length: { minimum: 6 }


  with_options presence: true do
    validates :birth_date
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :last_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width katakana characters"}
    validates :first_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width katakana characters"}
  end
    # validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    #                   uniqueness: { case_sensitive: false }
    # validates :password, length: { minimum: 6 } 
      
    validates :password, format: { with: /\A[a-z0-9]+\z/i, message: "Include both letters and numbers"}
end
