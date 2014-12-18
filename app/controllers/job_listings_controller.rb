class JobListingsController < ApplicationController
  def index
    render text: "balls"
  end

  def show
    @jobs = current_business.
  end

end
