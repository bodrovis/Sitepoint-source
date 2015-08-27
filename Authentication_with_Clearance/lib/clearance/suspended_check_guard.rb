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