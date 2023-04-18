# README

This is a small example about the use of "services" in Ruby on Rails, and I created a simple Chat GPT service to explain it.

### Some specs:
* Ruby version: 2.3.5
* System dependencies: HTTParty gem.

### How to use it:
1- Edit your credentials file

```
EDITOR="nano" bin/rails credentials:edit
```

2- Set up your own Chat GPT Key

```yaml
chatgpt_api_key: YOUR-API-KEY
```

3- Open your ruby console by running

```
rails c
```

4- Create a server instance

```ruby
> service = ChatGpt::Service.new

=> #<ChatGpt::Service:0x00007fccde2ed0d0 @model="gpt-3.5-turbo">
```

5- You can try to get the GPT models list

```ruby
response = service.models_list

=> #<ChatGpt::Responses::ModelsListResponse:0x00007fccdd7d6390 @response=#<HTTParty::Response:0x7fccdd6c7ad0 parsed_response={"object"=>"list", "data"=>[{"id"=>"babbage", "object"=>"model", "created"=>1649358449, "owned_by"=>"openai", "permission"=>[{"id"=>"modelperm-49FUp5v084tBB49tC4z8LPH5", ...>

> response.items.count
=> 64

> response.items.first
=> #<ChatGpt::Data::ModelsItemData:0x00007fccde9cfa60 @params={"id"=>"babbage", "object"=>"model", "created"=>1649358449, "owned_by"=>"openai", "permission"=>[{"id"=>"modelperm-49FUp5v084tBB49tC4z8LPH5", "object"=>"model_permission", "created"=>1669085501, "allow_create_engine"=>false, "allow_sampling"=>true, "allow_logprobs"=>true, "allow_search_indices"=>false, "allow_view"=>true, "allow_fine_tuning"=>false, "organization"=>"*", "group"=>nil, "is_blocking"=>false}], "root"=>"babbage", "parent"=>nil}>
```

6- Getting chat completions

```ruby
> response = service.chat_completions('Hi there, how are things going?')

=> #<ChatGpt::Responses::ChatCompletionsResponse:0x00007fa8489a3ad8 @response=#<HTTParty::Response:0x7fa84832c1f0 parsed_response={"error"=>{"message"=>"You exceeded your current quota, please check your plan and billing details.", "type"=>"insufficient_quota", "param"=>nil, "code"=>nil}}, @response=#<Net::HTTPTooManyRequests 429 Too Many Requests readbody=true>, @headers={"date"=>["Tue, 18 Apr 2023 20:54:09 GMT"], "content-type"=>["application/json; charset=utf-8"], "content-length"=>["206"], "connection"=>["close"], "vary"=>["Origin"], "x-request-id"=>["b2e9b52f6476758a72b70bf90c867a15"], "strict-transport-security"=>["max-age=15724800; includeSubDomains"], "cf-cache-status"=>["DYNAMIC"], "set-cookie"=>["_cfuvid=AP3xUqi9gUflC6fFHe_8lCf3Ey46dBZ0dCaDCMYqAG0-1681851249495-0-604800000; path=/; domain=.api.openai.com; HttpOnly; Secure; SameSite=None"], "server"=>["cloudflare"], "cf-ray"=>["7b9fcd23a9c6a789-EZE"], "alt-svc"=>["h3=\":443\"; ma=86400, h3-29=\":443\"; ma=86400"]}>>

> response.successful?
=> false

> response.failed?
=> true

> response.error_message
=> "You exceeded your current quota, please check your plan and billing details."

```

In the above case we can see that the request failed, that is because we don't have available credits in Open IA.

