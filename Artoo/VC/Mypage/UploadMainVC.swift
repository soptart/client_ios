//
//  UploadMainVC.swift
//  Artoo
//
//  Created by 보윤 on 01/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import UIKit
import Foundation

class UploadMainVC: UIViewController{
    
    //태그를 나타낼 컬렉션 뷰
    @IBOutlet weak var tagCollectionView: UICollectionView!
    
    //닫기 버튼
    @IBOutlet weak var closeBtn: UIButton!
    
    @IBOutlet weak var choiceImg: UIImageView!
    
    //카테고리 텍스트 필드들 - 피커와 연결
    @IBOutlet weak var CategoryUploadLabel: UITextField!
    @IBOutlet weak var FigureUploadLabel: UITextField!
    @IBOutlet weak var YearUploadLabel: UITextField!
    @IBOutlet weak var LicenseUploadLabel: UITextField!
    
    
    //택배 / 직거래 버튼
    @IBOutlet weak var deliveryBtn: UIButton!
    @IBOutlet weak var meetBtn: UIButton!
    
    
    //작품 이름
    @IBOutlet weak var artNameUploadTF: UITextField!
    
    //작품 설명
    @IBOutlet weak var artDescriptionTV: UITextView!
    
    //가로, 세로, 높이
    @IBOutlet weak var widthTF: UITextField!
    @IBOutlet weak var yOffTF: UITextField!
    @IBOutlet weak var heightTF: UITextField!
    
    //가격 텍스트 필드
    @IBOutlet weak var artPriceTF: UITextField!
    
    //작품 재료 텍스트 필드
    @IBOutlet weak var artArticleTF: UITextField!
    
    //표현 기법 텍스트 뷰
    @IBOutlet weak var artMethodTV: UITextView!
    
    
    //태그 추가하기 버튼
    @IBOutlet weak var uploadTagBtn: UIButton!
    
    
    
    
    //개인 소장인지 체크하는 체크 박스
    @IBOutlet weak var puchaseStateBtn: UIButton!
    
    //해시태그 버튼들
    var tagStr = ""
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var fouthBtn: UIButton!
    @IBOutlet weak var fifthBtn: UIButton!
    @IBOutlet weak var sixthBtn: UIButton!
    @IBOutlet weak var seventhBtn: UIButton!
    @IBOutlet weak var eighthBtn: UIButton!
    @IBOutlet weak var nineBtn: UIButton!
    @IBOutlet weak var tenBtn: UIButton!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var forthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    @IBOutlet weak var springLabel: UILabel!
    @IBOutlet weak var summerLabel: UILabel!
    @IBOutlet weak var fallLabel: UILabel!
    @IBOutlet weak var winterLabel: UILabel!
    
    
    
    
    //팝업 뷰 제어할 constraint
    @IBOutlet weak var popUpConstraint: NSLayoutConstraint!
    
    //해시태그 팝업 뷰
    @IBOutlet weak var popUpView: UIView!
    
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
    var tagList = [Int]()
    var a_tagValue: String?
    var puchaseState: Int?
    var artPrice: Int?
    
    let picker = UIImagePickerController()
    
    let categorys: [String] = ["인물", "동물", "식물", "사물", "추상", "풍경"]
    let figures: [String] = ["동양화", "드로잉", "공예", "설치/조형", "혼합매체", "페인팅"]
    let year: [String] = ["2015", "2016","2017","2018"]
    let license: [String] = ["CCL표시안함","저작권표시","저작권표시 - 비영리", "저작자표시-동일조건변경허락","저작자표시-변경표시","저작자표시-비영리-동일조건변경허락","저작자표시-비영리-변경금지"]
    
    var lableArr:[UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //태그랑 맞출 레이블 배열
        lableArr = [firstLabel, secondLabel, thirdLabel,
                    forthLabel, fifthLabel, sixthLabel, springLabel,
                    summerLabel, fallLabel, winterLabel]
        
        //팝업뷰 0인 상태로 안보이게 만듬
        popUpConstraint.constant = 0
        
        //태그 컬렉션 처음에는 안보이게
        tagCollectionView.isHidden = true
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
        
        
        
        //택배 - 직거래 버튼 테두리 처리
        deliveryBtn.layer.borderWidth = 1
        deliveryBtn.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0).cgColor
        
        meetBtn.layer.borderWidth = 1
        meetBtn.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0).cgColor
        
        
        //작품설명 텍스트뷰 테두리 처리
        artDescriptionTV.layer.borderWidth = 1
        artDescriptionTV.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0).cgColor
        
        
        
        //작품 사이즈 테두리 처리
        widthTF.layer.borderWidth = 1
        widthTF.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0).cgColor
        
        yOffTF.layer.borderWidth = 1
        yOffTF.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0).cgColor
        
        heightTF.layer.borderWidth = 1
        heightTF.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0).cgColor
        
        
        //작품 가격 테두리 처리
        artPriceTF.layer.borderWidth = 1
        artPriceTF.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0).cgColor
        
        
        //작품 재료 테두리 처리
        artArticleTF.layer.borderWidth = 1
        artArticleTF.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0).cgColor
        
        
        
        //표현 기법 테두리 처리
        artMethodTV.layer.borderWidth = 1
        artMethodTV.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0).cgColor
        
        
        //닫기 버튼 클릭시 dismiss
        closeBtn.addTarget(self, action: #selector(close), for: .touchUpInside)
        
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
        
    }
    
    
    @IBAction func puchaseBtn(_ sender: Any) {
        if puchaseStateBtn.isFocused == true{
            puchaseState = 1
        } else {
            puchaseState = 0
        }
    }
    
    //완료 버튼 누르면 작품 업로드하기
    @IBAction func uploadBtn(_ sender: Any) {
        upload()
    }
    
    
    //추가하기 버튼 누르면 팝업 뷰 띄우기
    @IBAction func addTagBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.popUpConstraint.constant = 378
            
            
            //그림자 지정
            self.popUpView.layer.shadowColor = UIColor.init(red: 146/255, green: 146/255, blue: 146/255, alpha: 1).cgColor
            self.popUpView.layer.shadowOpacity = 0.5
            self.popUpView.layer.shadowRadius = 7
            self.popUpView.layer.shadowOffset = CGSize(width: 0, height: -2)
        })
    }
    
    
    // 배송 여부
    // 택배하고 직거래 버튼 누르면 그 해당 정보를 문자열에 저장함
    @IBAction func transactionBtn(_ sender: UIButton) {
        
        if(sender.tag == 15) {
            transactionMethod = "택배"
            
            deliveryBtn.layer.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1.0).cgColor
            deliveryBtn.layer.borderColor = UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1.0).cgColor
            
            deliveryBtn.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0), for: .normal)
            
            
            meetBtn.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
            meetBtn.setTitleColor(UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0), for: .normal)
            meetBtn.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0).cgColor
            
        }else{
            
            transactionMethod = "직거래"
            
            meetBtn.layer.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1.0).cgColor
            meetBtn.layer.borderColor = UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1.0).cgColor
            
            meetBtn.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0), for: .normal)
            
            
            deliveryBtn.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
            deliveryBtn.setTitleColor(UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0), for: .normal)
            deliveryBtn.layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0).cgColor
            
        }
    }
    
    // 해시태그 완료 버튼 누르면 뷰가 사라지기
    @IBAction func finishBtn(_ sender: Any) {
        
        tagStr = "\(tagList[0])" + "," + "\(tagList[1])" + "," + "\(tagList[2])"
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.popUpConstraint.constant = 0
            self.popUpView.layer.shadowOpacity = 0
            self.view.layoutIfNeeded()
        })
        
        //컬렉션 뷰 보이게 해줌
        tagCollectionView.reloadData()
        tagCollectionView.isHidden = false
        
    }
    
    
    
    //태그 선택했을 때 "1,7,4" 이런식으로 보내면 됨
    @IBAction func tagBtn(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            if(tagList.count == 3){
                //마지막 태그버튼일 경우 회색 배경과 회색 글씨로 바꿈
                //리스트에서 빼줌
                let lastTag = tagList[0]
                
                //버튼 처리
                print("\(lastTag)")
                let lastBtn = self.view.viewWithTag(lastTag) as! UIButton
                lastBtn.setBackgroundImage(UIImage(named: "uploadHashtag"), for: .normal)
                
                //라벨 처리
                let lastLabel = lableArr[tagList[0] - 1]
                lastLabel.textColor = UIColor(red: 175/255, green:175/255, blue: 175/255, alpha: 1.0)
                tagList.remove(at: 0)
                
            }
            sender.setBackgroundImage(UIImage(named: "uploadHashtagColor"), for: .normal)
            lableArr[sender.tag - 1].textColor =
                UIColor(red: 255/255, green:111/255, blue: 97/255, alpha: 1.0)
            tagList.append(sender.tag)
        case 2:
            if(tagList.count == 3){
                //마지막 태그버튼일 경우 회색 배경과 회색 글씨로 바꿈
                //리스트에서 빼줌
                let lastTag = tagList[0]
                print("\(lastTag)")
                
                //버튼 처리
                let lastBtn = self.view.viewWithTag(lastTag) as! UIButton
                lastBtn.setBackgroundImage(UIImage(named: "uploadHashtag"), for: .normal)
                
                //라벨 처리
                let lastLabel = lableArr[tagList[0] - 1]
                lastLabel.textColor = UIColor(red: 175/255, green:175/255, blue: 175/255, alpha: 1.0)
                
                
                tagList.remove(at: 0)
                
            }
            sender.setBackgroundImage(UIImage(named: "uploadHashtagColor"), for: .normal)
            lableArr[sender.tag - 1].textColor =
                UIColor(red: 255/255, green:111/255, blue: 97/255, alpha: 1.0)
            tagList.append(sender.tag)
        case 3:
            if(tagList.count == 3){
                //마지막 태그버튼일 경우 회색 배경과 회색 글씨로 바꿈
                //리스트에서 빼줌
                
                let lastTag = tagList[0]
                print("\(lastTag)")
                
                //버튼 처리
                let lastBtn = self.view.viewWithTag(lastTag) as! UIButton
                lastBtn.setBackgroundImage(UIImage(named: "uploadHashtag"), for: .normal)
                
                //라벨 처리
                let lastLabel = lableArr[tagList[0] - 1]
                lastLabel.textColor = UIColor(red: 175/255, green:175/255, blue: 175/255, alpha: 1.0)
                
                
                tagList.remove(at: 0)
                
            }
            sender.setBackgroundImage(UIImage(named: "uploadHashtagColor"), for: .normal)
            lableArr[sender.tag - 1].textColor =
                UIColor(red: 255/255, green:111/255, blue: 97/255, alpha: 1.0)
            tagList.append(sender.tag)
        case 4:
            if(tagList.count == 3){
                //마지막 태그버튼일 경우 회색 배경과 회색 글씨로 바꿈
                //리스트에서 빼줌
                let lastTag = tagList[0]
                print("\(lastTag)")
                
                //버튼 처리
                let lastBtn = self.view.viewWithTag(lastTag) as! UIButton
                lastBtn.setBackgroundImage(UIImage(named: "uploadHashtag"), for: .normal)
                
                //라벨 처리
                let lastLabel = lableArr[tagList[0] - 1]
                lastLabel.textColor = UIColor(red: 175/255, green:175/255, blue: 175/255, alpha: 1.0)
                
                
                tagList.remove(at: 0)
                
            }
            sender.setBackgroundImage(UIImage(named: "uploadHashtagColor"), for: .normal)
            lableArr[sender.tag - 1].textColor =
                UIColor(red: 255/255, green:111/255, blue: 97/255, alpha: 1.0)
            tagList.append(sender.tag)
        case 5:
            if(tagList.count == 3){
                //마지막 태그버튼일 경우 회색 배경과 회색 글씨로 바꿈
                //리스트에서 빼줌
                let lastTag = tagList[0]
                print("\(lastTag)")
                
                //버튼 처리
                let lastBtn = self.view.viewWithTag(lastTag) as! UIButton
                lastBtn.setBackgroundImage(UIImage(named: "uploadHashtag"), for: .normal)
                
                //라벨 처리
                let lastLabel = lableArr[tagList[0] - 1]
                lastLabel.textColor = UIColor(red: 175/255, green:175/255, blue: 175/255, alpha: 1.0)
                
                
                tagList.remove(at: 0)
                
            }
            sender.setBackgroundImage(UIImage(named: "uploadHashtagColor"), for: .normal)
            lableArr[sender.tag - 1].textColor =
                UIColor(red: 255/255, green:111/255, blue: 97/255, alpha: 1.0)
            tagList.append(sender.tag)
        case 6:
            if(tagList.count == 3){
                //마지막 태그버튼일 경우 회색 배경과 회색 글씨로 바꿈
                //리스트에서 빼줌
                let lastTag = tagList[0]
                print("\(lastTag)")
                
                //버튼 처리
                let lastBtn = self.view.viewWithTag(lastTag) as! UIButton
                
                
                lastBtn.setBackgroundImage(UIImage(named: "uploadHashtag"), for: .normal)
                
                //라벨 처리
                let lastLabel = lableArr[tagList[0] - 1]
                lastLabel.textColor = UIColor(red: 175/255, green:175/255, blue: 175/255, alpha: 1.0)
                
                
                tagList.remove(at: 0)
                
            }
            sender.setBackgroundImage(UIImage(named: "uploadHashtagColor"), for: .normal)
            lableArr[sender.tag - 1].textColor =
                UIColor(red: 255/255, green:111/255, blue: 97/255, alpha: 1.0)
            tagList.append(sender.tag)
        case 7:
            if(tagList.count == 3){
                //마지막 태그버튼일 경우 회색 배경과 회색 글씨로 바꿈
                //리스트에서 빼줌
                let lastTag = tagList[0]
                print("\(lastTag)")
                
                //버튼 처리
                let lastBtn = self.view.viewWithTag(lastTag) as! UIButton
                lastBtn.setBackgroundImage(UIImage(named: "uploadHashtag"), for: .normal)
                
                //라벨 처리
                let lastLabel = lableArr[tagList[0] - 1]
                lastLabel.textColor = UIColor(red: 175/255, green:175/255, blue: 175/255, alpha: 1.0)
                
                
                tagList.remove(at: 0)
                
            }
            sender.setBackgroundImage(UIImage(named: "uploadHashtagColor"), for: .normal)
            lableArr[sender.tag - 1].textColor =
                UIColor(red: 255/255, green:111/255, blue: 97/255, alpha: 1.0)
            tagList.append(sender.tag)
        case 8:
            if(tagList.count == 3){
                //마지막 태그버튼일 경우 회색 배경과 회색 글씨로 바꿈
                //리스트에서 빼줌
                let lastTag = tagList[0]
                print("\(lastTag)")
                
                //버튼 처리
                let lastBtn = self.view.viewWithTag(lastTag) as! UIButton
                lastBtn.setBackgroundImage(UIImage(named: "uploadHashtag"), for: .normal)
                
                //라벨 처리
                let lastLabel = lableArr[tagList[0] - 1]
                lastLabel.textColor = UIColor(red: 175/255, green:175/255, blue: 175/255, alpha: 1.0)
                
                
                tagList.remove(at: 0)
                
            }
            sender.setBackgroundImage(UIImage(named: "uploadHashtagColor"), for: .normal)
            lableArr[sender.tag - 1].textColor =
                UIColor(red: 255/255, green:111/255, blue: 97/255, alpha: 1.0)
            tagList.append(sender.tag)
        case 9:
            if(tagList.count == 3){
                //마지막 태그버튼일 경우 회색 배경과 회색 글씨로 바꿈
                //리스트에서 빼줌
                let lastTag = tagList[0]
                print("\(lastTag)")
                
                //버튼 처리
                let lastBtn = self.view.viewWithTag(lastTag) as! UIButton
                lastBtn.setBackgroundImage(UIImage(named: "uploadHashtag"), for: .normal)
                
                //라벨 처리
                let lastLabel = lableArr[tagList[0] - 1]
                lastLabel.textColor = UIColor(red: 175/255, green:175/255, blue: 175/255, alpha: 1.0)
                
                
                tagList.remove(at: 0)
                
            }
            sender.setBackgroundImage(UIImage(named: "uploadHashtagColor"), for: .normal)
            lableArr[sender.tag - 1].textColor =
                UIColor(red: 255/255, green:111/255, blue: 97/255, alpha: 1.0)
            tagList.append(sender.tag)
        case 10:
            if(tagList.count == 3){
                //마지막 태그버튼일 경우 회색 배경과 회색 글씨로 바꿈
                //리스트에서 빼줌
                let lastTag = tagList[0]
                print("\(lastTag)")
                
                //버튼 처리
                let lastBtn = self.view.viewWithTag(lastTag) as! UIButton
                lastBtn.setBackgroundImage(UIImage(named: "uploadHashtag"), for: .normal)
                
                //라벨 처리
                let lastLabel = lableArr[tagList[0] - 1]
                lastLabel.textColor = UIColor(red: 175/255, green:175/255, blue: 175/255, alpha: 1.0)
                
                
                tagList.remove(at: 0)
                
            }
            sender.setBackgroundImage(UIImage(named: "uploadHashtagColor"), for: .normal)
            lableArr[sender.tag - 1].textColor =
                UIColor(red: 255/255, green:111/255, blue: 97/255, alpha: 1.0)
            tagList.append(sender.tag)
        default:
            print("")
        }
        
        
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


//태그 컬렉션 뷰 처리
extension UploadMainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       return CGSize(width: 101, height: 27)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
     return 13
}
}

extension UploadMainVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tagCollectionView.dequeueReusableCell(withReuseIdentifier: "tagCollectionCell", for: indexPath) as! TagCollectionCell
        
        cell.tagImageView.layer.cornerRadius = 15
        
        cell.tagImageView.layer.borderColor = UIColor(red: 255/255, green: 111/255, blue: 97/255, alpha: 1.0).cgColor
        cell.tagImageView.layer.borderWidth = 1.0
        
        
        cell.tagLabel.text = lableArr[indexPath.item].text!
        return cell
    }
}


extension UploadMainVC{
    
    @objc func close(){
        dismiss(animated: true)
    }
    
    //서버에 등록하기
    func upload(){
        
        UploadArtService.shared.upload(a_name: artName!, a_width: Int(width)! , a_height: Int(yOff)!, a_depth: Int(height)!, a_category: category, a_purchaseState: 1, a_form: figure, a_price: 5000, a_detail: artDescription!, a_year: artYear!, pic_url: choiceImg.image!, a_tags: tagStr, a_license: artLicense!){ (res) in guard let status = res.status else { return }
            
            print(status)
            
        }
        print("\(artName!) " + "\(Int(width)!) " + "\(Int(yOff)!) " + "\(Int(height)!) " + "\(category!) " + "\(figure!) " + "\(artDescription!) " + "\(artYear!) " + "\(artLicense!)")
        
    }
    
}


