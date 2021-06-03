//
//  EndViewController.swift
//  blueprint
//
//  Created by Justin Horner on 4/27/21.
//

import UIKit

class EndViewController: UIViewController {
    var userData : [User] = []
    var currentUser : [CurrentUser] = []
    @IBOutlet weak var genReviewLabel: UILabel!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        do{
            userData = try context.fetch(User.fetchRequest()) // fetches users
            }
            catch{
                print("error")
            }
        do{
            currentUser = try context.fetch(CurrentUser.fetchRequest())
        }
        catch{
            print("error")
        }
        userData = userData.filter{($0.userName == currentUser[0].currentUser!)}
        switch userData[0].generalRating {
        case 5:
            genReviewLabel.text = "Thank you! We're glad you loved your stay"
        case 4:
            genReviewLabel.text = "Thank you! We're glad you liked your stay"
        case 3:
            genReviewLabel.text = "Thank you! We're glad to have your feedback"
        case 2:
            genReviewLabel.text = "Thank you! We're so sorry we didn't reach your expectations"
        case 1:
            genReviewLabel.text = "Thank you! We're thankful for your feedback. Please accept this coupon for all the discomfort you had during your stay"
        default:
            print("error")
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func returnHome(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "start") as! StartViewController// remember to have the stoyboard id of the view controller not the scene to equal...
        self.present(vc,animated: true,completion: nil)
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
