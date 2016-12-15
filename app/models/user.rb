class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups, -> { order 'created_at desc' }
  has_many :notes, -> { order 'created_at desc' }

  has_many :owned_presentations, :class_name => "Presentation", :foreign_key => "user_uuid"

  has_one :presentation, as: :presentable

  def jwt
    JWTWrapper.encode({:user_id => self.id})
  end

  def serializable_hash(options = {})
    result = super(options)
    result[:single_user_mode] = Rails.configuration.x.single_user_mode
    result
  end

end