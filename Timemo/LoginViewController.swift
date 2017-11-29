//
//  LoginViewController.swift
//  UanbTechSafe
//
//  Created by unbTech on 2017. 11. 29..
//  Copyright © 2017년 unbTech. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class LoginViewController: UIViewController {
  
  @IBOutlet weak var backView: UIImageView!
  @IBOutlet weak var scrollView: UIScrollView!
  var downButton: UIButton
  var disposeBag: DisposeBag = DisposeBag()
  var page1DetailView: UIView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.scrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
    self.scrollView.isScrollEnabled = false
    
    backView.frame = CGRect(x: 0, y: 0, width: self.scrollView.contentSize.width, height: self.scrollView.contentSize.height)
    backView.image = UIImage.init(named: "back-green")
    backView.contentMode = .scaleAspectFill
    
    downButton.frame = CGRect(x: self.scrollView.frame.width / 2 - 22, y: self.scrollView.contentSize.height - 100, width: 44, height: 44)
    downButton.setTitle("아래", for: .normal)
    
    self.scrollView.addSubview(downButton)
    
    bind()
    
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    self.downButton = UIButton()
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.downButton = UIButton()
    super.init(coder: aDecoder)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension LoginViewController {
  
  func bind() {
    downButton.rx.tap.take(1).bind(onNext: { [weak self] (Void) in
      guard let `self` = self else { return }
      
      UIView.animate(withDuration: 1, animations: {
        self.backView.alpha = 0.15
      }, completion: { (true) in
        
        self.backView.image = UIImage.init(named: "back-pink")
        self.backView.alpha = 0.15
        
        self.scrollView.isScrollEnabled = true
        self.scrollView.isPagingEnabled = true
        
        self.page1DetailView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.page1DetailView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.0)
        
        self.scrollView.addSubview(self.page1DetailView)
        
        UIView.animate(withDuration: 1, animations: {
          self.backView.alpha = 1
          self.page1DetailView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.6)
        }, completion: { (true) in
          
        })
        
        //        UIView.animate(withDuration: 1, animations: {
        //          self.backView.alpha = 1
        //        })
      })
      
      UIView.animate(withDuration: 1.5, animations: {
        self.downButton.frame = CGRect(x: self.scrollView.frame.width / 2 - 22, y: -100, width: 44, height: 44)
      })
      
      //      UIView.animate(withDuration: 1, animations: {
      //
      //      })
      
    }).disposed(by: disposeBag)
    
    
    
  }
}

