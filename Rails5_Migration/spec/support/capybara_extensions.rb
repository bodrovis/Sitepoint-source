module CapybaraExtensions
  def expect_flash(msg, key = 'success')
    within ".alert.alert-#{key}" do
      expect(page).to have_content(msg)
    end
  end
end