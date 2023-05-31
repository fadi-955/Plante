import UIKit
import CoreBluetooth
import Lottie

protocol plantControllerDelegate {
    func dismissPlanteController()
}

class PlantController: UIViewController, UIAdaptivePresentationControllerDelegate{

    // MARK: - Properties
    var delegate: plantControllerDelegate?
    var humiditySet = Int8()
    let sizeScreen = UIScreen.main.bounds
    // MARK: - IBOutlets
    @IBOutlet var botScreenView: UIView!
    @IBOutlet var labelHumidity: UILabel!
    @IBOutlet var hauteurTextBubble: NSLayoutConstraint!
    @IBOutlet var labelBubble: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var bubbleSize: NSLayoutConstraint!
    @IBOutlet var textBubbleSize: NSLayoutConstraint!
    @IBOutlet var animationBGView: UIView!
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            self.isModalInPresentation = true
        }
        
        
        botScreenView.layer.cornerRadius = 30
        hauteurTextBubble.constant = -(sizeScreen.width * 0.08)
        bubbleSize.constant = -200
        labelBubble.isHidden = true
        descriptionLabel.isHidden = true
        
        setupAnimation()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [.curveEaseInOut], animations: {
            self.bubbleSize.constant = 0
            self.textBubbleSize.constant = 0
            self.view.layoutIfNeeded()
        })
        labelBubble.isHidden = false
        descriptionLabel.isHidden = false
        UIApplication.shared.applicationIconBadgeNumber = 0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    

    // MARK: - Set Up
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        delegate?.dismissPlanteController()
    }
    
    
    func setupAnimation(){}
 
    // MARK: - IBActions
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true) {
            self.delegate?.dismissPlanteController()
            
        }
    }
}
