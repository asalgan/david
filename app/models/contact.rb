class Contact < MailForm::Base

  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :reason
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "New i2i Message",
      :to => "david@i2ifitness.com",
      :from => %("#{name}" <#{email}>)
    }
  end

end