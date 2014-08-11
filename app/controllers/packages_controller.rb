class PackagesController < ApplicationController
  def index
    # Retrieve all active packages, sorted by descending weighting
    @packages = Package.where(active: true).order(weighting: :desc)
  end
end
