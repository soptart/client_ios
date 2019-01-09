
import UIKit

class TodayArtooDetailVC: UIViewController {
    var img:String?
    
    @IBAction func dismissDetail(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBOutlet weak var contentHeightConst: NSLayoutConstraint!
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        setupImageView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupImageView() {
        guard let image = UIImage(named: img ?? "") else { return }
        let ratio = image.cropRatioOfWidth
        let height = self.view.frame.width * ratio
        contentHeightConst.constant = height
        detailImageView.image = image
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
