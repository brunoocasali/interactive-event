module RolesHelper
  def show_role_icon(role)
    case role.key.to_sym
    when :root
      'blue lighten-2 fa fa-diamond circle'
    when :admin
      'grey fa fa-key circle'
    else
      'yellow mdi-social-person circle'
    end
  end
end
