class ActorsFilm < ApplicationRecord
  belongs_to :film
  belongs_to :actor
end
