//
//  MailPresenter.swift
//  CorreoTest
//
//  Created by Carlos Salazar Vazquez on 06/07/23.
//

import UIKit

class MailPresenter: NSObject {
    var view: Mail_PresenterToView?
    var interactor : Mail_PresenterToInteractor?
    var mListEmails = [MailEntity]()
}

extension MailPresenter:Mail_InteractorToPresenter{
    func errorResponse(mMessageError: String) {
        view?.showError(mMessageError: mMessageError)
    }
    
    func retrieveMails(mResponse: [MailEntity]) {
        mListEmails = mResponse
        view?.displayMails(mResponse: mResponse)
    }
    
}

extension MailPresenter:Mail_ViewToPresenter{
    func callApiMails() {
        interactor?.consumingApiEmails()
    }
    
    func filterEmail(mPhraseFilter: String) {
        view?.displayMails(mResponse: mPhraseFilter == "" ? mListEmails : mListEmails.filter { $0.asunto.contains(mPhraseFilter) ||  $0.emisor.contains(mPhraseFilter)})
    }
    
    func addMail(){
        let mTime = getTime()
        mListEmails.append(MailEntity(emisor: "Anonimo",
                                      correoEmisor: "anon@gmail.com",
                                      asunto: "Nuevo Correo",
                                      mensaje: "Se agrego nuevo correo",
                                      hora: mTime["hour"]! + ":" + mTime["minute"]! + "pm",
                                      leido: false,
                                      destacado: false,
                                      spam: false))
        view?.displayMails(mResponse: mListEmails)
    }
    
    func getTime()-> [String:String]{
        let date = Date()
        let calendar = Calendar.current
        var mTime = [String:String]()
        
        mTime["hour"] = String(calendar.component(.hour, from: date))
        mTime["minute"] = String(calendar.component(.minute, from: date))
        mTime["seconds"] = String(calendar.component(.second, from: date))
        
        return mTime
    }

}

//MARK: - Protocols Contrate
protocol Mail_ViewToPresenter {
    func callApiMails()
    func filterEmail(mPhraseFilter : String)
}

protocol Mail_PresenterToInteractor{
    func consumingApiEmails()
}

protocol Mail_InteractorToPresenter{
    func retrieveMails(mResponse : [MailEntity])
    func errorResponse(mMessageError : String)
}

protocol Mail_PresenterToView{
    func displayMails(mResponse : [MailEntity])
    func showError(mMessageError : String)
}
