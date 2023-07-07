//
//  MailModel.swift
//  CorreoTest
//
//  Created by Carlos Salazar Vazquez on 06/07/23.
//

import UIKit

struct MailEntity: Codable {
    let emisor : String
    let correoEmisor : String
    let asunto : String
    let mensaje : String
    let hora : String
    var leido : Bool
    var destacado : Bool
    var spam : Bool
    
    enum CodingKeys: String, CodingKey {
        case emisor         = "emisor"
        case correoEmisor   = "correoEmisor"
        case asunto         = "asunto"
        case mensaje        = "mensaje"
        case hora           = "hora"
        case leido          = "leido"
        case destacado      = "destacado"
        case spam           = "spam"
    }
    
    init(emisor: String, correoEmisor: String, asunto: String, mensaje: String, hora: String, leido: Bool, destacado: Bool, spam: Bool) {
        self.emisor = emisor
        self.correoEmisor = correoEmisor
        self.asunto = asunto
        self.mensaje = mensaje
        self.hora = hora
        self.leido = leido
        self.destacado = destacado
        self.spam = spam
    }
    
}
