import UIKit

protocol cellDelegate {
    func cellSelected(cell: ScanBluetoothCell)
}

class ScanBluetoothCell: UITableViewCell {
    var delegate: cellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        delegate?.cellSelected(cell: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {}
    }

}
