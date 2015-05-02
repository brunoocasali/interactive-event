module ApplicationHelper
  def current_user_id
    current_user.id unless current_user.nil?
  end

  def date_form_helper
    { as: :string, input_html: { class: :datepicker } }
  end
end
