module UsersHelper
  def gravatar_for(user, options={ size:50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||=User.find_by(remember_token:remember_token)
  end
end
