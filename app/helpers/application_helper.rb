module ApplicationHelper
  def full_title(page_title)
    base_title = "gikTuts"
    if page_title.blank?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def create_session(gik_user)
    session[:gik_user] = gik_user
  end

  def current_user
    session[:gik_user]
  end

  def destroy_session
    session.delete(:gik_user)
  end

  def errors_form(model, field_names)
    # get all errors of forms
    errors = model.errors.messages

    errors_message = ''
    field_names.each do |field_name|
      if errors.keys.include?(field_name) && !errors[field_name].empty?
        errors_message << errors[field_name][0] << "<br />"
      end
    end

    unless errors_message.empty?
      return "<div id='display-error'>#{errors_message}</div>".html_safe   #errors_message.html_safe
    end
    return errors_message
  end

end
