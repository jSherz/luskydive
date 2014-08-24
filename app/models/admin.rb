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

      group :permissions do
        field :role
      end
    end

    navigation_icon 'icon-eye-open'
  end
end
