//
//  CharacterDetailView.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 05/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import UIKit

class CharacterDetailView: UIViewController {
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var comicsTableView: UITableView!
    

    //MARK: Variables
    var viewModel: CharacterDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        updateInfo()
    }

    func updateInfo() {
        guard let hero = viewModel?.hero else { return }
        characterImageView.downloadImage(from: "\(hero.thumbnail.path ).\(hero.thumbnail.thumbnailExtension )")
        characterNameLabel.text = hero.name
        comicsTableView.reloadData()
    }

}

extension CharacterDetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.hero?.comics.items.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let hero = viewModel?.hero else { return UITableViewCell() }
        let cell = UITableViewCell()
        cell.textLabel?.text = hero.comics.items[indexPath.row].name
        return cell
    }


}

extension CharacterDetailView: CharacterDetailViewModelDelegate {

    func didFetchedHero() {
        self.updateInfo()
    }
}
