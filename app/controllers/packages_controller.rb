# Displays packages
class PackagesController < ApplicationController
  def index
    # Retrieve all active packages, sorted by descending weighting
    @packages = Package.all
  end
end
