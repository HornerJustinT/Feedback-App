//
//  GeneralReviewViewController.swift
//  blueprint
//
//  Created by Justin Horner on 4/27/21.
//

import UIKit

class GeneralReviewViewController: UIViewController {
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    var qNum = 0;
    var ratings = 0
    var userData : [User] = []
    var currentUser : [CurrentUser] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBAction func star1Action(_ sender: Any) {
        setStars(rating:0)
    }
    @IBAction func star2Action(_ sender: Any) {
        setStars(rating:1)
    }
    @IBAction func star3Action(_ sender: Any) {
        setStars(rating:2)
    }
    @IBAction func star4Action(_ sender: Any) {
        setStars(rating:3)
    }
    @IBAction func star5Action(_ sender: Any) {
        setStars(rating:4)
    }
    @IBOutlet weak var question: UILabel!
    @IBAction func postGeneral(_ sender: Any) {
        switch qNum {
        case 0:
            userData[0].generalRating = Int64(ratings)
            question.text = ("How did you feel about the general atmosphere?")
        case 1:
            userData[0].genQ1 = Int64(ratings)
            question.text = ("How did feel about the general price point")

        case 2:
            userData[0].genQ2 = Int64(ratings)
            question.text = ("How was the resorts cleanliness standards")


        case 3:
            userData[0].genQ3 = Int64(ratings)
            question.text = ("How have your staff experiences been?")


        case 4:
            userData[0].genQ4 = Int64(ratings)
            question.text = ("How has the weather been?")


        case 5:
            print("Q5")
            userData[0].genQ5 = Int64(ratings)
            question.text = ("Press Post response in order to advance to our final page.")

        case 6:
            do{
                try self.context.save()
            }
            catch{
                print("error")
            }
            print("going to next")
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard?.instantiateViewController(withIdentifier: "endView")as! EndViewController
                self.present(vc, animated: true, completion: nil)
            print(try! context.fetch(User.fetchRequest()))

        default:
            print("error")
        }
        qNum += 1
        clearStars()
        //TODO post to persistant memory
        //TODO Delegate depending on how many stars
    }
    func clearStars(){
        for i in 0..<5 {
            starArray[i].setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
        }
    }
    var starArray : [UIButton]{
    return [star1, star2, star3, star4, star5]}// this is a computed property
    func setStars(rating:Int){
        for i in 0...rating{
            starArray[i].setImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
        }
        for i in (rating + 1)..<5{
            starArray[i].setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
        }
        ratings = rating + 1;
    }
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
        question.text = "How do you feel about he Hotel generally?"
        print(currentUser[0].currentUser!)
        userData = userData.filter{($0.userName == currentUser[0].currentUser!)}
        print("current user is",userData)
        super.viewDidLoad()
        
        for star in starArray{
            star.setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
        }

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
