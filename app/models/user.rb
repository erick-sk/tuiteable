# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Associations for active_storage
  has_one_attached :avatar

  
  #Validations
  # Tuits
  has_many :tuits
  # Comments
  has_many :comments
  has_many :commented_tuits, through: :comments, source: :tuit
  # Likes
     # has_many :likes
     # has_many :liked_tuits, through: likes, source: :tuit
  # Follows
    # TODO
  validates :username, presence: {message: 'Username is required'}, uniqueness: {message: 'Username taken'}
  validates :email, presence: {message: 'email is required'}, uniqueness: {message: 'Already an account have this email linked'}

  validates :name, presence:true
end
