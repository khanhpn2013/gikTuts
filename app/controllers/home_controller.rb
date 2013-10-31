class HomeController < ApplicationController
  layout "layout_index"
  def index

  end

  def contact
  end

  def profile
  end

  def google
    return render  layout: 'google_map'
  end
end
