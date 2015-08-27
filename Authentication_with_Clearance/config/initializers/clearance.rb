require_dependency 'lib/clearance/suspended_check_guard'

Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "reply@example.com"
  config.sign_in_guards = [SuspendedCheckGuard]
end
