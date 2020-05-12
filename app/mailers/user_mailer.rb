class UserMailer < ApplicationMailer
  default from: 'timotimothe@hotmail.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://fathomless-shelf-69499.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def attend_to_event_email(event)
    # on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @event = event

    # on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url = 'https://fathomless-shelf-69499.herokuapp.com/'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @event.admin.email, subject: 'Je me suis inscrit à votre évènement !')
  end

end