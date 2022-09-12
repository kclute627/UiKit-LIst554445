//
//  ViewController.swift
//  UiKit LIst
//
//  Created by Kyle  Clutter on 9/11/22.
//

import UIKit

class MenuListViewController: UICollectionViewController {
  typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
  typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>

  var dataSource: DataSource!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    let listLayout = listLayout()
    collectionView.collectionViewLayout = listLayout

    let cellRegistration = UICollectionView.CellRegistration { (cell: UICollectionViewListCell, indexPath: IndexPath, _: String) in

      let menuItem = Order.sampleData[indexPath.item]

      var contentConfiguration = cell.defaultContentConfiguration()

      contentConfiguration.text = menuItem.title

      cell.contentConfiguration = contentConfiguration
    }

    dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
      collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
    }

    var snapshot = Snapshot()
    snapshot.appendSections([0])

    snapshot.appendItems(Order.sampleData.map { $0.title })
    dataSource.apply(snapshot)
    collectionView.largeContentTitle = "Today's Menu"
    collectionView.dataSource = dataSource
  }

  private func listLayout() -> UICollectionViewCompositionalLayout {
    var listConfig = UICollectionLayoutListConfiguration(appearance: .grouped)

    listConfig.showsSeparators = false

    listConfig.backgroundColor = .clear

    return UICollectionViewCompositionalLayout.list(using: listConfig)
  }
}
