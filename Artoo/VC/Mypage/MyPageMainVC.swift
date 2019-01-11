//
//  MyPageMainVC.swift
//  Artoo
//
//  Created by 보윤 on 30/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//


import UIKit

class MyPageMainVC: UIViewController {
    
    var tabName : [String] = ["작품", "저장", "거래" , "후기"]
    var tabCount : [Int] = [0,0,0,0]
    var workInfo: [MyArtWork]? //MyPageWork는 세부 데이터
    var saveWorkInfo: [MyArtWork]?
    var buyInfo: [MyPurchase]?
    var reviewInfo: [MyReview]?

    
    var userName:String?
    var userDescription:String?
    var artworkNum:Int?
    
    //탭 바로 사용할 컬렉션뷰
    @IBOutlet weak var mypageCollectionView: UICollectionView!
    
    //탭 변경할 인덱스
    var selectedIndex:IndexPath = IndexPath.init(row: 0, section: 0)
    
    
    @IBOutlet weak var MainIntroductionLabel: UILabel!
    
    @IBOutlet weak var introTextView: UITextView!
    
    //자기 소개 변경하는 버튼
    @IBOutlet weak var editIntroBtn: UIButton!
    
    //자기 소개 저장하는 버튼
    @IBOutlet weak var saveIntroBtn: UIButton!
    
    
    //내용 변경할 containerView
    @IBOutlet weak var containerView: UIView!
    
    //작품 업로드 전 다이얼로그
    @IBOutlet weak var noticeView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveIntroBtn.isHidden = true
        introTextView.isUserInteractionEnabled = false
        
        
        // noticeView.isHidden = true
        
        setData(completion: setUI)
        
        
        
        
        //작품 저장 거래 후기
        //컬렉션뷰 세팅
        mypageCollectionView.delegate = self
        mypageCollectionView.dataSource = self
        
        editIntroBtn.addTarget(self, action: #selector(editIntro), for: .touchUpInside)
        saveIntroBtn.addTarget(self, action: #selector(saveIntro), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObserver()
    }
    
    //알림 버튼 눌렀을 때
    @IBAction func notificationBtn(_ sender: Any) {
        
        guard let noticeVC = storyboard?.instantiateViewController(withIdentifier: "multinotify") as? MultiNotifyVC else { return }
        
        navigationController?.pushViewController(noticeVC, animated: true)
    }
    
    // 확인 버튼 눌렀을 때 작품 업로드 창 넘어가기
    @IBAction func okBtn(_ sender: Any) {
        guard let uploadVC = storyboard?.instantiateViewController(withIdentifier: "uploadMain") as? UploadMainVC else { return }
        
        navigationController?.pushViewController(uploadVC, animated: true)
    }
    
    //설정 버튼 눌렀을 때
    
    @IBAction func settingBtn(_ sender: Any) {
        guard let settingVC = storyboard?.instantiateViewController(withIdentifier: "settingMainPage") as? SettingMainVC else { return }
        navigationController?.pushViewController(settingVC, animated: true)
    }
    
    //art_page리턴
    private lazy var artPage: MyPageWorkVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: MyPageWorkVC.reuseIdentifier) as! MyPageWorkVC

        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    
    //store_page리턴
    private lazy var storePage: MyPageStoreVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "store_page") as! MyPageStoreVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    
    //buy_page리턴
    private lazy var buyPage: MyPageBuyVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "buy_page") as! MyPageBuyVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    //review_page리턴
    private lazy var reviewPage: MyPageReviewVC = {
        let storyboard = Storyboard.shared().mypageStoryboard
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "review_page") as! MyPageReviewVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
}

extension MyPageMainVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell =  mypageCollectionView.cellForItem(at: indexPath) as! MyPageTabCell
        cell.delegate.selectTab(at: indexPath)
        mypageCollectionView.reloadData()
        
        updateView(selected: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 48, height: 33.5)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 48
    }
    
}

extension MyPageMainVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data = tabName[indexPath.row]
        let count = tabCount[indexPath.row]
        let cell =  mypageCollectionView.dequeueReusableCell(withReuseIdentifier: "MyPageTabCell", for: indexPath) as! MyPageTabCell
        cell.delegate = self
        cell.indexPath = indexPath
        
        
    
        if selectedIndex == indexPath {
            cell.cellSelected = true
        }else {
            cell.cellSelected = false
        }
        print("\(data)")
        

        cell.tabName.text = gsno(data)
        cell.tabCount.text = "\(gino(count))"
        return cell
    }
    
    
}

extension MyPageMainVC : MyMainDelegate {
    func selectTab(at indexPath: IndexPath) {
        selectedIndex = indexPath
        mypageCollectionView.reloadData()
    }
}


////여기서부터 extension VC

extension MyPageMainVC {
    
    func setData(completion: @escaping() -> Void){
        let userIdx = UserDefaults.standard.integer(forKey: "userIndex")
        print("\(userIdx)")
        MyPageWorkService.shared.getMyPageWork(user_idx: userIdx ){
            (data) in guard let status = data.status else{ return }
            switch status{
            case 200:
                guard let workData = data.data else { return }
                self.workInfo = workData
                print("\(workData)")
                self.userName = data.u_name
                self.userDescription = data.u_description
                self.artworkNum = data.dataNum //작품 수
            case 500:
                print("서버 내부 오류")
            default:
                print("hihi")
            }
        }
        
        MyPageSaveService.shared.getSaveWork(user_idx: userIdx ){
            (data) in guard let status = data.status else{ return }
            print("i am status \(status)")
            switch status{
            case 201:
                guard let saveWorkData = data.data else { return }
                self.saveWorkInfo = saveWorkData
                print("\(saveWorkData)")
            case 500:
                print("서버 내부 오류")
            default:
                print("hihi")
            }
        }
        
        
        MyPageBuyService.shared.getBuyList(user_idx: userIdx ){
            (data) in guard let status = data.status else{ return }
            print("i am status \(status)")
            switch status{
            case 200:
                guard let buyData = data.data else { return }
                self.buyInfo = buyData
                print("\(buyData)")
            case 500:
                print("서버 내부 오류")
            default:
                print("hihi")
            }
        }

        MyPageReviewService.shared.getReviewList(user_idx: userIdx ){
            (data) in guard let status = data.status else{ return }
            print("i am status \(status)")
            switch status{
            case 201:
                guard let reviewData = data.data else { return }
                self.reviewInfo = reviewData
                print("\(reviewData)")
            case 500:
                print("서버 내부 오류")
            default:
                print("hihi")
            }
        }
        
        completion()
        
        
    }
    
    
    func setUI(){
        
        if let count1 = workInfo?.count {tabCount[0] = count1}
        if let count2 = saveWorkInfo?.count {tabCount[1] = count2}
        if let count3 = buyInfo?.count {tabCount[2] = count3}
        if let count4 = reviewInfo?.count {tabCount[3] = count4}

        updateView(selected: 0)
        MainIntroductionLabel.text = userName
        introTextView.text = userDescription
        mypageCollectionView.reloadData()
    }
    
    
    
    @objc func editIntro(){
        saveIntroBtn.isHidden = false
        introTextView.isUserInteractionEnabled = true
        introTextView.becomeFirstResponder()
    }
    
    @objc func saveIntro(){
        introTextView.isUserInteractionEnabled = false
        saveIntroBtn.isHidden = true
        //서버로 정보 보냄(완료시 다시 버튼 없애줌
    }
    
    func saveIntroToServer(){
        
        
        
        
    }
    
    
    
    
    
    
    
    private func add(asChildViewController viewController: UIViewController) {
        
        addChild(viewController)
        containerView.addSubview(viewController.view)
        
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    private func updateView(selected: Int){
        if selected == 0 {
            remove(asChildViewController: storePage)
            remove(asChildViewController: buyPage)
            remove(asChildViewController: reviewPage)
            print("hihihi")
            if let info =  self.workInfo {
                print("정보오오전달")
                artPage.workInfo = info
            }
           
            add(asChildViewController: artPage)
     

        } else if selected == 1 {
            remove(asChildViewController: artPage)
            remove(asChildViewController: buyPage)
            remove(asChildViewController: reviewPage)
            add(asChildViewController: storePage)
        } else if selected == 2 {
            remove(asChildViewController: artPage)
            remove(asChildViewController: storePage)
            remove(asChildViewController: reviewPage)
            add(asChildViewController: buyPage)
        } else {
            remove(asChildViewController: artPage)
            remove(asChildViewController: storePage)
            remove(asChildViewController: buyPage)
            add(asChildViewController: reviewPage)
        }
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(presentNoticeView), name: Notification.Name("presentNoticeView"), object: nil)
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("presentNoticeView"), object: nil)
    }
    
    @objc func presentNoticeView() {
        //    noticeView.isHidden = false
    }
}
