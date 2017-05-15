require 'restclient'
require 'json'

login_response = RestClient.post(
  "localhost:4001/api/v1/sessions",
  {
    "email" => "mingxiangchan@gmail.com",
    "password" => "12345678"
  }.to_json,
  {content_type: :json}
)

login_response.code # => 200
login_response.body # => "{\"private_token\":\"85429ebf64b0\"}"
parsed_json = JSON.parse(login_response.body)
private_token = parsed_json["private_token"] # => "85429ebf64b0"

claims_response = RestClient.get(
  "localhost:4001/api/v1/claims?private_token=#{private_token}"
)



claims_response.code # => 200
claims_response.body # => "[{\"id\":1,\"amount\":5000,\"approval_status\":false,\"created_at\":\"2017-05-15T04:24:59.296Z\",\"updated_at\":\"2017-05-15T04:24:59.296Z\",\"user_id\":1}]"
p parsed_claims = JSON.parse(claims_response.body) # !> assigned but unused variable - parsed_claims
# >> [{"id"=>1, "amount"=>5000, "approval_status"=>false, "created_at"=>"2017-05-15T04:24:59.296Z", "updated_at"=>"2017-05-15T04:24:59.296Z", "user_id"=>1}]
