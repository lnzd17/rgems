class StaticPagesController < ApplicationController

  def root

  end

  def search
    q = params[:qTerm]
    puts Gems.info(q)
    redirect_to root_path
  end

  def favorites
  end

end
