class Notice < ApplicationRecord
    belongs_to :user
    has_many :comentario

    has_one_attached :photo

    validates :titulo, presence: true
    validates :contenido, presence: true
    
end
