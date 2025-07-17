//
//  CitySearchingCollectionViewController.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/17/25.
//

import UIKit

class CitySearchingCollectionViewController: UIViewController {
    
    // MARK: - DataSource
    var dataSource: CitySearchingCollectionViewDiffableDataSource!
    
    @IBOutlet var citySearchBar: UISearchBar!
    @IBOutlet var cityFilteringSegmentedControl: UISegmentedControl!
    @IBOutlet var cityListCollectionView: UICollectionView!
    
    private var currentSearchText: String = ""
    private var currentFilteringOption: CityFilteringOption = .all
    private let highlightColor: UIColor = .systemRed
    
    private let screenWidth = UIScreen.main.bounds.width
    private let sectionInset: CGFloat = 24
    private let interItemSpacing: CGFloat = 24
    
    private var cellWidth: CGFloat { (screenWidth - (sectionInset * 2) - interItemSpacing) / 2 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        setupCollectionViewLayout()
        cityListCollectionView.delegate = self
        setupDiffableDataSource()
        reloadDiffableDataSource()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "CitySearchingCollectionViewCell", bundle: .main)
        cityListCollectionView.register(
            nib,
            forCellWithReuseIdentifier: "CitySearchingCollectionViewCell"
        )
    }
    
    private func setupCollectionViewLayout() {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        /// - NOTE: `iOS 13` 미만인 경우, `iPadOS` 와 분기처리 시 `iOS 13` 이상인지 확인 필요.
        if UIDevice.current.userInterfaceIdiom == .pad {
            flowLayout.itemSize = .init(width: 160, height: 260)
        } else {
            flowLayout.itemSize = .init(width: cellWidth, height: 260)
        }
        
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = interItemSpacing
        flowLayout.minimumLineSpacing = 24
        flowLayout.sectionInset = .init(
            top: sectionInset,
            left: sectionInset,
            bottom: sectionInset,
            right: sectionInset
        )
        
        cityListCollectionView.collectionViewLayout = flowLayout
    }
    
    private func setupDiffableDataSource() {
        let cellProvider: UICollectionViewDiffableDataSource<Int, City>.CellProvider
        = { [weak self] collectionView, indexPath, itemIdentifier in
            guard let self else { return nil }
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "CitySearchingCollectionViewCell", for: indexPath
            ) as! CitySearchingCollectionViewCell
            cell.configure(with: itemIdentifier)
            cell.designCornersRounding(cornerRadius: self.cellWidth / 2)
            cell.highlighSearchedText(self.currentSearchText, color: .systemRed)
            return cell
        }
        
        dataSource = CitySearchingCollectionViewDiffableDataSource(
            collectionView: cityListCollectionView,
            cellProvider: cellProvider
        )
        
    }
    
    
    private func reloadDiffableDataSource() {
        dataSource.applySnapshot(
            searchText: currentSearchText,
            filteringOption: currentFilteringOption
        ) { [weak self] in
            /// `diffableDataSource`의 경우, 움직이지 않는 셀(?)은 `cell Provider`에서 구현한
            /// `configure` 및 `highlighSearchedText` 메서드가 호출되지 않기 때문에, 특정 글자에 색을 넣는 동작이 반영되지 않음.
            /// `apply()` 메서드가 호출되어 필터링이 끝난 직후, 화면에 보이는 모든 셀에서 명시적으로 `highlight`하도록 구현함.
            guard let self else { return }
            let visibleCells = self.cityListCollectionView.visibleCells as! [CitySearchingCollectionViewCell]
            visibleCells.forEach { cell in
                cell.highlighSearchedText(self.currentSearchText, color: self.highlightColor)
            }
        }
    }
    
    
    @IBAction func cityFilteringSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        
        
    }
    
    
}

extension CitySearchingCollectionViewController: UICollectionViewDelegate {
    
    
    
}
