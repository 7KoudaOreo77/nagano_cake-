class Admin::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    admin_admin_homes_top_path
  end
end
