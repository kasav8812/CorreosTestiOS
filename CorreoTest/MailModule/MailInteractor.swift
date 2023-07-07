//
//  MailInteractor.swift
//  CorreoTest
//
//  Created by Carlos Salazar Vazquez on 06/07/23.
//

import UIKit

class MailInteractor: Mail_PresenterToInteractor {
    var presenter : Mail_InteractorToPresenter!
    
    func consumingApiEmails() {
        do {
            let response = try JSONDecoder().decode([MailEntity].self,from: dummyJSON())
            presenter.retrieveMails(mResponse: response)
        }catch{
            presenter.errorResponse(mMessageError: error.localizedDescription)
        }
    }
    
    func dummyJSON()-> Data{
        let mEmailsJson = "[{\"emisor\":\"JuanPerez\",\"correoEmisor\":\"jperez@gmail.com\",\"asunto\":\"Tareaprimerparcial\",\"mensaje\":\"Loremipsumdolorsitamet,consecteturadipiscingelit\",\"hora\":\"10:00am\",\"leido\":false,\"destacado\":false,\"spam\":false},{\"emisor\":\"CarlosSalazar\",\"correoEmisor\":\"csalazar@gmail.com\",\"asunto\":\"TareaSegundoparcial\",\"mensaje\":\"Loremipsumdolorsitamet,consecteturadipiscingelit\",\"hora\":\"10:00am\",\"leido\":false,\"destacado\":false,\"spam\":false},{\"emisor\":\"JuanPerez\",\"correoEmisor\":\"jperez@gmail.com\",\"asunto\":\"Tareaprimerparcial\",\"mensaje\":\"Loremipsumdolorsitamet,consecteturadipiscingelit\",\"hora\":\"10:00am\",\"leido\":false,\"destacado\":false,\"spam\":false},{\"emisor\":\"RaulCarreto\",\"correoEmisor\":\"rcarreto@gmail.com\",\"asunto\":\"TareaTercerparcial\",\"mensaje\":\"Loremipsumdolorsitamet,consecteturadipiscingelit\",\"hora\":\"10:00am\",\"leido\":false,\"destacado\":false,\"spam\":false},{\"emisor\":\"JuanPerez\",\"correoEmisor\":\"jperez@gmail.com\",\"asunto\":\"Tareaprimerparcial\",\"mensaje\":\"Loremipsumdolorsitamet,consecteturadipiscingelit\",\"hora\":\"10:00am\",\"leido\":false,\"destacado\":false,\"spam\":false},{\"emisor\":\"JuanPerez\",\"correoEmisor\":\"jperez@gmail.com\",\"asunto\":\"Tareaprimerparcial\",\"mensaje\":\"Loremipsumdolorsitamet,consecteturadipiscingelit\",\"hora\":\"10:00am\",\"leido\":false,\"destacado\":false,\"spam\":false},{\"emisor\":\"AngelicaMaravilla\",\"correoEmisor\":\"maran@gmail.com\",\"asunto\":\"Tareaprimerparcial\",\"mensaje\":\"Loremipsumdolorsitamet,consecteturadipiscingelit\",\"hora\":\"10:00am\",\"leido\":false,\"destacado\":false,\"spam\":false},{\"emisor\":\"JuanPerez\",\"correoEmisor\":\"jperez@gmail.com\",\"asunto\":\"Tareaprimerparcial\",\"mensaje\":\"Loremipsumdolorsitamet,consecteturadipiscingelit\",\"hora\":\"10:00am\",\"leido\":false,\"destacado\":false,\"spam\":false},{\"emisor\":\"ArisbethMartinez\",\"correoEmisor\":\"amartinez@gmail.com\",\"asunto\":\"Tareacuertoparcial\",\"mensaje\":\"Loremipsumdolorsitamet,consecteturadipiscingelit\",\"hora\":\"10:00am\",\"leido\":false,\"destacado\":false,\"spam\":false},{\"emisor\":\"JuanPerez\",\"correoEmisor\":\"jperez@gmail.com\",\"asunto\":\"Tareaprimerparcial\",\"mensaje\":\"Loremipsumdolorsitamet,consecteturadipiscingelit\",\"hora\":\"10:00am\",\"leido\":false,\"destacado\":false,\"spam\":false},{\"emisor\":\"JuanPerez\",\"correoEmisor\":\"jperez@gmail.com\",\"asunto\":\"Tareaprimerparcial\",\"mensaje\":\"Loremipsumdolorsitamet,consecteturadipiscingelit\",\"hora\":\"10:00am\",\"leido\":false,\"destacado\":false,\"spam\":false}]"
        return Data(mEmailsJson.utf8)
    }

}


