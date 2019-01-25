//
//  FilterViewController.swift
//  Artoo
//
//  Created by 보윤 on 26/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    //필터 값 저장하는 구조체 filter
    var filterData = Filter()
    @IBOutlet weak var SsizeBtn: UIButton!
    @IBOutlet weak var MsizeBtn: UIButton!
    @IBOutlet weak var LsizeBtn: UIButton!
    @IBOutlet weak var XLsizeBtn: UIButton!
    @IBOutlet weak var drawingBtn: UIButton!
    @IBOutlet weak var paintingBtn: UIButton!
    @IBOutlet weak var orientalBtn: UIButton!
    @IBOutlet weak var mixBtn: UIButton!
    @IBOutlet weak var craftBtn: UIButton!
    @IBOutlet weak var pictureBtn: UIButton!
    @IBOutlet weak var objectBtn: UIButton!
    @IBOutlet weak var abstractBtn: UIButton!
    @IBOutlet weak var sineryBtn: UIButton!
    @IBOutlet weak var personBtn: UIButton!
    @IBOutlet weak var animalBtn: UIButton!
    @IBOutlet weak var plantBtn: UIButton!
    @IBOutlet weak var sizeImage: UIImageView!
    @IBOutlet weak var sLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var xlLabel: UILabel!
    
    
    var delegate: FilterDataDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //찾기 버튼 누르면 버튼에 해당하는 글자를 변수에 저장한 후 초기화면 라벨에 연결해주기.
    
    //닫기 버튼 누르면 
    @IBAction func backBtn(_ sender: Any) {
        
    }
    
    //사이즈 버튼 클릭 시 이미지 변경과 라벨 색 변경
    @IBAction func sizeBtn(_ sender: UIButton) {
        if sender.tag == 1 {
            filterData.size = "S"
            SsizeBtn.setImage(UIImage(named: "filterSizeS2"), for: .normal)
            MsizeBtn.setImage(UIImage(named: "filterSizeM"), for: .normal)
            LsizeBtn.setImage(UIImage(named: "filterSizeM"), for: .normal)
            XLsizeBtn.setImage(UIImage(named:"filterSizeM"), for: .normal)
            sizeImage.image = UIImage(named:"filterSizeSSelect")
            sLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            mLabel.textColor = UIColor(red: 199/255, green: 202/255, blue: 209/255, alpha: 1.0)
            lLabel.textColor = UIColor(red: 199/255, green: 202/255, blue: 209/255, alpha: 1.0)
            xlLabel.textColor = UIColor(red: 199/255, green: 202/255, blue: 209/255, alpha: 1.0)
        }else if sender.tag == 2{
            filterData.size = "M"
            SsizeBtn.setImage(UIImage(named: "filterSizeM"), for: .normal)
            MsizeBtn.setImage(UIImage(named: "filterSizeS2"), for: .normal)
            LsizeBtn.setImage(UIImage(named: "filterSizeM"), for: .normal)
            XLsizeBtn.setImage(UIImage(named: "filterSizeM"), for: .normal)
            sizeImage.image = UIImage(named:"filterSizeMSelect")
            
            mLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            sLabel.textColor = UIColor(red: 199/255, green: 202/255, blue: 209/255, alpha: 1.0)
            lLabel.textColor = UIColor(red: 199/255, green: 202/255, blue: 209/255, alpha: 1.0)
            xlLabel.textColor = UIColor(red: 199/255, green: 202/255, blue: 209/255, alpha: 1.0)
            
        }else if sender.tag == 3{
            filterData.size = "L"
            SsizeBtn.setImage(UIImage(named: "filterSizeM"), for: .normal)
            MsizeBtn.setImage(UIImage(named: "filterSizeM"), for: .normal)
            LsizeBtn.setImage(UIImage(named: "filterSizeS2"), for: .normal)
            XLsizeBtn.setImage(UIImage(named: "filterSizeM"), for: .normal)
            sizeImage.image = UIImage(named:"filterSizeLSelect")
            
            lLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            mLabel.textColor = UIColor(red: 199/255, green: 202/255, blue: 209/255, alpha: 1.0)
            sLabel.textColor = UIColor(red: 199/255, green: 202/255, blue: 209/255, alpha: 1.0)
            xlLabel.textColor = UIColor(red: 199/255, green: 202/255, blue: 209/255, alpha: 1.0)
            
        }else if sender.tag == 4{
            filterData.size = "XL"
            SsizeBtn.setImage(UIImage(named: "filterSizeM"), for: .normal)
            MsizeBtn.setImage(UIImage(named: "filterSizeM"), for: .normal)
            LsizeBtn.setImage(UIImage(named: "filterSizeM"), for: .normal)
            XLsizeBtn.setImage(UIImage(named: "filterSizeS2"), for: .normal)
            sizeImage.image = UIImage(named:"filterSizeXlSelect")
            
            xlLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            mLabel.textColor = UIColor(red: 199/255, green: 202/255, blue: 209/255, alpha: 1.0)
            lLabel.textColor = UIColor(red: 199/255, green: 202/255, blue: 209/255, alpha: 1.0)
            sLabel.textColor = UIColor(red: 199/255, green: 202/255, blue: 209/255, alpha: 1.0)
        }
    }
    
    @IBAction func figureBtn(_ sender: UIButton) {
        if sender.tag == 5{
            filterData.figure = "드로잉"
            drawingBtn.setImage(UIImage(named:"filterDrawingSelect"), for: .normal)
            paintingBtn.setImage(UIImage(named:"filterPaintingNoSelect"), for: .normal)
            orientalBtn.setImage(UIImage(named:"filterOrientalNoSelect"), for: .normal)
            mixBtn.setImage(UIImage(named:"filterMixNoSelect"), for: .normal)
            craftBtn.setImage(UIImage(named:"filterCraftNoSelect"), for: .normal)
            pictureBtn.setImage(UIImage(named:"filterPictureNoSelect"), for: .normal)
            
            
        }else if sender.tag == 6{
            filterData.figure = "페인팅"
            drawingBtn.setImage(UIImage(named:"filterDrawingNoSelect"), for: .normal)
            paintingBtn.setImage(UIImage(named:"filterPaintingSelect"), for: .normal)
            orientalBtn.setImage(UIImage(named:"filterOrientalNoSelect"), for: .normal)
            mixBtn.setImage(UIImage(named:"filterMixNoSelect"), for: .normal)
            craftBtn.setImage(UIImage(named:"filterCraftNoSelect"), for: .normal)
            pictureBtn.setImage(UIImage(named:"filterPictureNoSelect"), for: .normal)
        }else if sender.tag == 7{
            filterData.figure = "동양화"
            drawingBtn.setImage(UIImage(named:"filterDrawingNoSelect"), for: .normal)
            paintingBtn.setImage(UIImage(named:"filterPaintingNoSelect"), for: .normal)
            orientalBtn.setImage(UIImage(named:"filterOrientalSelect"), for: .normal)
            mixBtn.setImage(UIImage(named:"filterMixNoSelect"), for: .normal)
            craftBtn.setImage(UIImage(named:"filterCraftNoSelect"), for: .normal)
            pictureBtn.setImage(UIImage(named:"filterPictureNoSelect"), for: .normal)
        }else if sender.tag == 8{
            filterData.figure = "혼합매체"
            drawingBtn.setImage(UIImage(named:"filterDrawingNoSelect"), for: .normal)
            paintingBtn.setImage(UIImage(named:"filterPaintingNoSelect"), for: .normal)
            orientalBtn.setImage(UIImage(named:"filterOrientalNoSelect"), for: .normal)
            mixBtn.setImage(UIImage(named:"filterMixSelect"), for: .normal)
            craftBtn.setImage(UIImage(named:"filterCraftNoSelect"), for: .normal)
            pictureBtn.setImage(UIImage(named:"filterPictureNoSelect"), for: .normal)
        }else if sender.tag == 9{
            filterData.figure = "조형/공예"
            drawingBtn.setImage(UIImage(named:"filterDrawingNoSelect"), for: .normal)
            paintingBtn.setImage(UIImage(named:"filterPaintingNoSelect"), for: .normal)
            orientalBtn.setImage(UIImage(named:"filterOrientalNoSelect"), for: .normal)
            mixBtn.setImage(UIImage(named:"filterMixNoSelect"), for: .normal)
            craftBtn.setImage(UIImage(named:"filterCraftSelect"), for: .normal)
            pictureBtn.setImage(UIImage(named:"filterPictureNoSelect"), for: .normal)
        }else if sender.tag == 10{
            filterData.figure = "사진"
            drawingBtn.setImage(UIImage(named:"filterDrawingNoSelect"), for: .normal)
            paintingBtn.setImage(UIImage(named:"filterPaintingNoSelect"), for: .normal)
            orientalBtn.setImage(UIImage(named:"filterOrientalNoSelect"), for: .normal)
            mixBtn.setImage(UIImage(named:"filterMixNoSelect"), for: .normal)
            craftBtn.setImage(UIImage(named:"filterCraftNoSelect"), for: .normal)
            pictureBtn.setImage(UIImage(named:"filterPictureSelect"), for: .normal)
        }
    }
    
    @IBAction func categoryBtn(_ sender: UIButton) {
        if sender.tag == 11{
            filterData.category = "인물"
            objectBtn.setImage(UIImage(named:"filterObjectNoSelect"), for: .normal)
            abstractBtn.setImage(UIImage(named:"filterAbstractNoSelect"), for: .normal)
            sineryBtn.setImage(UIImage(named:"filterSceneryNoSelect"), for: .normal)
            personBtn.setImage(UIImage(named:"filterPersonSelect"), for: .normal)
            animalBtn.setImage(UIImage(named:"filterAnimalNoSelect"), for: .normal)
            plantBtn.setImage(UIImage(named:"filterPlantNoSelect"), for: .normal)
        }else if sender.tag == 12{
            filterData.category = "동물"
            objectBtn.setImage(UIImage(named:"filterObjectNoSelect"), for: .normal)
            abstractBtn.setImage(UIImage(named:"filterAbstractNoSelect"), for: .normal)
            sineryBtn.setImage(UIImage(named:"filterSceneryNoSelect"), for: .normal)
            personBtn.setImage(UIImage(named:"filterPersonNoSelect"), for: .normal)
            animalBtn.setImage(UIImage(named:"filterAnimalSelect"), for: .normal)
            plantBtn.setImage(UIImage(named:"filterPlantNoSelect"), for: .normal)
        }else if sender.tag == 13{
            filterData.category = "식물"
            objectBtn.setImage(UIImage(named:"filterObjectNoSelect"), for: .normal)
            abstractBtn.setImage(UIImage(named:"filterAbstractNoSelect"), for: .normal)
            sineryBtn.setImage(UIImage(named:"filterSceneryNoSelect"), for: .normal)
            personBtn.setImage(UIImage(named:"filterPersonNoSelect"), for: .normal)
            animalBtn.setImage(UIImage(named:"filterAnimalNoSelect"), for: .normal)
            plantBtn.setImage(UIImage(named:"filterPlantSelect"), for: .normal)
        }else if sender.tag == 14{
            filterData.category = "사물"
            objectBtn.setImage(UIImage(named:"filterObjectSelect"), for: .normal)
            abstractBtn.setImage(UIImage(named:"filterAbstractNoSelect"), for: .normal)
            sineryBtn.setImage(UIImage(named:"filterSceneryNoSelect"), for: .normal)
            personBtn.setImage(UIImage(named:"filterPersonNoSelect"), for: .normal)
            animalBtn.setImage(UIImage(named:"filterAnimalNoSelect"), for: .normal)
            plantBtn.setImage(UIImage(named:"filterPlantNoSelect"), for: .normal)
        }else if sender.tag == 15{
            filterData.category = "추상"
            objectBtn.setImage(UIImage(named:"filterObjectNoSelect"), for: .normal)
            abstractBtn.setImage(UIImage(named:"filterAbstractSelect"), for: .normal)
            sineryBtn.setImage(UIImage(named:"filterSceneryNoSelect"), for: .normal)
            personBtn.setImage(UIImage(named:"filterPersonNoSelect"), for: .normal)
            animalBtn.setImage(UIImage(named:"filterAnimalNoSelect"), for: .normal)
            plantBtn.setImage(UIImage(named:"filterPlantNoSelect"), for: .normal)
        }else if sender.tag == 16{
            filterData.category = "풍경"
            objectBtn.setImage(UIImage(named:"filterObjectNoSelect"), for: .normal)
            abstractBtn.setImage(UIImage(named:"filterAbstractNoSelect"), for: .normal)
            sineryBtn.setImage(UIImage(named:"filterScenerySelect"), for: .normal)
            personBtn.setImage(UIImage(named:"filterPersonNoSelect"), for: .normal)
            animalBtn.setImage(UIImage(named:"filterAnimalNoSelect"), for: .normal)
            plantBtn.setImage(UIImage(named:"filterPlantNoSelect"), for: .normal)
        }
    }
    
    //닫기 버튼 누르면 아웃
    @IBAction func closeBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func findBtn(_ sender: UIButton) {
        //데이터 선택 안되었을 경우의 예외처리 추가 요망
        
        
        //버튼 누르면 구조체 전달
        self.delegate.sendFilterData(data: filterData)
        self.navigationController?.popViewController(animated: true)
    }
}

