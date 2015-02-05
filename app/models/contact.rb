class Contact < MailForm::Base

  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :select
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "New Message",
      :to => "asalganik1@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end

end