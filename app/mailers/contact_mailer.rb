class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "tmyisgr@gmail.com", subject: "お問い合わせ"
  end
end
