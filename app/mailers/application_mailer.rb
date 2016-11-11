class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@terrys-ruby-sample-app.herokuapp.com'
  layout 'mailer'
end
