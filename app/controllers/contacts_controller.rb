class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      redirect_to root_path, notice: "お問い合わせが完了しました！"
    else
      render action: 'new'
    end
  end
  
  def confirm 
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
  
    private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
