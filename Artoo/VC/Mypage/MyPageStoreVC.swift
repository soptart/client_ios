
import UIKit

class MyPageStoreVC: UIViewController {
    
    var saveWorkInfo:[MyArtWork]?
    
    @IBOutlet weak var imageCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setData(completion: setUI)

    }
    
}

extension MyPageStoreVC {
    
    func setUI(){
        imageCollection.reloadData()
        imageCollection.dataSource = self
        imageCollection.delegate = self
    }
    
    func setData(completion: @escaping() -> Void){
        let userIdx = UserDefaults.standard.integer(forKey: "userIndex")
        print("\(userIdx)")
        MyPageSaveService.shared.getSaveWork(user_idx: userIdx ){
            (data) in guard let status = data.status else{ return }
            print("i am status \(status)")
            switch status{
            case 201:
                guard let workData = data.data else { return }
                self.saveWorkInfo = workData
                print("\(workData)")
                print("방가비방가비")
                completion()
            case 500:
                print("서버 내부 오류")
            default:
                print("hihi")
            }
        }
    }
    
}


extension MyPageStoreVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = saveWorkInfo?.count else {return 1}
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = imageCollection.dequeueReusableCell(withReuseIdentifier:"storeCell", for: indexPath) as! MyPageStoreCell
        
        let data = saveWorkInfo![indexPath.row]
        cell.StoreImg.imageFromUrl(gsno(data.aUrl), defaultImgPath: "")
        cell.StoreImg.roundImage(num: 0.08)
        
        return cell
    }
    
    
}

extension MyPageStoreVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 155, height: 213)
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
    
    
    //콜렉션 뷰 아이템 클릭 시 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let data = exhibitSeeList[indexPath.row]
        //        artBuyVC.sendArtIndex = data.artIndex!
        //        navigationController?.pushViewController(artBuyVC, animated: true)
        //        print("hihi")
    }
    
    
}
