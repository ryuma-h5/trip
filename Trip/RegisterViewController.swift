//
//  RegisterViewController.swift
//  Trip
//
//  Created by Ryuma Harada on 2019/05/17.
//  Copyright © 2019 Ryuma Harada. All rights reserved.
//

import UIKit
import RealmSwift
import CoreLocation

class RegisterViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet var photo: UIImageView!
    @IBOutlet var textMemo: UITextField!
    
    var latitude: CLLocationDegrees!
    var logtitude: CLLocationDegrees!
    var locationManager = CLLocationManager()
    var userLocation: CLLocation!
    
    //日付表示用
    @IBOutlet var dateLabel: UILabel!
    
    let realm = try! Realm()
    let photoLocation = PhotoLocation()
    //    let textMemo = PhotoLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textMemo.delegate = self
        
        setUpLacation()
        guard let _userLocation = userLocation else { return }
        latitude = _userLocation.coordinate.latitude
        logtitude = _userLocation.coordinate.longitude
        
        favo1Button.setImage(favoImage, for: .normal)
        favo1Button.setImage(favoedImage, for: .selected)
        favo2Button.setImage(favoImage, for: .normal)
        favo2Button.setImage(favoedImage, for: .selected)
        favo3Button.setImage(favoImage, for: .normal)
        favo3Button.setImage(favoedImage, for: .selected)
        favo4Button.setImage(favoImage, for: .normal)
        favo4Button.setImage(favoedImage, for: .selected)
        favo5Button.setImage(favoImage, for: .normal)
        favo5Button.setImage(favoedImage, for: .selected)
        
        favo1Button.isSelected = false
        favo2Button.isSelected = false
        favo3Button.isSelected = false
        favo4Button.isSelected = false
        favo5Button.isSelected = false
        
        
        self.navigationItem.title = "record"
        self.navigationItem.backBarButtonItem = UIBarButtonItem()
        
        //現在日時の取得
        let now = NSDate()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        dateLabel.text = String(dateFormatter.string(from: now as Date))
        
//        custom22Button.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
        
    }
    
    
    //ここでCLLocationManagerを利用して、userLocationを取得している
    func setUpLacation() {
        locationManager.requestWhenInUseAuthorization()
        
        let status = CLLocationManager.authorizationStatus()
        
        if status == .authorizedWhenInUse {
            userLocation = locationManager.location
        }
    }
    
    //対応したボタンが押された時の動作を記述
    @IBAction func camera(_ sender: UIButton) {
        //インスタンス作成
        let pickerController = UIImagePickerController()
        
        //ソースタイプを指定(cameraの場合はplistでカメラ使用を許可すること)
        pickerController.sourceType = .camera
        
        
        
        
        
        pickerController.delegate = self
        self.present(pickerController, animated: true, completion: nil)
    }
    
    //写真が選択された時に呼ばれるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey: Any]) {
        self.dismiss(animated: true, completion: nil)
        
        //画像を出力
        photo.image = info[.originalImage] as? UIImage
    }
    
    
    
    
    
    //    func locationManager(didUpdateLocations locations: CLLocation) {
    //        latitude = (location?.coordinate.latitude)!
    //        logtitude = (location?.coordinate.longitude)
    //    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
    
    //温泉評価
    @IBOutlet var favo1Button: UIButton!
    @IBOutlet var favo2Button: UIButton!
    @IBOutlet var favo3Button: UIButton!
    @IBOutlet var favo4Button: UIButton!
    @IBOutlet var favo5Button: UIButton!
    var favoNumber: Int = 0
    let favoedImage: UIImage = UIImage(named: "spa_mark.png")!
    let favoImage:UIImage = UIImage(named: "spa_unselected.png")!
    
    
    @IBAction func tapped1() {
        if favoNumber == 1 {
            favo1Button.isSelected = false
            favo2Button.isSelected = false
            favo3Button.isSelected = false
            favo4Button.isSelected = false
            favo5Button.isSelected = false
            favoNumber = 0
        } else {
            favo1Button.isSelected = true
            favo2Button.isSelected = false
            favo3Button.isSelected = false
            favo4Button.isSelected = false
            favo5Button.isSelected = false
            favoNumber = 1
        }
    }
    
    @IBAction func tapped2() {
        if favoNumber == 2 {
            favo1Button.isSelected = false
            favo2Button.isSelected = false
            favo3Button.isSelected = false
            favo4Button.isSelected = false
            favo5Button.isSelected = false
            favoNumber = 0
        } else {
            favo1Button.isSelected = true
            favo2Button.isSelected = true
            favo3Button.isSelected = false
            favo4Button.isSelected = false
            favo5Button.isSelected = false
            favoNumber = 2
        }
    }
    
    @IBAction func tapped3() {
        if favoNumber == 3 {
            favo1Button.isSelected = false
            favo2Button.isSelected = false
            favo3Button.isSelected = false
            favo4Button.isSelected = false
            favo5Button.isSelected = false
            favoNumber = 0
        } else {
            favo1Button.isSelected = true
            favo2Button.isSelected = true
            favo3Button.isSelected = true
            favo4Button.isSelected = false
            favo5Button.isSelected = false
            favoNumber = 3
        }
    }
    
    @IBAction func tapped4() {
        if favoNumber == 4 {
            favo1Button.isSelected = false
            favo2Button.isSelected = false
            favo3Button.isSelected = false
            favo4Button.isSelected = false
            favo5Button.isSelected = false
            favoNumber = 0
        } else {
            favo1Button.isSelected = true
            favo2Button.isSelected = true
            favo3Button.isSelected = true
            favo4Button.isSelected = true
            favo5Button.isSelected = false
            favoNumber = 4
        }
    }
    
    @IBAction func tapped5() {
        if favoNumber == 5 {
            favo1Button.isSelected = false
            favo2Button.isSelected = false
            favo3Button.isSelected = false
            favo4Button.isSelected = false
            favo5Button.isSelected = false
            favoNumber = 0
        } else {
            favo1Button.isSelected = true
            favo2Button.isSelected = true
            favo3Button.isSelected = true
            favo4Button.isSelected = true
            favo5Button.isSelected = true
            favoNumber = 5
        }
    }
    
    @IBOutlet var custom11Button: UIButton!
    @IBOutlet var custom22Button: UIButton!
    @IBOutlet var custom33Button: UIButton!
    @IBOutlet var custom44Button: UIButton!
    @IBOutlet var custom55Button: UIButton!
    @IBOutlet var custom66Button: UIButton!
    var customNumber: Int = 0
    
    @IBAction func custom1Button() {
        if customNumber == 1 {
            custom11Button.isSelected = false
            customNumber = 11
        } else {
            custom11Button.isSelected = true
            customNumber = 1
        }
    }
    
    @IBAction func custom2Button() {
        if customNumber == 2 {
            custom22Button.isSelected = false
            customNumber = 22
        } else {
            custom22Button.isSelected = true
            customNumber = 2
        }
    }
    
    @IBAction func custom3Button() {
        if customNumber == 3 {
            custom33Button.isSelected = false
            customNumber = 33
        } else {
            custom33Button.isSelected = true
            customNumber = 3
        }
    }
    
    @IBAction func custom4Button() {
        if customNumber == 4 {
            custom44Button.isSelected = false
            customNumber = 44
        } else {
            custom44Button.isSelected = true
            customNumber = 4
        }
    }
    
    @IBAction func custom5Button() {
        if customNumber == 5 {
            custom55Button.isSelected = false
            customNumber = 55
        } else {
            custom55Button.isSelected = true
            customNumber = 5
        }
    }
    
    @IBAction func custom6Button() {
        if customNumber == 6 {
            custom66Button.isSelected = false
            customNumber = 66
        } else {
            custom66Button.isSelected = true
            customNumber = 6
        }
    }
    
    //データの保存
    @IBAction func up() {
        photoLocation.latitude = latitude
        photoLocation.logtitude = logtitude
        
        
        //現在日時の取得
        let now = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        photoLocation.date = String(dateFormatter.string(from: now as Date))
        
        //温泉評価機能
        //わざわざ条件分岐させる必要もなくて、そのままグレー、赤温泉マークをRealmにセットして、そのままDeatail で画像表示をすれば良いのか
        if favoNumber == 1 {
            photoLocation.spa_mark1 = favoedImage.pngData()!
            photoLocation.spa_mark2 = favoImage.pngData()!
            photoLocation.spa_mark3 = favoImage.pngData()!
            photoLocation.spa_mark4 = favoImage.pngData()!
            photoLocation.spa_mark5 = favoImage.pngData()!
        } else if favoNumber == 2 {
            photoLocation.spa_mark1 = favoedImage.pngData()!
            photoLocation.spa_mark2 = favoedImage.pngData()!
            photoLocation.spa_mark3 = favoImage.pngData()!
            photoLocation.spa_mark4 = favoImage.pngData()!
            photoLocation.spa_mark5 = favoImage.pngData()!
            
        } else if favoNumber == 3 {
            photoLocation.spa_mark1 = favoedImage.pngData()!
            photoLocation.spa_mark2 = favoedImage.pngData()!
            photoLocation.spa_mark3 = favoedImage.pngData()!
            photoLocation.spa_mark4 = favoImage.pngData()!
            photoLocation.spa_mark5 = favoImage.pngData()!
        } else if favoNumber == 4 {
            photoLocation.spa_mark1 = favoedImage.pngData()!
            photoLocation.spa_mark2 = favoedImage.pngData()!
            photoLocation.spa_mark3 = favoedImage.pngData()!
            photoLocation.spa_mark4 = favoedImage.pngData()!
            photoLocation.spa_mark5 = favoImage.pngData()!
        } else if favoNumber == 5 {
            photoLocation.spa_mark1 = favoedImage.pngData()!
            photoLocation.spa_mark2 = favoedImage.pngData()!
            photoLocation.spa_mark3 = favoedImage.pngData()!
            photoLocation.spa_mark4 = favoedImage.pngData()!
            photoLocation.spa_mark5 = favoedImage.pngData()!
        }
        
        //customNumber の値をrealmで引き継いで、detail画面でそのcustomNumberからボタンを変色させる
        if custom11Button.isSelected == true {
            photoLocation.custom_button1 = 11
        }
        if custom22Button.isSelected == true {
            photoLocation.custom_button2 = 22
        }
        if custom33Button.isSelected == true {
            photoLocation.custom_button3 = 33
        }
        if custom44Button.isSelected == true {
            photoLocation.custom_button4 = 44
        }
        if custom55Button.isSelected == true {
            photoLocation.custom_button5 = 55
        }
        if custom66Button.isSelected == true {
            photoLocation.custom_button6 = 66
        }
        if (custom11Button.isSelected == false) && (custom22Button.isSelected == false) && (custom33Button.isSelected == false) && (custom44Button.isSelected == false) && (custom55Button.isSelected == false) && (custom66Button.isSelected == false) {
            photoLocation.custom_button1 = 0
            photoLocation.custom_button2 = 0
            photoLocation.custom_button3 = 0
            photoLocation.custom_button4 = 0
            photoLocation.custom_button5 = 0
            photoLocation.custom_button6 = 0
        }
        
        
        guard let _selectedImage = photo.image else {
            print("画像を選択してください")
            return
        }
        photoLocation.image = _selectedImage.jpegData(compressionQuality: 1)!
        photoLocation.textMemo = textMemo.text ?? ""
        try! realm.write {
            realm.add(photoLocation)
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
