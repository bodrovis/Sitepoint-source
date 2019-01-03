class SuspendedCheckGuard < Clearance::SignInGuard
  def call
    if suspended?
      failure("Your account is suspended.")
    else
      next_guard
    end
  end

  def suspended?
    current_user.suspended?
  end
end

Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "reply@example.com"
  config.sign_in_guards = [SuspendedCheckGuard]
end