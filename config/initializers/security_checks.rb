#
# Devise will boot with a nil secret key & pepper so we've got to check
# they're set before we start the app.
#

required_envs = ['DEVISE_SECRET_KEY', 'DEVISE_PEPPER']

required_envs.each do |req_env|
  if ENV[req_env].to_s.empty?
    Rails.logger.warn "Required environmental variable '#{req_env}' is not set!"
  end
end