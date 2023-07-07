//
//  MailItemCell.swift
//  CorreoTest
//
//  Created by Carlos Salazar Vazquez on 06/07/23.
//

import UIKit

class MailItemCell: UITableViewCell {
    @IBOutlet weak var mFavImage: UIImageView!
    @IBOutlet weak var mDeleteButton: UIButton!
    @IBOutlet weak var mTrashImage: UIImageView!
    @IBOutlet weak var mHourLabel: UILabel!
    @IBOutlet weak var mDestinityLabel: UILabel!
    @IBOutlet weak var mSubjectLabel: UILabel!
    @IBOutlet weak var mNameMailLabel: UILabel!
    @IBOutlet weak var mSpamButton: UIButton!
    @IBOutlet weak var mFavButton: UIButton!
    @IBOutlet weak var mSpamImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTint(isEnable : Bool, mImage : UIImageView, mColor: UIColor){
        if(isEnable){
            mImage.tintColor = mColor
        }else{
            mImage.tintColor = UIColor.darkGray
        }
    }
    
    func setRead(mIsRead: Bool){
        if(mIsRead){
            mDestinityLabel.font = UIFont.systemFont(ofSize: 10.0)
            mSubjectLabel.font = UIFont.systemFont(ofSize: 10.0)
            mNameMailLabel.font = UIFont.systemFont(ofSize: 10.0)
            mHourLabel.font = UIFont.systemFont(ofSize: 10.0)
        }
    }
    
    func setBold(){
        mDestinityLabel.font = UIFont.boldSystemFont(ofSize: 11.0)
        mNameMailLabel.font = UIFont.boldSystemFont(ofSize: 11.0)
        mSubjectLabel.font = UIFont.systemFont(ofSize: 10.0)
        mHourLabel.font = UIFont.boldSystemFont(ofSize: 11.0)
    }
    
    func setColorImageDefault(){
        mFavImage.tintColor = UIColor.darkGray
        mSpamImage.tintColor = UIColor.darkGray
    }
}
