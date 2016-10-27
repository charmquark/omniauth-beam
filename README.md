[![Gem Version](https://badge.fury.io/rb/omniauth-beam.svg)](https://badge.fury.io/rb/omniauth-beam)

# OmniAuth::Beam
OmniAuth strategy for Beam.pro

## Installation
Add this line to your application's Gemfile:

    gem 'omniauth-beam'

Then run `bundle install`

Or install it yourself with `gem install omniauth-beam`

### Using Directly
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :beam, ENV['BEAM_CLIENT_ID'], ENV['BEAM_SECRET_ID']
end
```

### Using With Devise
Add to `config/initializers/devise.rb`
```ruby
  config.omniauth :beam, ENV['BEAM_CLIENT_ID'], ENV['BEAM_SECRET_ID']
```

And apply it to your Devise user model:
```ruby
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable,
         omniauth_providers: %i(beam)

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
      u.password = Devise.friendly_token[0, 20]
      u.provider = auth.provider
      u.uid      = auth.uid
    end
    user.update avatar_url: auth.info.image,
                email:      auth.info.email,
                name:       auth.info.name
    user
  end
end
```

## Default Scope

The default scope is set to _user:details:self_, making this hash available in `request.env['omniauth.auth']`:
```ruby
{
  provider:    'beam',
  uid:         123456789,
  info:        {
    name:        'JohnDoe',
    email:       'johndoe@example.com',
    description: 'My channel.',
    image:       'https://uploads.beam.pro/avatar/12345678-1234.jpg',
    social:      {
      discord:  'johndoe#12345',
      facebook: 'https://facebook.com/John.Doe'
      player:   'https://player.me/johndoe',
      twitter:  'https://twitter.com/johndoe',
      youtube:  'https://youtube.com/user/johndoe'
    },
    urls:        { Beam: 'https://beam.pro/johndoe' }
  },
  credentials: {
    token:         'asdfghjklasdfghjklasdfghjkl',
    refresh_token: 'qwertyuiopqwertyuiopqwertyuiop',
    expires_at:    1477577799,
    expires:       true
  }
}
```
