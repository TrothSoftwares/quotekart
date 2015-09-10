module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Quote Kart"
    if page_title.empty?
    base_title
    else
      page_title + " | " + base_title
    end
  end

  ## for devise
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # FUNCITON FOR GETTING ROLE TYPES

  def anybody_signed_in?
    Devise.mappings.keys.any? { |scope| signed_in?(scope) }
  end

  def user_type
    if user_signed_in?
      current_user
    else if admin_signed_in?
        current_admin
      else dealer_signed_in?
        current_dealer
      end
    end

  end

end

