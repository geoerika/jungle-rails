class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com "
    #method that will send an email to the users registeres email address

  def welcome_email(user)
    @user = user
    mail to: @user.email, subject: 'Welcome to Our Jungle Store'
  end

  def order_email(order)
    @order = order
    mail to: @order.email, subject: 'Order: ##{@order.id}'
  end

end
