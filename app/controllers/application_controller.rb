class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signed_in_root_path(users)
    scope = Devise::Mapping.find_scope!(users)
    router_name = Devise.mappings[scope].router_name

    home_path = "#{scope}_root_path"

    context = router_name ? send(router_name) : self

    if context.respond_to?(home_path, true)
      context.send(home_path)
    elsif context.respond_to?(:root_path)
      context.root_path
    elsif respond_to?(:root_path)
      root_path
    else
      "/"
    end
  end

  def after_sign_in_path_for(users)
    signed_in_root_path('users/show')
  end
end
