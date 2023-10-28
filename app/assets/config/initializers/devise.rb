# frozen_string_literal: true

# Use this hook to configure devise mailer, warden hooks and so forth. The first
# four configuration values can also be set straight in your models.

Devise.setup do |config|
  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in DeviseMailer.
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # Configure the class responsible to send e-mails.
  config.mailer = 'Devise::Mailer'

  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default), :mongoid
  config.orm = :active_record

  # ==> Configuration for any authentication mechanism
  # Configure which keys are used when authenticating (ie. :email or :login)
  config.authentication_keys = [:email]

  # Tell if authentication through request.params is enabled. True by default.
  config.params_authenticatable = true

  # Tell if authentication through HTTP Basic Auth is enabled. False by default.
  config.http_authenticatable = false

  # If http headers should be returned for AJAX requests. True by default.
  config.http_authenticatable_on_xhr = true

  # ==> Configuration for :database_authenticatable
  # For bcrypt, this is the cost for hashing the password and defaults to 11. If
  # using other encryptors, it sets how many times you want the password re-encrypted.
  config.stretches = Rails.env.test? ? 1 : 11

  # Setup a pepper to generate the encrypted password.
  config.pepper = 'your_pepper'

  # ==> Configuration for :confirmable
  # A period that the user is allowed to access the website even without
  # confirming his account. For instance, if set to 2 days, the user will be
  # able to access the website for two days without confirming his account, access
  # will be blocked just in the third day.
  config.allow_unconfirmed_access_for = 2.days

  # A period that the user is allowed to confirm his account. In other words, he
  # can confirm his account in the first 2 days, and during 2 days from above,
  # he can access the website without confirming.
  config.confirm_within = 3.days

  # ==> Configuration for :rememberable
  # Remember the time in seconds before a session times out. This configuration
  # is only used when the "rememberable" module is fully configured. After this
  # time the session will expire and the user will need to login again.
  config.remember_for = 2.weeks

  # Calculate the time interval between consecutive re-requests to the server.
  # The request will be blocked if the time period is smaller than this.
  config.extend_remember_period = false

  # ==> Configuration for :validatable
  # Range for password length.
  config.password_length = 6..128

  # Email regex used to validate email formats. It simply asserts that
  # an email (a) does not start with a dot or @, (b) does not end with a dot,
  # (c) is not a sequence of two or more dots, and (d) it contains an @.
  config.email_regexp = /\A[^@]+@[^@]+\z/

  # ==> Configuration for :timeoutable
  # The time you want to timeout the user session without activity. After this
  # time the user will be asked for credentials again.
  config.timeout_in = 30.minutes

  # If true, expires auth token on session timeout.
  config.expire_auth_token_on_timeout = false

  # ==> Configuration for :lockable
  # Defines which strategy will be used to unlock an account.
  config.unlock_keys = [:email]

  # Defines which strategy will be used to unlock the account.
  config.unlock_strategy = :both

  # The time you want to lock the user out after he enters the wrong password.
  config.maximum_attempts = 20

  # The time you want to lock the user out when he exceeds maximum attempts.
  config.lockout = 1.hour

  # ==> Configuration for :recoverable
  # Defines the strategy to be used to recover the password.
  config.reset_password_keys = [:email]

  # Time interval you can reset your password with a reset password key.
  config.reset_password_within = 6.hours

  # ==> Configuration for :encryptable
  # Apply an encryptor to the password.
  config.encryptor = :bcrypt

  # ==> Scopes configuration
  # Turn scoped views on. Before rendering "sessions/new", it will first check for
  # "users/sessions/new". It's turned off by default because it's slower if you
  # are using only default views.
  config.scoped_views = true

  # Configure the default scope given to Warden. By default it's the first
  # devise role declared in your routes.
  config.default_scope = :user

  # Configure sign_out behavior. 
  config.sign_out_all_scopes = true

  # ==> Navigation configuration
  # List each navigation name here. If you change any of these, you might have
  # to duplicate the views.
  config.navigational_formats = ["*/*", :html, :json]

  # ==> Warden configuration
  # If you want to use other strategies, that are not (yet) supported by Devise,
  # you can configure them inside the config.warden block.
  config.warden do |manager|
    # manager.intercept_401 = false
    # manager.default_strategies(:scope => :scope_name)
    manager.failure_app = DeviseApp
  end

  # ==> Mountable engine configurations
  # When using Devise as a mountable engine, you should change your routes to
  # use
