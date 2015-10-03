class OpportunityMailer < ApplicationMailer
  def quote_mailer(user, opportunity)
  @opportunity_name = opportunity.name
  @anything_else_you_need_in_the_email = opportunity.contacts
    mail subject: "Your quote for #{@opportunity_name}.",
         to: opportunity.contacts.collect{|contact| contact.email? ? contact.email : next}.compact,
         from: user.email
  end

  private

  def from_address
    from = (Setting.smtp || {})[:from]
    !from.blank? ? from : "Fat Free CRM <noreply@fatfreecrm.com>"
  end
  
end
