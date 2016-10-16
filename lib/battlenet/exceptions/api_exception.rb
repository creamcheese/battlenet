class Battlenet
  class ApiException < Exception
    attr_accessor :response, :code, :reason

    def initialize(response, path, params)
      @response = response
      @code     = response.code
      @reason   = response['reason'] || nil
      @path = path
      @params = params
    end
    def message
    	"ApiException code:#{@code} reason :#{@reason}, path: #{@path}, params: #{@params.inspect}"
    end
  end
end
