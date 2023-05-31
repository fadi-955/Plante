import UIKit
import Alamofire
import SwiftyJSON

class DescriptionViewController: UIViewController {

    
    // MARK: - Properties

    
    var imageFromUser = UIImage()
    var plantFound = String()

    // MARK: - IBOutlets
    @IBOutlet var plantImage: UIImageView!
    @IBOutlet var connectionButtonOutlet: UIButton!
    @IBOutlet var restartButtonOutlet: UIButton!
    @IBOutlet var plantName: UILabel!
    @IBOutlet var plantDescription: UILabel!
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plantImage.image = imageFromUser
        plantName.text = plantFound
        plantDescription.text = plantInfos(PlantName: plantFound)
        
       
    }
    
    
    
    override func viewWillLayoutSubviews() {
        self.plantImage.layer.cornerRadius = self.plantImage.frame.size.width / 2;
        self.plantImage.clipsToBounds = true
        self.plantImage.layoutIfNeeded()
    }

    // MARK: - Set Up
    private func plantInfos(PlantName: String) -> String {
        if PlantName == "dypsis lutescens"{
            return "De la famille des Arecacées, jusqu'à une hauteur de 1,5 à 2,5m de hauteur, nécessite une bonne lumière. L'arrosage est nécessaire sous 2 à 3 jours, représentant un taux d'humidité de 30 %"
        } else if PlantName == "aloe vera" {
            return "De la famille des Aloeacées, jusqu'à une hauteur de 0,5 à 1m de hauteur, nécessite une bonne lumière. L'arrosage est nécessaire 1 fois par semaine, représentant un taux d'humidité de 10 %"
        }else if PlantName == "cactus" {
            return "De la famille des Cactaceae, le cactus est une plante adaptée aux climats arides. Il a une hauteur variable en fonction de l'espèce et peut nécessiter une exposition directe au soleil. L'arrosage doit être réduit à une fois toutes les 2 à 3 semaines, avec un taux d'humidité de 5%."
        }else if PlantName == "coleus" {
            return "De la famille des Lamiaceae, le Coleus est une plante herbacée colorée. Il a une hauteur allant jusqu'à 1 mètre et nécessite une bonne lumière, mais pas une exposition directe au soleil. L'arrosage doit être effectué toutes les 1 à 2 semaines, avec un taux d'humidité de 50%."
        }else if PlantName == "jasmin" {
            return "De la famille des Oleaceae, le jasmin est une plante grimpante très parfumée. Il peut atteindre une hauteur de 3 à 4 mètres et nécessite une exposition directe au soleil ou à mi-ombre. L'arrosage doit être régulier, toutes les semaines en été et toutes les 2 semaines en hiver, avec un taux d'humidité de 40%."
        }else if PlantName == "musa banana" {
            return "De la famille des Musaceae, la banane Musa est une plante tropicale avec des feuilles larges et des fruits comestibles. Elle peut atteindre une hauteur de 2 à 3 mètres et nécessite une exposition directe au soleil ou à mi-ombre. L'arrosage doit être effectué toutes les 1 à 2 semaines, avec un taux d'humidité de 70%."
        }else if PlantName == "oxalis pes caprae" {
            return "De la famille des Oxalidaceae, l'Oxalis pes-caprae est une plante herbacée à feuilles clover. Elle peut atteindre une hauteur de 20 à 30 cm et nécessite une exposition directe au soleil. L'arrosage doit être effectué toutes les 1 à 2 semaines, avec un taux d'humidité de 30%."
        }else if PlantName == "palmier" {
            return "De la famille des Arecaceae, le palmier est une plante arborescente avec une hauteur variable en fonction de l'espèce. Il nécessite une exposition directe au soleil ou à mi-ombre et un arrosage régulier toutes les 1 à 2 semaines en été et toutes les 2 à 3 semaines en hiver, avec un taux d'humidité de 50%."
        }
        return ""
    }

    // MARK: - IBActions
    @IBAction func toConnectionPage(_ sender: UIButton) {
    }
    @IBAction func restartCapture(_ sender: UIButton) {
    }
    
}

