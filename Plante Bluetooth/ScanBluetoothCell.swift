import UIKit

protocol cellDelegate {
    func cellSelected(cell: ScanBluetoothCell)
}

class ScanBluetoothCell: UITableViewCell {
    

    @IBOutlet var labelCell: UILabel!
    @IBOutlet var rssiState: UIImageView!
    @IBOutlet var rssiNumber: UILabel!
    
    var delegate: cellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        delegate?.cellSelected(cell: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            
        } else {
           
        }
    }

}
