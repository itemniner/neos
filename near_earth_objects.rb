require 'faraday'
require 'figaro'
require 'pry'
require_relative 'nasa_service'

# Load ENV vars via Figaro
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

class NearEarthObjects
  def self.find_neos_by_date(date)
    service = NasaService.new(date)
    {
      astroid_list: service.formatted_asteroid_data ,
      biggest_astroid: service.largest_astroid_diameter,
      total_number_of_astroids: service.total_number_of_astroids
    }
  end
end
