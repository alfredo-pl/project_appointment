# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
   def create
     super
     from = SendGrid::Email.new(email: 'aalfredoplz@gmail.com')
     to = SendGrid::Email.new(email: params["user"][:email])
     subject = 'Sending with SendGrid is Fun'
     content = SendGrid::Content.new(type: 'text/plain', value: 'Welcome to APPNOW thank you very much and enjoy our services')
     mail =SendGrid::Mail.new(from, subject, to, content)

     sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
     response = sg.client.mail._('send').post(request_body: mail.to_json)
     puts response.status_code
     puts response.body
     puts response.headers
   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :run, :direction, :phone])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys:  [:name, :run, :direction, :phone])
  end
  # The path used after sign up.
  def after_sign_in_path_for(current_user)
    dashboard_user_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
