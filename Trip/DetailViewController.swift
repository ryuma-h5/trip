//
//  DetailViewController.swift
//  Trip
//
//  Created by Ryuma Harada on 2019/05/21.
//  Copyright © 2019 Ryuma Harada. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController, UIImagePickerControllerDelegate {
    @IBOutlet var image: UIImageView!
    @IBOutlet var memo: UILabel!
    
    let realm = try! Realm()
    var detaliArray: Results<PhotoLocation>!
    var number: Int!
    
    @IBOutlet var spa1Mark: UIImageView!
    @IBOutlet var spa2Mark: UIImageView!
    @IBOutlet var spa3Mark: UIImageView!
    @IBOutlet var spa4Mark: UIImageView!
    @IBOutlet var spa5Mark: UIImageView!
    
    @IBOutlet var cus1Button: UIButton!
    @IBOutlet var cus2Button: UIButton!
    @IBOutlet var cus3Button: UIButton!
    @IBOutlet var cus4Button: UIButton!
    @IBOutlet var cus5Button: UIButton!
    @IBOutlet var cus6Button: UIButton!
    
    var cus1Number: Int!
    var cus2Number: Int!
    var cus3Number: Int!
    var cus4Number: Int!
    var cus5Number: Int!
    var cus6Number: Int!
    
    //日付表示
    @IBOutlet var dateLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        detaliArray = realm.objects(PhotoLocation.self)
        memo.text = detaliArray[number].textMemo
        let images = detaliArray[number].image
        image.image = UIImage(data: images)
        
        let spa1MarkFromRealm = detaliArray[number].spa_mark1
        spa1Mark.image = UIImage(data: spa1MarkFromRealm)
        
        let spa2MarkFromRealm = detaliArray[number].spa_mark2
        spa2Mark.image = UIImage(data: spa2MarkFromRealm)
        
        let spa3MarkFromRealm = detaliArray[number].spa_mark3
        spa3Mark.image = UIImage(data: spa3MarkFromRealm)
        
        let spa4MarkFromRealm = detaliArray[number].spa_mark4
        spa4Mark.image = UIImage(data: spa4MarkFromRealm)
        
        let spa5MarkFromRealm = detaliArray[number].spa_mark5
        spa5Mark.image = UIImage(data: spa5MarkFromRealm)
        
        let date = detaliArray[number].date
        dateLabel.text = String(date)
        
        cus1Number = detaliArray[number].custom_button1
        cus2Number = detaliArray[number].custom_button2
        cus3Number = detaliArray[number].custom_button3
        cus4Number = detaliArray[number].custom_button4
        cus5Number = detaliArray[number].custom_button5
        cus6Number = detaliArray[number].custom_button6
        
    
        if cus1Number == 11 {
            cus1Button.isSelected = true
        }
        if cus2Number == 22 {
//            cus2Button.backgroundColor = UIColor.blue
            cus2Button.isSelected = true
        }
        if cus3Number == 33 {
            cus3Button.isSelected = true
        }
        if cus4Number == 44 {
            cus4Button.isSelected = true
        }
        if cus5Number == 55 {
            cus5Button.isSelected = true
        }
        if cus6Number == 66 {
            cus6Button.isSelected = true
        }
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func back() {
//        dismiss(animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func delete() {
        try! realm.write {
            realm.delete(detaliArray[number])
        }
        navigationController?.popToRootViewController(animated: true)
    }

}
