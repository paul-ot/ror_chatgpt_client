class HttpResponse
  attr_reader :response

  def initialize(response)
    @response = response
  end

  def response_body
    response.body.present? ? JSON.parse(response.body) : {}
  rescue JSON::ParserError
    {}
  end

  def successful?
    response.code.to_i == Rack::Utils::SYMBOL_TO_STATUS_CODE[:ok]
  end

  def failed?
    !successful?
  end
end
