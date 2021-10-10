//
//  ViewController.swift
//  Assignment_12
//
//  Created by Nika Topuria on 09.10.21.
//

import UIKit


//შექმენით ერთი, რეგისტრაციის გვერდი სადაც იქნება მხოლოდ სახელი და პაროლი, დარეგისტრირებული იუზერი შეინახეთ UserDefaults-ში. შემდეგ გადადიხართ აპლიკაციაზე სადაც არის Tab Bar კონტროლერი.
//პირველი იქნება Home, ღილაკი, სადაც ქოლექშენვიუში იქნება განლაგებული დღის შემოთავაზებები - კონკრეტულად რა და როგორ თქვენ აარჩიეთ
//მეორე ღილაკი იქნება Settings-სადაც იქნება TableView, აქ გამოჩნდება მომხარებლის სახელი და პაროლი (Security at its highest levels 🥺)

class LoginViewController: UIViewController {
    
    
    @IBOutlet var usernameField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    let defaults = UserDefaults.standard
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if let username = usernameField.text{
            if let password = passwordField.text{
                if !checkForDuplicates(username){
                    defaults.set(password, forKey: username)
                    defaults.set(username, forKey: "CurrentUser")
                    let alert = UIAlertController(title: "Success", message: "New user succesfully registered", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
                        let storyBoard = UIStoryboard(name: "TabView", bundle: nil)
                        let tabBarView = storyBoard.instantiateViewController(withIdentifier: "TabBarView")
                        tabBarView.modalPresentationStyle = .fullScreen
                        self.present(tabBarView, animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Error", message: "Username '\(username)' already exists", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
    }
    
    
    @IBAction func SignInButtonPressed(_ sender: UIButton) {
        if let username = usernameField.text{
            if let password = passwordField.text{
                if checkUsernamePassword(username, password) {
                    defaults.set(username, forKey: "CurrentUser")
                    let storyBoard = UIStoryboard(name: "TabView", bundle: nil)
                    let tabBarView = storyBoard.instantiateViewController(withIdentifier: "TabBarView")
                    tabBarView.modalPresentationStyle = .fullScreen
                    self.present(tabBarView, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Error", message: "Given username/password combination is incorrect.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //returns true if given username exists
    func checkForDuplicates (_ username: String) -> Bool{
        return defaults.object(forKey: username) != nil
    }
    
    //return true if password is correct for given username
    func checkUsernamePassword (_ username: String, _ password: String) -> Bool{
        return defaults.string(forKey: username) == password
    }

}

