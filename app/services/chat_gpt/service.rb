module ChatGpt
  class Service
    include HTTParty
    base_uri 'https://api.openai.com/v1'

    attr_reader :model

    API_KEY = Rails.application.credentials.chatgpt_api_key.freeze
    TIMEOUT_SECONDS = 15
    COMPLETIONS_PATH = '/completions'.freeze
    CHAT_COMPLETIONS_PATH = '/chat/completions'.freeze
    MODELS_PATH = '/models'.freeze
    DEFAULT_MODEL = 'gpt-3.5-turbo'.freeze

    def initialize(model = DEFAULT_MODEL)
      @model = model
    end

    def completions(prompt, model = nil)
      @model = model unless model.nil?

      response = self.class.post(
        COMPLETIONS_PATH,
        body: completions_body(prompt),
        headers: common_headers,
        timeout: TIMEOUT_SECONDS
      )

      ChatGpt::Responses::CompletionsResponse.new(response)
    end

    def chat_completions(message, model = nil)
      @model = model unless model.nil?

      response = self.class.post(
        COMPLETIONS_PATH,
        body: chat_completions_body(message),
        headers: common_headers,
        timeout: TIMEOUT_SECONDS
      )

      ChatGpt::Responses::ChatCompletionsResponse.new(response)
    end

    def models_list
      response = self.class.get(
        MODELS_PATH,
        headers: common_headers,
        timeout: TIMEOUT_SECONDS
      )

      ChatGpt::Responses::ModelsListResponse.new(response)
    end

    private

    def common_headers
      {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{API_KEY}"
      }
    end

    def completions_body(prompt)
      {
        n: 1,
        model: model,
        prompt: prompt
      }.to_json
    end

    def chat_completions_body(message)
      {
        model: model,
        messages: [
          {
            role: 'user',
            content: message
          }
        ]
      }.to_json
    end
  end
end
