module DeviseViewsHelper
  def login_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |message| content_tag(:li, message) }.join
    html = <<-HTML
    <div class="alert alert-warning">
      <ul class="mb-0">#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
