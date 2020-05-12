class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @events = Event.find(params[:id])
  end
end
