class Notifier < ActionMailer::Base
  default :from => "Magz <magner@fuzzproducitons.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.flag.subject
  #
  def flag
    @greeting = "Hi"

    mail :to => "knuti@fuzzproductions.com"
  end
end
