module ApplicationHelper
  def render_markdown(text)
    @rc ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    @rc.render(text).html_safe
  end
end
