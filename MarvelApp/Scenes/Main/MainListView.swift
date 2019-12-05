//
//  ViewController.swift
//  MarvelApp
//
//  Created by Hariel Giacomuzzi on 03/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import UIKit

class MainListView: UIViewController {
    //MARK: Outlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    //MARK: Variables
    var viewModel: MainListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = MainListViewModel()
        viewModel?.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.getHeros()
    }

}

extension MainListView: UITableViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y >= scrollView.contentSize.height * 0.8 {
            self.activityIndicator.startAnimating()
            self.viewModel?.getHeros()
        }
    }
}

extension MainListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.heros.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainListCell, for: indexPath) as? MainListTableViewCell,
            let viewModel = viewModel else {
            return UITableViewCell()
        }
        let cellModel = MainListCellModel(hero: viewModel.heros[indexPath.row])
        cell.setup(model: cellModel)

        return cell
    }
}

extension MainListView: MainListViewModelDelegate {

    func didFetchedHeros() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
}
