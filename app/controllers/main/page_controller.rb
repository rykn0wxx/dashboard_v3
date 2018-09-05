class Main::PageController < ApplicationController
  def index
  end

  def theme
		render layout: 'theme'
  end
end
