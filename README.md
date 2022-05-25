[![Gem Version](https://badge.fury.io/rb/omniauth-zeuswpi.svg)](https://badge.fury.io/rb/omniauth-zeuswpi)

# OmniAuth Zeus WPI Zauth Strategy

Strategy to authenticate with [Zeus WPI](https://zeus.gent) via OAuth2 in OmniAuth, powered by [Zauth](https://github.com/ZeusWPI/zauth).

## Installation

Add to your `Gemfile`
```ruby
gem 'omniauth-oauth2'
gem 'omniauth-zeuswpi'
gem 'omniauth-rails_csrf_protection'
```

And run `bundle install`

## Usage

_Note: Change `User` to your specific User model_

1. Add the strategy to the omniauth config:

```ruby
config.omniauth :zeuswpi,
  Rails.application.credentials.omniauth_client_id,
  Rails.application.credentials.omniauth_client_secret,
  token_params: { parse: :json }
```

2. Add a callbacks controller:
```ruby
class CallbacksController < Devise::OmniauthCallbacksController
  # See https://github.com/omniauth/omniauth/wiki/FAQ#rails-session-is-clobbered-after-callback-on-developer-strategy
  skip_before_action :verify_authenticity_token, only: :zeuswpi

  def zeuswpi
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user, event: :authentication
  end

  def after_omniauth_failure_path_for(scope)
    root_path
  end
end
```

3. Add the Devise Omniauth routes:
```ruby
devise_for :users, controllers: {
  omniauth_callbacks: 'callbacks'
}
```

4. Make your User model omniauthable:
```ruby
devise :omniauthable, omniauth_providers: %i[zeuswpi]
```

5. Add the `from_omniauth` helper to your `User` model:
```ruby
def self.from_omniauth(auth)
  find_or_create_by!(name: auth.uid) do |user|
    # additional initialisation here
  end
end

```
6. Add a button to your website:
```
<%= button_to "Log in with Zeus WPI",
              user_zeuswpi_omniauth_authorize_path %>
```


