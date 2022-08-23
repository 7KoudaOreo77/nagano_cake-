class Public::RegistrationsController < Devise::RegistrationsController
 def after_sign_up_path_for(resource)
   public_customers_path
 end
end
