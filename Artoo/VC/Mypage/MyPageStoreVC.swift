
import UIKit

class MyPageStoreVC: UIViewController {
    
    var saveWorkInfo:[MyArtWork]?
    
    @IBOutlet weak var imageCollection: UICollectionView!
    
    //작품 상세 정보창으로 이동하는 컨트롤러
    private lazy var artBuyVC: BuyVC = {
        let storyboard = Storyboard.shared().artStoryboard
        
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "choiceArt") as! BuyVC
        
        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollection.reloadData()
        imageCollection.dataSource = self
        imageCollection.delegate = self
    }
    
}

extension MyPageStoreVC {
    
    
    
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
        guard let data = saveWorkInfo?[indexPath.row] else { return }
        artBuyVC.sendArtIndex = data.aIndex!
        navigationController?.pushViewController(artBuyVC, animated: true)
    }
    
    
}
