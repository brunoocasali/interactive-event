oauth_access_token = ENV['FACEBOOK_ACCESS_TOKEN']
app_secret = ENV['FACEBOOK_APP_SECRET']

$facebook_client ||= Koala::Facebook::API.new(oauth_access_token, app_secret)
