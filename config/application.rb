require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KopilkaRec
  class Application < Rails::Application

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true


    config.active_record.raise_in_transactional_callbacks = true

    config.assets.precompile += %w(under_construction.css under_construction.js ie.js)
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.svg)
    assets_root = Rails.root.join("app/assets/images")
    #paths = Dir[assets_root.join("/*.[gif|jpg|jpeg|png]")]
    paths = Dir[Rails.root.join("app/assets/images/**/*")]
    config.assets.precompile += paths

    config.assets.precompile += %w(ckeditor)
    config.assets.precompile += %w(rails_admin/rails_admin.css rails_admin/rails_admin.css)
    config.assets.precompile += %w(ckeditor/lang/*.js)

    config.assets.precompile += %w(rails_admin/colorpicker/*.gif rails_admin/colorpicker/*.png rails_admin/bootstrap/*.png rails_admin/aristo/images/* rails_admin/multiselect/*.png rails_admin/*.png)


    config.assets.precompile += %w(ckeditor/config.js)
    config.assets.precompile += %w(ckeditor/plugins/codemirror/plugin.js ckeditor/plugins/codemirror/lang/* ckeditor/plugins/codemirror/css/* ckeditor/plugins/codemirror/js/*.js ckeditor/plugins/codemirror/icons/* ckeditor/plugins/codemirror/theme/*)

    config.generators do |g|
       g.test_framework :rspec,
                       fixtures: true,
                       view_spec: false,
                       helper_specs: false,
                       routing_specs: false,
                       request_specs: false,
                       controller_spec: true
       g.fixture_replacement :factory_girl, dir: 'spec/factories'

    end
  end
end
