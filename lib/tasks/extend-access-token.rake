task :extend_fb_token do
  # How-to
  puts "Extend FB authentication token\n\n"
  puts "1) Visit https://developers.facebook.com/tools/explorer"
  puts "2) Set application to LeedsUniSkydivers"
  puts "3) Get an access token\n\n"

  # Ask the user for an access token and then extend its validity
  print "Access token: "
  token = STDIN.gets

  if token
    oauth = Koala::Facebook::OAuth.new(Rails.application.config.facebook_app_id, Figaro.env.facebook_app_secret)

    extended_token = oauth.exchange_access_token(token)

    puts "New token valid until #{DateTime.now + 59.days}\n\n"
    puts extended_token
  else
    puts "Quit - no token entered!"
  end
end