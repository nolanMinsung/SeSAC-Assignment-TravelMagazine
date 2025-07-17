//
//  CitySearchingDiffableDataSource.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/15/25.
//

import UIKit

class CitySearchingDiffableDataSource: UITableViewDiffableDataSource<Int, City> {
    
    let wholeCities = CityInfo().city
    
    func applySnapshot(searchText: String = "", filteringOption: CityFilteringOption? = nil, completion: (() -> Void)? = nil) {
        let snapshot = _getSnapshot(searchText: searchText, filteringOption: filteringOption)
        self.apply(snapshot, completion: completion)
    }
    
    func applySnapshotUsingReloadData(searchText: String = "", filteringOption: CityFilteringOption? = nil) {
        let snapshot = _getSnapshot(searchText: searchText, filteringOption: filteringOption)
        self.applySnapshotUsingReloadData(snapshot)
    }
    
    private func _getSnapshot(searchText: String, filteringOption: CityFilteringOption?) -> NSDiffableDataSourceSnapshot<Int, City> {
        
        var filteredCities = wholeCities
        let trimmtedSearchWord = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmtedSearchWord.isEmpty { filteredCities.filterBySearchText(trimmtedSearchWord) }
        if let filteringOption { filteredCities.filterByFilterOption(filteringOption) }
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, City>()
        snapshot.appendSections([0])
        snapshot.appendItems(
            filteredCities
        )
        return snapshot
    }
    
}


enum CityFilteringOption {
    case all
    case domesticOnly
    case foreignOnly
}


extension Array where Element == City {
    
    mutating func filterBySearchText(_ searchText: String) {
        self = self.filter {
            ($0.koreanName.lowercased().contains(searchText.lowercased())
             || $0.englishName.lowercased().contains(searchText.lowercased())
             || $0.explain.lowercased().contains(searchText.lowercased()))
        }
    }
    
    mutating func filterByFilterOption(_ option: CityFilteringOption) {
        switch option {
        case .all: return
        case .domesticOnly: self = self.filter { $0.isDomestic }
        case .foreignOnly: self = self.filter { !$0.isDomestic }
        }
    }
    
}
