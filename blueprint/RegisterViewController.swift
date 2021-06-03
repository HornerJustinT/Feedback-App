//
//  RegisterViewController.swift
//  blueprint
//
//  Created by Justin Horner on 4/26/21.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    var userData : [User] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var goodName = true;
    @IBAction func signup(_ sender: Any) {
        goodName = true // set boolean to true
        //TODO post into data
        do{
            userData = try context.fetch(User.fetchRequest()) // fetches users
            }
            catch{
                print("error")
            }// TODO make not case sensitive for username
        for var i in userData{
            
            if(i.userName! == userName.text){ //checks to see if any username named this
                print("username already exists")
                let alert = UIAlertController(title: "Bad Registration", message: "Your Username already exists please use a different username", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true)
                goodName = false;// sets boolean to false
            }
        }
        if(goodName == true){// only occurs if username existss
            let newUser = User(context: self.context)
            newUser.userName = self.userName.text
            newUser.password = self.password.text
//            let currentUser =  CurrentUser(context: self.context)
//            currentUser.currentUser = self.userName.text sets current User
            
            do{
                try self.context.save()
            }
            catch{
                print("error")
            }
            do{
                userData = try context.fetch(User.fetchRequest()) // fetches users
                }
                catch{
                    print("error")
                }
            let currentUser = CurrentUser(context: self.context)
            currentUser.currentUser = self.userName.text// sets current user Index
            do{
                try self.context.save()
            }
            catch{
                print("error")
            }
            
            print(try! context.fetch(User.fetchRequest())) // shows users now
            //TODO Have welcome username delegate on next page
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let welcomeViewController = storyBoard.instantiateViewController(withIdentifier: "welcomePage") as! WelcomeViewController// remember to have the stoyboard id of the view controller not the scene to equal...
            self.present(welcomeViewController, animated:true, completion:nil)
            // pulls up welcome page
        }
        }
        

    
    
    override func viewDidLoad() {
//        try! print(context.fetch(User.fetchRequest())[0].userName)
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
