# Admins (Devise)
class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :lockable, :timeoutable,
         :rememberable, :trackable, :validatable

  def superadmin?
    role.to_sym == :superadmin
  end

  has_paper_trail

  own_account_or_superuser = proc do
    current_admin = bindings[:controller].current_admin
    # Only show password if this is the current user or superadmin
    current_admin == bindings[:object] || current_admin.superadmin?
  end

  rails_admin do
    list do
      field :email
      field :failed_attempts
      field :current_sign_in_at
    end

    show do
      field :email

      field :failed_attempts
      field :sign_in_count

      field :current_sign_in_at
      field :last_sign_in_at

      field :current_sign_in_ip
      field :last_sign_in_ip
    end

    edit do
      group :logging_in do
        field :email

        field :password do
          visible own_account_or_superuser
        end

        field :password_confirmation do
          label 'Confirm password'
          visible own_account_or_superuser
        end
      end

      group :security_info do
        active false # Collapse by default

        field :sign_in_count
        field :failed_attempts
        field :current_sign_in_at
        field :last_sign_in_at
        field :current_sign_in_ip
        field :last_sign_in_ip
        field :locked_at
        field :unlock_token
      end

      group :permissions do
        field :role

        visible do
          bindings[:controller].current_admin.superadmin?
        end
      end
    end

    navigation_icon 'icon-eye-open'
  end
end
