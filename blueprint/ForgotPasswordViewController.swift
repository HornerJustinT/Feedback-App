//
//  ForgotPasswordViewController.swift
//  blueprint
//
//  Created by Justin Horner on 5/6/21.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    var userData : [User] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var fUserName: UITextField!
    @IBAction func getUserName(_ sender: Any) {
        userData = userData.filter{($0.userName == fUserName.text)}
        print(userData)
            let alert = UIAlertController(title: "Here is password", message: userData[0].password!, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true)
        }

    override func viewDidLoad() {
        do{
            userData = try context.fetch(User.fetchRequest()) // fetches users
            }
            catch{
                print("error")
            }
        print(userData[0])
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
