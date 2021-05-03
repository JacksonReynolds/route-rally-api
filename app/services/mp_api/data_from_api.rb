module MpApi

  # this class will access the Mountain Project API (mp) and retreive details for the climbing routes that fall under
  # the criteria received in the controller. It will bascially just pass the response back to the controller, where the 
  # repsonse will be assessed as successful or not (based on the value of the success key of the returned json).

  class DataFromApi

    attr_accessor :endpoint

    def initialize(endpoint)
      self.endpoint = endpoint
    end

    def get_data
      HTTParty.get(endpoint)
    end

  end

end