class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :lockable, :timeoutable,
         :rememberable, :trackable, :validatable

  has_paper_trail

  rails_admin do
    edit do
      group :logging_in do
        field :email
        field :password
        field :password_confirmation do
          label 'Confirm password'
        end
      end

      group :security_info do
        active false # Collapse by default

        field :sign_in_count
        field :current_sign_in_at
        field :last_sign_in_at
        field :current_sign_in_ip
        field :last_sign_in_ip
        field :failed_attempts
        field :unlock_token
        field :locked_at
      end
    end

    navigation_icon 'icon-eye-open'
  end
end
