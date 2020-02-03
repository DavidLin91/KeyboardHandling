//
//  ViewController.swift
//  KeyboardHandling
//
//  Created by Alex Paul on 2/3/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var pursuitLogo: UIImageView!
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  
  @IBOutlet weak var pursuitLogoCenterYConstraint: NSLayoutConstraint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    registerForKeyboardNotifications()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
    unregisterForKeyboardNofications()
  }
  
  private func registerForKeyboardNotifications() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  private func unregisterForKeyboardNofications() {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc private func keyboardWillShow(_ notification: NSNotification) {
    print("keyboardWillShow")
        
    guard let keyboardFrame = notification.userInfo?["UIKeyboardFrameBeginUserInfoKey"] as? CGRect else {
      return
    }
    print("keyboard frame is \(keyboardFrame)")
  }
  
  @objc private func keyboardWillHide(_ notification: NSNotification) {
    print("keyboardWillHide")
    print(notification.userInfo)
  }

}

