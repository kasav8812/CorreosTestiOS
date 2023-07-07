//
//  MailViewController.swift
//  CorreoTest
//
//  Created by Carlos Salazar Vazquez on 06/07/23.
//

import UIKit

class MailViewController: UIViewController, SelectMailDelegate, UISearchBarDelegate {
    @IBOutlet weak var mSearch: UISearchBar!
    @IBOutlet weak var mEmailsTableView: UITableView!
    private var mListMailDataSource : ListMailDataSource!
    private var mSelectMailDelegate : SelectMailDelegate!
    var presenter : MailPresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mSearch.delegate = self
        createTable()
        configureNavigationBar()
        presenter.callApiMails()
    }
    
    func createTable(){
        mListMailDataSource = ListMailDataSource(tableView: mEmailsTableView, mViewController: self,mOnItemSelectedDelegate: self)
        mEmailsTableView.dataSource = mListMailDataSource
        mEmailsTableView.delegate = mListMailDataSource
        mEmailsTableView.reloadData()
    }
    
    func configureNavigationBar(){
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addAction(_:)))
        self.navigationItem.title = "Mis Correos"
        self.navigationItem.rightBarButtonItem  = addButton
    }
    
    @objc func addAction(_ sender : UIButton){
        presenter.addMail()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.filterEmail(mPhraseFilter: searchText)
    }
    
    func selectItemMail(mEmail: MailEntity) {
        print("Email Selected", mEmail.asunto)
    }
    
}

extension MailViewController: Mail_PresenterToView{
    
    func displayMails(mResponse: [MailEntity]) {
        mListMailDataSource.update(items: mResponse)
        mEmailsTableView.reloadData()
    }
    
    func showError(mMessageError: String) {
        alertDialog(mMessage: mMessageError)
    }
    
    func alertDialog(mMessage : String){
        let alert = UIAlertController(title: "Aviso", message: mMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
