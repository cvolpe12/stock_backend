class ApplicationController < ActionController::API

  def encode_token(payload)

   JWT.encode(payload, "secret")

 end

 def decode_token
   # if headers -> decode it else return nil
   # JWT.decode()
   begin
     JWT.decode(auth_headers, "secret")
   rescue
     nil
   end
 end

 def auth_headers
   # check for headers
   request.headers["Authorization"]
   # returns the JWT
 end

 def curr_user
   user_id = decode_token[0]["user_id"]
   User.find(user_id)
   # who is the current user maybe we don't need to authorize the route
   # who the user is to see whether or not they can validly access something
 end

 def logged_in
   # is there a curr_user
   !!curr_user
 end

 def authorized
   # if curr_user 
   # allow them in our application
   # otherwise send an error
   render json: {errors: 'Please log in'} unless logged_in
 end
end
