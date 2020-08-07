class AdminReplyService

  def self.save_reply(contact_id, message, base_url)

    contact = Contact.find(contact_id)
    reply = contact.create_admin_reply(message)

    modal_admin_notification(contact, base_url)

    ReplyMailer.with(contact: contact).reply_email.deliver_now

    Rails.application.routes.url_helpers.contact_path(contact)

  end


  def self.modal_admin_notification(contact, base_url)
    Slack.configure do |config|
      config.token = Rails.application.credentials.slack[:token]
    end
    client = Slack::Web::Client.new

    client.chat_postMessage(
        channel: '#building-a-slack-api',

        "blocks": [
            {
                "type": "section",
                "text": {
                    "type": "mrkdwn",
                    "text": "you have a new message check it <#{base_url}#{Rails.application.routes.url_helpers.contact_path(contact)}|here>"
                }
            }
        ],
        as_user: true)
  end
end