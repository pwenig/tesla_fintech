class ContactsController < ApplicationController

  def new
    if params['email']
      ContactMailer.contact_email(params).deliver_now
      flash[:notice] = 'Message sent. Thank you!'
      redirect_to root_path
    end
  end

end 