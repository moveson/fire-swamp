class PagesController < ::ApplicationController
  def show
    username = params[:id]
    @presenter = ::PagePresenter.new(current_user, username)

    if File.exist? Rails.root.join("app/views/pages/_#{username}.html.erb")
      render "pages/found"
    else
      render "pages/not_found"
    end
  end
end
