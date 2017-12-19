class ContactMailer < ApplicationMailer

  default from: 'notifications@teslafintech.com'

  def contact_email(info)
    User.where(admin: true).each do |user|
      mail(to: user.email, subject: 'New Contact Request') do |format|
        format.html {
          render locals: { name: info['name'], email: info['email'], message: info['message'] }
        }
        format.text {
          render locals: { name: info['name'], email: info['email'], message: info['message'] }
        }
      end 
    end 
  end 
end
