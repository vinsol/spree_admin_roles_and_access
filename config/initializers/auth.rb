module Spree::Core::ControllerHelpers::Auth
  alias_method :original_redirect_unauthorized_access, :redirect_unauthorized_access

  def redirect_unauthorized_access
    if try_spree_current_user && try_spree_current_user.roles.any?(&:admin_accessible?)
      redirect_to admin_default_admin_dashboard_path
    else
      original_redirect_unauthorized_access
    end
  end
end
