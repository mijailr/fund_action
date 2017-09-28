module UpdateAccountPatch

  def self.apply
    Decidim::UpdateAccount.prepend self unless Decidim::UpdateAccount < self
  end

  def update_personal_data
    super
    @user.profile = {
      country: @form.country,
      languages: @form.languages.reject(&:blank?),
      about_me: @form.about_me,
      areas_of_interest: @form.areas_of_interest.reject(&:blank?),
      other_area_of_interest: @form.other_area_of_interest,
    }
  end
end

