class AvailabilitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @cleaner = Cleaner.find(current_cleaner.id)
    @availabilities = @cleaner.availabilities
  end
end
