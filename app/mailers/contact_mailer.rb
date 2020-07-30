class ContactMailer < ApplicationMailer

  def contact_email
    @contact = params[:contact]
    mail(to: 'berti.jean@gmail.com', subject: "New message from #{@contact.name}")
  end
end
