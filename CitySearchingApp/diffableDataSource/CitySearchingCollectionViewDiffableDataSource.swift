//
//  CitySearchingCollectionViewDiffableDataSource.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/17/25.
//

import UIKit

final class CitySearchingCollectionViewDiffableDataSource: UICollectionViewDiffableDataSource<Int, City> {
    
    let wholeCities = CityInfo().city
    
    func applySnapshot(searchText: String = "", filteringOption: CityFilteringOption? = nil, completion: (() -> Void)? = nil) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, City>()
        snapshot.appendSections([0])
        
        var filteredCities = wholeCities
        
        let trimmtedSearchWord = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmtedSearchWord.isEmpty { filteredCities.filterBySearchText(trimmtedSearchWord) }
        if let filteringOption { filteredCities.filterByFilterOption(filteringOption) }
        snapshot.appendItems(
            filteredCities
        )
        self.apply(snapshot, completion: completion)
    }
    
}
