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
        
        
    
        
    
       
        
//        let results = realm.objects(textMemo.self)
        

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
    
    @IBAction func back() {
//        dismiss(animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)
    }

}
