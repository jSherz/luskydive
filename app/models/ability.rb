# Defines abilities that a user can perform (CanCan)
class Ability
  include CanCan::Ability

  def initialize(user)
    # Group for normal committee to edit Admins
    alias_action :read, :update, :history, to: :no_create_delete

    # Allow access to rails admin
    can :access, :rails_admin
    can :dashboard

    # Assign basic permissions
    [CommitteeMember, Faq, FaqCategory, Package].each do |model|
      can :manage, model
    end

    can :no_create_delete, Admin

    # For super users only...
    return unless user.superadmin?

    can :manage, :version
    can :manage, Admin
  end
end
