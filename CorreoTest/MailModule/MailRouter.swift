//
//  MailRouter.swift
//  CorreoTest
//
//  Created by Carlos Salazar Vazquez on 06/07/23.
//

import UIKit

class MailRouter: NSObject {
    static public func createModule()->UIViewController{
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "MailViewController") as! MailViewController
        let interactor = MailInteractor()
        let presenter = MailPresenter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        let mNC = UINavigationController(rootViewController: view)
        return mNC
    }
}
