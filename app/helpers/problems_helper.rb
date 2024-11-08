module ProblemsHelper
  def problem_confirm(action)
    t(format('problems.confirm.%s', action)) unless Errbit::Config.confirm_err_actions.eql? false
  end

  def auto_link_format(body)
    sanitize(
      Rinku.auto_link(simple_format(body), :all, 'target="_blank"').html_safe, # rubocop:disable Rails/OutputSafety
      tags:       %w[a p],
      attributes: %w[href target]
    )
  end

  def gravatar_tag(email, options = {})
    return unless email.present?

    image_tag gravatar_url(email, options), alt: email, class: 'gravatar'
  end

  def gravatar_url(email, options = {})
    return unless email.present?

    default_options = {
      d: Errbit::Config.gravatar_default
    }
    options.reverse_merge! default_options
    params = options.extract!(:s, :d).delete_if { |_k, v| v.blank? }
    email_hash = Digest::MD5.hexdigest(email)
    url = request.ssl? ? "https://secure.gravatar.com" : "http://www.gravatar.com"
    "#{url}/avatar/#{email_hash}?#{params.to_query}"
  end
end
