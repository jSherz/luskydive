class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :lockable, :timeoutable,
         :rememberable, :trackable, :validatable

  def is_role? role
    self.role.to_s == role.to_s
  end

  has_paper_trail

  own_account_or_superuser = Proc.new do
    current_admin = bindings[:controller].current_admin
    # Only show password if this is the current user or superadmin
    current_admin == bindings[:object] || current_admin.is_role?(:superadmin)
  end

  rails_admin do
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
        #active false # Collapse by default

        field :sign_in_count do
          help 'Automatic. The number of times this user has logged in.'
        end

        field :failed_attempts do
          help 'Automatic. The number of failed attempts that have been made to login to this account.'
        end

        field :current_sign_in_at do
          help 'Automatic. The date & time the user signed in for their current session.'
        end

        field :last_sign_in_at do
          help 'Automatic. The date & time the user signed in before this session.'
        end

        field :current_sign_in_ip do
          help 'Automatic. The IP address the user logged in with for their current session.'
        end

        field :last_sign_in_ip do
          help 'Automatic. The IP address the user last logged in with before this session.'
        end

        field :locked_at do
          help 'Automatic. The date & time that this account was locked at (if it is locked).'
        end

        field :unlock_token do
          help 'Automatic. A token that will be used to unlock this account. E-mailed to the user.'
        end
      end

      group :permissions do
        field :role

        visible do
          bindings[:controller].current_admin.is_role?(:superuser)
        end
      end
    end

    navigation_icon 'icon-eye-open'
  end
end
