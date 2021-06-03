//
//  StartViewController.swift
//  blueprint
//
//  Created by Justin Horner on 4/26/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // TODO Change to splash page and have big register button and then a button saying already a member?
    // TODO Setup forget password functionality
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var userData : [User] = []

    

    @IBAction func forgotPassword(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let welcomeViewController = storyBoard.instantiateViewController(withIdentifier: "forgotPassword") as! ForgotPasswordViewController// remember to have the stoyboard id of the view controller not the scene to equal...
        self.present(welcomeViewController, animated:true, completion:nil)
    }
    
    @IBAction func login(_ sender: Any) {
        //TODO Have login Validate username and password
        print("login pressed")
        print(userData.enumerated())
        do{
            userData = try context.fetch(User.fetchRequest()) // fetches users
            }
            catch{
                print("error")
            }
        for ( i, element) in userData.enumerated(){
            print("test")
            print(i, element.userName!)
            print(i, element.password!)
        }
        for ( i, element) in userData.enumerated(){
            if(element.userName! == userName.text){
                print("Username Match")
                if(element.password! == password.text){
                    print("Password Match!")
                    let currentUser =  CurrentUser(context: self.context)
                    currentUser.currentUser = element.userName//sets current User
                    print(currentUser.currentUser)
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let welcomeViewController = storyBoard.instantiateViewController(withIdentifier: "welcomePage") as! WelcomeViewController// remember to have the stoyboard id of the view controller not the scene to equal...
                    self.present(welcomeViewController, animated:true, completion:nil)
                    break
                }
            }
            else{
                print("bad try again")
                
                
            }
            
        }
        

//        if(self.userName == context.fetch(User.fetchRequest())[0].userName)


        
    }
    override func viewDidLoad() {
        print("test")

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
