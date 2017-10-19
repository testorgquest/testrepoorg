require 'openssl'
require 'jwt'  # https://rubygems.org/gems/jwt

# Private key contents
private_pem = File.read('/Users/michalkorzawski/Downloads/gitapp-test.2017-10-18.private-key.pem')
private_key = OpenSSL::PKey::RSA.new(private_pem)

# Generate the JWT
payload = {
  # issued at time
  iat: Time.now.to_i,
  # JWT expiration time (10 minute maximum)
  exp: Time.now.to_i + (10 * 60),
  # GitHub App's identifier
  iss: "a25f6a9b3dece65f83f92815b776ee16e7be7bc0"
}

p jwt = JWT.encode(payload, private_key, "RS256")