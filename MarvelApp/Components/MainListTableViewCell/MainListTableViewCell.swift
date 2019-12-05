//
//  MainListTableViewCell.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 04/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import UIKit

class MainListTableViewCell: UITableViewCell {

    @IBOutlet var heroImageView: UIImageView!
    @IBOutlet var heroNameLabel: UILabel!
    
    private var heroModel: MainListCellModel? {
        didSet {
            setupHeroName()
            setupImage()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        guard let imageView = heroImageView,
            let textLabel = heroNameLabel else { return }
        imageView.image = nil
        textLabel.text = nil
    }

    private func setupHeroName() {
        heroNameLabel.text = heroModel?.hero.name
    }

    private func setupImage() {
        heroImageView.downloadImage(from: heroModel?.hero.thumbnail.path ?? "")
    }

    func setup(model: MainListCellModel) {
        self.heroModel = model
    }
}
