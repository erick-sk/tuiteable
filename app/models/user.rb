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
  has_many :follows, foreign_key: :follower_id
  has_many :followed_users, through: :follows, source: :followed

  has_many :followeds,class_name:'Follow', foreign_key: :followed_id
  has_many :followers, through: :followeds, source: :follower

  validates :username, presence: {message: 'Username is required'}, uniqueness: {message: 'Username taken'}
  validates :email, presence: {message: 'email is required'}, uniqueness: {message: 'Already an account have this email linked'}

  validates :name, presence:true
end
