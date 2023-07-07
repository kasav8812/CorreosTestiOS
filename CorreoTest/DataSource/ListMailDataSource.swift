//
//  ListMailDataSource.swift
//  CorreoTest
//
//  Created by Carlos Salazar Vazquez on 06/07/23.
//

import UIKit

protocol SelectMailDelegate: NSObjectProtocol{
    func selectItemMail(mEmail: MailEntity)
}

class ListMailDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var mSectionsArray : [MailEntity] = []
    var tableView : UITableView?
    var mReferenceItem : String = "MailItemCell"
    var mViewController:  UIViewController?
    var mOnItemSelectedDelegate : SelectMailDelegate!
    var mPositionTag : Int?
    
    init(tableView: UITableView, mViewController:  UIViewController, mOnItemSelectedDelegate : SelectMailDelegate) {
        super.init()
        self.tableView = tableView
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.separatorStyle = .singleLine
        self.tableView?.estimatedRowHeight = 10.0
        let nib = UINib(nibName: mReferenceItem, bundle: nil)
        self.tableView?.register(nib, forCellReuseIdentifier: mReferenceItem)
        self.mViewController = mViewController
        self.mOnItemSelectedDelegate = mOnItemSelectedDelegate
    }
    
    func update(items: [MailEntity]) {
        self.mSectionsArray = items
        self.tableView?.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mSectionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mItem = self.mSectionsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: mReferenceItem, for: indexPath) as! MailItemCell
        cell.setBold()
        cell.setColorImageDefault()
        
        cell.mDestinityLabel.text = mItem.emisor
        cell.mNameMailLabel.text = mItem.asunto + " - "
        cell.mHourLabel.text = mItem.hora
        cell.mSubjectLabel.text = mItem.mensaje
        
        cell.mFavButton.tag = indexPath.row
        cell.mSpamButton.tag = indexPath.row
        cell.mDeleteButton.tag = indexPath.row
    
        cell.mDeleteButton.addTarget(self, action: #selector(onDelete(_:)), for: .touchUpInside)
        cell.mFavButton.addTarget(self, action: #selector(onSelectFavs(_:)), for: .touchUpInside)
        cell.mSpamButton.addTarget(self, action: #selector(onSelectSpam(_:)), for: .touchUpInside)
        
        cell.setTint(isEnable: mItem.destacado, mImage: cell.mFavImage, mColor: UIColor.yellow)
        cell.setTint(isEnable: mItem.spam, mImage: cell.mSpamImage, mColor: UIColor.red)
        cell.setRead(mIsRead: mItem.leido)
        
        return cell
    }
    
    @objc func onSelectFavs(_ sender : UIButton){
        selectFav(mPosSelected: sender.tag)
        self.tableView?.reloadData()
    }
    
    @objc func onSelectSpam(_ sender : UIButton){
        selectSpam(mPosSelected: sender.tag)
        self.tableView?.reloadData()
    }
    
    @objc func onDelete(_ sender : UIButton){
        selectDelete(mPosSelected: sender.tag)
        self.tableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectMail(mPosSelected: indexPath.row)
        self.tableView?.reloadData()
        mOnItemSelectedDelegate.selectItemMail(mEmail: mSectionsArray[indexPath.row])
    }
    
    func selectMail(mPosSelected: Int){
        for mPos in 0...mSectionsArray.count - 1 {
            if(mPosSelected == mPos){
                mSectionsArray[mPos].leido = mSectionsArray[mPos].leido == true ? false : true
            }else{
                mSectionsArray[mPos].leido = mSectionsArray[mPos].leido
            }
        }
    }
    
    func selectFav(mPosSelected: Int){
        for mPos in 0...mSectionsArray.count - 1 {
            if(mPosSelected == mPos){
                mSectionsArray[mPos].destacado = mSectionsArray[mPos].destacado == true ? false : true
            }else{
                mSectionsArray[mPos].destacado = mSectionsArray[mPos].destacado
            }
        }
    }
    
    func selectSpam(mPosSelected: Int){
        for mPos in 0...mSectionsArray.count - 1 {
            if(mPosSelected == mPos){
                mSectionsArray[mPos].spam = mSectionsArray[mPos].spam == true ? false : true
            }else{
                mSectionsArray[mPos].spam = mSectionsArray[mPos].spam
            }
        }
    }
    
    func selectDelete(mPosSelected: Int){
        for mPos in 0...mSectionsArray.count - 1 {
            if(mPos == mPosSelected){
                mSectionsArray.remove(at: mPosSelected)
            }
        }
    }
}
