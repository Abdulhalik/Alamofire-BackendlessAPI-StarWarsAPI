//
//  LoginViewController.swift
//  Alamofire-BackendlessAPI-StarWarsAPI
//
//  Created by Abdulhalik 1 on 24.06.2021.
//

import UIKit

class LoginViewController: UIViewController {
  
  // SignUp
  
  @IBOutlet weak var v_SignUp: UIView!
  @IBOutlet weak var lbFirstName: UILabel!
  @IBOutlet weak var lbLastName: UILabel!
  @IBOutlet weak var lbEmail: UILabel!
  @IBOutlet weak var lbPassword: UILabel!
  
  @IBOutlet weak var tfFirstName: UITextField!
  @IBOutlet weak var tfLastName: UITextField!
  @IBOutlet weak var tfEmail: UITextField!
  @IBOutlet weak var tfPassword: UITextField!
  
  @IBOutlet weak var btnSignUp: UIButton!
  
  // Login
  
  @IBOutlet weak var v_Login: UIView!
  @IBOutlet weak var lbLoginEmail: UILabel!
  @IBOutlet weak var tfLoginEmail: UITextField!
  @IBOutlet weak var lbLoginPassword: UILabel!
  @IBOutlet weak var tfLoginPassword: UITextField!
  @IBOutlet weak var btnLogin: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    UserPreferences.InitializePreferences()
    let isFirstEnterance = !UserDefaults.standard.bool(forKey: UserPreferences.FIRST_ENTERANCE)
    
    if isFirstEnterance {
      activateView(v_SignUp)
    } else {
      activateView(v_Login)
    }
  }
  
  func activateView(_ view: UIView) {
    v_Login.isHidden = true
    v_SignUp.isHidden = true
    
    view.isHidden = false
  }
  
  
  @IBAction func click_Confirm(_ sender: UIButton) {
    print("Login Clicked!")
    guard let firstName = self.tfFirstName.text else { return }
    guard let lastName = self.tfLastName.text else { return }
    guard let email = self.tfLoginEmail.text else { return }
    guard let password = self.tfLoginPassword.text else { return }
    
    print(firstName)
    print(lastName)
    print(email)
    print(password)
    
    let login = LoginModel(login: email, password: password)
    APIManager.shared.callingLoginAPI(login: login) { (isSuccess) in
      if isSuccess {
        print("*************** SUCCESS ***************")
        UserDefaults.standard.set(true, forKey: UserPreferences.IS_LOGGED_IN)
        self.performSegue(withIdentifier: "StartList", sender:self);
      } else {
        print("*************** FAILURE ***************")
      }
    }
  }
  
  
  @IBAction func click_SignUp(_ sender: UIButton) {
    print("SignUp Clicked!")
    guard let firstName = self.tfFirstName.text else { return }
    guard let lastName = self.tfLastName.text else { return }
    guard let email = self.tfEmail.text else { return }
    guard let password = self.tfPassword.text else { return }
    
    print(firstName)
    print(lastName)
    print(email)
    print(password)
    
    let register = RegisterModel(name: firstName + " " + lastName, email: email, password: password)
    APIManager.shared.callingRegisterAPI(register: register) { (isSuccess) in
      if isSuccess {
        print("*************** SUCCESS ***************")
        UserDefaults.standard.set(true, forKey: UserPreferences.FIRST_ENTERANCE);
        self.activateView(self.v_Login)
      } else {
        print("*************** FAILURE ***************")
      }
    }
  }
}
