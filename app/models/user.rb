class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stocked_items, dependent: :destroy
  has_many :order_histories, dependent: :destroy
  validates :email, presence: true
  validates :name, presence: true
  validates :zip, length: { maximum: 7 }

  def admin?
    # コードレビューのため、初回登録ユーザーを管理者ユーザーとする
    is_admin? || id == 1
  end

  def update_without_current_password(params, *options)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    clean_up_passwords
    update_attributes(params, *options)
  end
end
