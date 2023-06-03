import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import Lottie

class StartViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  

  // MARK: - Properties
    let url = "https://en.wikipedia.org/w/api.php"
    let imagePicker = UIImagePickerController()
    var userImage = UIImage()
    var plantResult = String()

  // MARK: - IBOutlets
    @IBOutlet var startActionOutlet: UIButton!
    @IBOutlet var lottieView: UIView!
    

  // MARK: - Life Cycle
    override func viewDidLoad() {
          super.viewDidLoad()
        startActionOutlet.layer.cornerRadius = 20
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
      }
    
    override func viewDidAppear(_ animated: Bool) {
     
    }
      

  // MARK: - Set Up
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            userImage = image
            print("IMAGE WELL RECEIVED")
            guard let ciimage = CIImage(image: image)
            else {
                fatalError("Cannot convert to ciimage")
            }
            detect(image: ciimage)
        }
       
        imagePicker.dismiss(animated: true, completion: {
            self.performSegue(withIdentifier: "toPlantResults", sender: self)
        })
    }
    
    
    func detect(image: CIImage) {
        let model: Plant_Classifier_1 = {
            do {
                let config = MLModelConfiguration()
                return try Plant_Classifier_1(configuration: config)
            } catch {
                print(error)
                fatalError("Failed to create Plant_Classifier_1")
            }
        }()
        
        let request = VNCoreMLRequest(model: try! VNCoreMLModel(for: model.model)) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Failed to process image")
            }
            if let firstResult = results.first {
                self.plantResult = firstResult.identifier
                print(firstResult.confidence)
                self.requestInfo(plantName: firstResult.identifier)
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }

  // MARK: - IBActions
    @IBAction func startAction(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
    }
    

  // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? DescriptionViewController
        destinationVC?.imageFromUser = userImage
        destinationVC?.plantFound = plantResult
    }

  // MARK: - Network Manager calls
    func requestInfo(plantName: String){
        let parameters : [String:String] = ["format":"json", "action":"query", "prop":"extracts", "exintro":"","explaintext":"", "titles":plantName, "indexpageids":"", "redirects":"1"]
        Alamofire.request(url, method: .get, parameters:parameters).responseJSON { (response) in
            if response.result.isSuccess{
                print(response)
            }
        }
    }
}
