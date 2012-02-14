class Devise::Oauth2Providable::AuthorizationCode 
  include Mongoid::Document
  include Mongoid::Timestamps
  include Devise::Oauth2Providable::ExpirableToken
  store_in :authorization_codes

  field :token, :type=> String
  field :expires_at, :type=>DateTime

  def self.find_by_token(tok)
     self.first(:conditions=>{:token=>tok})
   end
  
  expires_according_to :authorization_code_expires_in
end
