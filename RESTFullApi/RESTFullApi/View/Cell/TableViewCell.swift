//
//  TableViewCell.swift
//  RESTFullApi
//
//  Created by Md Hosne Mobarok on 30/3/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var fristName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(data: Datum) {
        fristName.text = "Frist name: \(data.firstName)"
        lastName.text = "Last name: \(data.lastName)"
        email.text = "Email: \(data.email)"
        
        if let url =  URL(string: data.avatar ?? "") {
             avatar.load(url: url)
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
