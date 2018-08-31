//
//  WriteViewController.swift
//  Orbit
//
//  Created by David Koo on 25/08/2018.
//  Copyright © 2018 orbit. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {
    
    fileprivate weak var diaryWriteDelegate: DiaryWriteDelegate!
    fileprivate var contentTitle: UITextField!
    fileprivate var dayOfWeek: UILabel!
    fileprivate var weather: UILabel!
    fileprivate var date : UILabel!
    fileprivate var containerV : UIView!
    fileprivate var contStackV : UIStackView!
    fileprivate var stackBox : UIStackView!
    fileprivate var contentImgV : UIImageView!
    fileprivate var contents : UITextView!
    
    init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil, delegate: DiaryWriteDelegate) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.diaryWriteDelegate = delegate
        view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        if containerV == nil {
            setupLayout()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: writeDone Post
extension WriteViewController : DiaryWriteDelegate {
    func writeDone() {
        
    }
}



//MARK: Setup Layout
extension WriteViewController {
    fileprivate func setupLayout() {
        // MARK: containerV UIView
        containerV = UIView()
        containerV.translatesAutoresizingMaskIntoConstraints = false
        
        let const : [NSLayoutConstraint] = [
            NSLayoutConstraint(item: containerV, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide,
                               attribute: .top, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: containerV, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide,
                               attribute: .bottom, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: containerV, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide,
                               attribute: .leading, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: containerV, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide,
                               attribute: .trailing, multiplier: 1, constant: 8)]
        view.addSubview(containerV)
        view.addConstraints(const)
        
        // MARK: dayofWeek Label
        dayOfWeek = UILabel()
        dayOfWeek.translatesAutoresizingMaskIntoConstraints = false
        let constWeek : [NSLayoutConstraint] = [
            NSLayoutConstraint(item: dayOfWeek, attribute: .top, relatedBy: .equal, toItem: containerV,
                               attribute: .top, multiplier: 1, constant: 14),
            NSLayoutConstraint(item: dayOfWeek, attribute: .leading, relatedBy: .equal, toItem: containerV,
                               attribute: .leading, multiplier: 1, constant: 14),
            NSLayoutConstraint(item: dayOfWeek, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .height, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: dayOfWeek, attribute: .width, relatedBy: .equal, toItem: containerV,
                               attribute: .width, multiplier: 0.4, constant: 0)
            ]
        
        containerV.addSubview(dayOfWeek)
        containerV.addConstraints(constWeek)
        dayOfWeek.numberOfLines = 1
        dayOfWeek.textAlignment = NSTextAlignment.right

        //MARK: date Label
        date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        let constDate : [NSLayoutConstraint] = [
            NSLayoutConstraint(item: date, attribute: .top, relatedBy: .equal, toItem: containerV, attribute: .top, multiplier: 1, constant: 14),
            NSLayoutConstraint(item: date, attribute: .trailing, relatedBy: .equal, toItem: containerV, attribute: .trailing, multiplier: 1, constant: 14),
            NSLayoutConstraint(item: date, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: date, attribute: .width, relatedBy: .equal, toItem: containerV, attribute: .width, multiplier: 0.4, constant: 0)
        ]
        
        containerV.addSubview(date)
        containerV.addConstraints(constDate)
        date.numberOfLines = 1
        date.textAlignment = NSTextAlignment.left
        
        //MARK: weather Label
        weather = UILabel()
        weather.translatesAutoresizingMaskIntoConstraints = false
        
        let constWeather : [NSLayoutConstraint] = [
            NSLayoutConstraint(item: weather, attribute: .top, relatedBy: .equal, toItem: containerV,
                               attribute: .bottom, multiplier: 1, constant: 43),
            NSLayoutConstraint(item: weather, attribute: .centerX, relatedBy: .equal, toItem: containerV,
                               attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: weather, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .height, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: weather, attribute: .width, relatedBy: .equal, toItem: containerV,
                               attribute: .width, multiplier: 0.4, constant: 0)
        ]
        
        containerV.addSubview(weather)
        containerV.addConstraints(constWeather)
        weather.numberOfLines = 1
        weather.textAlignment = NSTextAlignment.center
        
        //MARK: contStackV UIStackView
        contStackV = UIStackView()
        contStackV.translatesAutoresizingMaskIntoConstraints = false
        
        let constStackV : [NSLayoutConstraint] = [
            NSLayoutConstraint(item: contStackV, attribute: .top, relatedBy: .equal, toItem: weather, attribute: .bottom, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: contStackV, attribute: .bottom, relatedBy: .equal, toItem: containerV, attribute: .bottom, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: contStackV, attribute: .leading, relatedBy: .equal, toItem: containerV, attribute: .leading, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: contStackV, attribute: .trailing, relatedBy: .equal, toItem: containerV, attribute: .trailing, multiplier: 1, constant: 8)]
        
        containerV.addSubview(contStackV)
        containerV.addConstraints(constStackV)
        
        //MARK: stackBox UIStackView
        stackBox = UIStackView()
        stackBox.translatesAutoresizingMaskIntoConstraints = false
        
        let constStackBox : [NSLayoutConstraint] = [
            NSLayoutConstraint(item: stackBox, attribute: .top, relatedBy: .equal, toItem: contStackV, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stackBox, attribute: .leading, relatedBy: .equal, toItem: contStackV, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stackBox, attribute: .trailing, relatedBy: .equal, toItem: contStackV, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stackBox, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 72)]
        
        contStackV.addSubview(stackBox)
        contStackV.addConstraints(constStackBox)
        stackBox.distribution = .fill
        
        //MARK: contentTitle Label
        contentTitle = UITextField()
        contentTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let constTitle : [NSLayoutConstraint] = [
            NSLayoutConstraint(item: contentTitle, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 30)]
        
        stackBox.addSubview(contentTitle)
        stackBox.addConstraints(constTitle)
        contentTitle.placeholder = "이 글의 제목을 써주세요."
        contentTitle.font?.withSize(15)
        
        //MARK: contentImgV UIIMageView
        contentImgV = UIImageView()
        contentImgV.translatesAutoresizingMaskIntoConstraints = false
        
        let constImgV : [NSLayoutConstraint] = [
            NSLayoutConstraint(item: contentImgV, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant:72),
            NSLayoutConstraint(item: contentImgV, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 72)]
        
        stackBox.addSubview(contentImgV)
        stackBox.addConstraints(constImgV)
        contentImgV.contentMode = .scaleAspectFill
        
        //MARK: contents UITextView
        contents = UITextView()
        contents.translatesAutoresizingMaskIntoConstraints = false
        
        let constContens : [NSLayoutConstraint] = [
            NSLayoutConstraint(item: contents, attribute: .top, relatedBy: .equal, toItem: stackBox, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contents, attribute: .leading, relatedBy: .equal, toItem: contStackV, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contents, attribute: .trailing, relatedBy: .equal, toItem: contStackV, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contents, attribute: .bottom, relatedBy: .equal, toItem: contStackV, attribute: .bottom, multiplier: 1, constant: 0)]
        
        contStackV.addSubview(contents)
        contStackV.addConstraints(constContens)
        contents.font?.withSize(12)
        contents.isScrollEnabled = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardFrameDidChange), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
        
        
    }
}

extension WriteViewController {
    @objc fileprivate func keyboardDidShow(notification: NSNotification) {
        adjustingHeight(notification: notification)
    }
    
    @objc fileprivate func keyboardFrameDidChange(notification: NSNotification) {
        adjustingHeight(notification: notification)
    }
    
    fileprivate func adjustingHeight(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        
//        let keyboardFrame: CGRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
    }
}
