//
//  UploadMainVC.swift
//  Artoo
//
//  Created by 보윤 on 01/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit

class UploadMainVC: UIViewController{

    @IBOutlet weak var choiceImg: UIImageView!
    @IBOutlet weak var CategoryUploadLabel: UITextField!
    @IBOutlet weak var FigureUploadLabel: UITextField!
    @IBOutlet weak var YearUploadLabel: UITextField!
    @IBOutlet weak var LicenseUploadLabel: UITextField!
    @IBOutlet weak var widthTF: UITextField!
    @IBOutlet weak var yOffTF: UITextField!
    @IBOutlet weak var heightTF: UITextField!
    
    
    @IBOutlet weak var popUpViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var artNameUploadTF: UITextField!
    @IBOutlet weak var artPriceTF: UITextField!
    @IBOutlet weak var artArticleTF: UITextField!
    
    
    @IBOutlet weak var uploadTagBtn: UIButton!
    @IBOutlet weak var artDescriptionTV: UITextView!
    @IBOutlet weak var artMethodTV: UITextView!
    
    var CategoryPickerView: UIPickerView!
    var figurePickerView: UIPickerView!
    var yearPickerView: UIPickerView!
    var licensePickerView: UIPickerView!
    var toolbar: UIToolbar!
    var toolbar2: UIToolbar!
    var toolbar3: UIToolbar!
    var toolbar4: UIToolbar!
    
    var artName: String?
    var artDescription: String?
    var artArticle: String?
    var artMethod: String?
    var category: String!
    var figure: String!
    var artYear: String!
    var artLicense: String!
    var transactionMethod: String!
    var width: String!
    var yOff: String!
    var height: String!
    
    let picker = UIImagePickerController()
   
    let categorys: [String] = ["인물", "동물", "식물", "사물", "추상", "풍경"]
    let figures: [String] = ["동양화", "드로잉", "공예", "설치/조형", "혼합매체", "페인팅"]
    let year: [String] = ["2015", "2016","2017","2018"]
    let license: [String] = ["CCL표시안함","저작권표시","저작권표시 - 비영리", "저작자표시-동일조건변경허락","저작자표시-변경표시","저작자표시-비영리-동일조건변경허락","저작자표시-비영리-변경금지"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

         let pictureTap = UITapGestureRecognizer(target: self, action: #selector(choiceImage))
        
        choiceImg.addGestureRecognizer(pictureTap)
        choiceImg.isUserInteractionEnabled = true
        //heightConstraint.constant = 0
        setupPicker()
        setUpToolbar()

        artNameUploadTF.delegate = self
        artArticleTF.delegate = self
        artDescriptionTV.delegate = self
        artMethodTV.delegate = self
        widthTF.delegate = self
        yOffTF.delegate = self
        heightTF.delegate = self
        
        picker.delegate = self
        
        popUpViewBottomConstraint.constant = -375
        
        
    }
    
    //작품명 클릭하면 placeholder없어지기
    
    //추가하기 버튼을 누른다면 해시태그 골라줘야 함 -> present로 띄울게영
    @IBAction func addTagBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.popUpViewBottomConstraint.constant = 0
            self.popUpView.layer.shadowColor = UIColor.init(red: 146/255, green: 146/255, blue: 146/255, alpha: 1).cgColor
            self.popUpView.layer.shadowOpacity = 0.5
            self.popUpView.layer.shadowRadius = 7
            self.popUpView.layer.shadowOffset = CGSize(width: 0, height: -2)
            self.view.layoutIfNeeded()
        })
    }
    
    // 택배하고 직거래 버튼 누르면 그 해당 정보를 문자열에 저장함
    @IBAction func transactionBtn(_ sender: UIButton) {
        
        if(sender.tag == 0) {
            transactionMethod = "택배"
        }else {
            transactionMethod = "직거래"
        }
    }
    
    // 완료 버튼 누르면 뷰가 사라지기
    @IBAction func finishBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.popUpViewBottomConstraint.constant = -378
            self.popUpView.layer.shadowOpacity = 0
            self.view.layoutIfNeeded()
        })
    }
    
    func setUpToolbar(){
        
        toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        
       toolbar2 = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        
        toolbar3 = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        
        toolbar4 = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        
        let done1 = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(setCategoryData))
        
        let done2 = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(setFigureData))
        
        let done3 = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(setYearData))
        
         let done4 = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(setLicenseData))
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        
        toolbar.setItems([space, done1], animated: true)
        toolbar2.setItems([space, done2], animated: true)
        toolbar3.setItems([space, done3], animated: true)
        toolbar4.setItems([space, done4], animated: true)
        
        CategoryUploadLabel.inputAccessoryView = toolbar
        FigureUploadLabel.inputAccessoryView = toolbar2
        YearUploadLabel.inputAccessoryView = toolbar3
        LicenseUploadLabel.inputAccessoryView = toolbar4
        
    }
    
    @objc func choiceImage(){
        
        let alert = UIAlertController(title: "이미지 선택", message: "등록할 작품을 선택해주세요", preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "앨범", style: .default) {(action) in self.openLibrary()}
        let camera = UIAlertAction(title: "카메라", style: .default) {(action) in self.openCamera()}
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)) {
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }else {
            print("카메라 안됨")
        }
    }
    
   

    func setupPicker() {
        
        CategoryPickerView = UIPickerView()
        figurePickerView = UIPickerView()
        yearPickerView = UIPickerView()
        licensePickerView = UIPickerView()
        
        CategoryPickerView.delegate = self
        figurePickerView.delegate = self
        yearPickerView.delegate = self
        licensePickerView.delegate = self
        
        CategoryPickerView.dataSource = self
        figurePickerView.dataSource = self
        yearPickerView.dataSource = self
        licensePickerView.dataSource = self
        
        CategoryUploadLabel.inputView = CategoryPickerView
        FigureUploadLabel.inputView = figurePickerView
        YearUploadLabel.inputView = yearPickerView
        LicenseUploadLabel.inputView = licensePickerView
        
    }
    
    @objc func setCategoryData() {
        let row1 = CategoryPickerView.selectedRow(inComponent: 0)
        
        let part1 = categorys[row1]
       
        CategoryUploadLabel.text = part1
        CategoryUploadLabel.endEditing(true)
        category = part1
     
    }
    
    //작품 형태 데이터 등록
    @objc func setFigureData(){
        
        //row2 에 피커뷰에서 선택한 인덱스 값을 넣기
        let row2 =
            figurePickerView.selectedRow(inComponent: 0)
        
        //part2에 선택한 인덱스 값에 해당하는 데이터를 넣어주기
        let part2 = figures[row2]
        
        FigureUploadLabel.text = part2
        FigureUploadLabel.endEditing(true)
        figure = part2
       
    }
    
    //제작년도 데이터 등록
    @objc func setYearData(){
        
        let row3 = yearPickerView.selectedRow(inComponent: 0)
        
        let part3 = year[row3]
        
        YearUploadLabel.text = part3
        YearUploadLabel.endEditing(true)
        artYear = part3
        
    }
    
    //라이센스 데이터 등록
    @objc func setLicenseData(){
        
        let row4 = licensePickerView.selectedRow(inComponent: 0)
        
        let part4 = license[row4]
        
        LicenseUploadLabel.text = part4
        LicenseUploadLabel.endEditing(true)
        artLicense = part4
        
    }
    
}

extension UploadMainVC: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == CategoryPickerView){
            return categorys[row]
        } else if(pickerView == figurePickerView){
            return figures[row]
        } else if (pickerView == yearPickerView){
            return year[row]
        } else {
            return license[row]
        }
        return categorys[row]
    }
    
}

extension UploadMainVC: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == CategoryPickerView){
            return categorys.count
        } else if (pickerView == figurePickerView) {
            return figures.count
        } else if (pickerView == yearPickerView){
            return year.count
        } else {
            return license.count
        }
        return 1
    }
    
}

extension UploadMainVC: UITextViewDelegate, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if artNameUploadTF.isFirstResponder == true {
        artNameUploadTF.placeholder = nil
        }
         if artArticleTF.isFirstResponder == true {
         artArticleTF.placeholder = nil
         }
        
        if widthTF.isFirstResponder == true {
            widthTF.placeholder = nil
        }
        
        if yOffTF.isFirstResponder == true {
            yOffTF.placeholder = nil
        }
        
        if heightTF.isFirstResponder == true {
            heightTF.placeholder = nil
        }
    }
    
    //수정 끝나면 string 에 내용 넣어주기
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        artName = artNameUploadTF.text!
        artArticle = artArticleTF.text!
        width = widthTF.text!
        yOff = yOffTF.text!
        height = heightTF.text!
    }
    // 누르면 텍스트 뷰의 내용 없애기.
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if artDescriptionTV.isFirstResponder == true {
            artDescriptionTV.text = ""
        }
        
        if artMethodTV.isFirstResponder == true {
            artMethodTV.text = ""
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        artDescription = artDescriptionTV.text!
        artMethod = artMethodTV.text!
    }
}

extension UploadMainVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            choiceImg.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
}
