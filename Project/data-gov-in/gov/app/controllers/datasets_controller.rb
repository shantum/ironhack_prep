class DatasetsController < ApplicationController
  def index
    @dataset = Dataset.new
    @url = "https://data.gov.in/api/datastore/resource.json?resource_id=df7798bb-2c7b-4ca9-932c-65bf01af8785&api-key=628ada9382aeb42471a46ee06ebc72b9"
    @data = HTTP.get(@url)
  end
end
