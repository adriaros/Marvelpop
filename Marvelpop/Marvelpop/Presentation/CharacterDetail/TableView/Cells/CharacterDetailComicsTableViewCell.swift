//
//  CharacterDetailComicsTableViewCell.swift
//  Marvelpop
//
//  Created by Adrià Ros on 8/7/22.
//

import UIKit

class CharacterDetailComicsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: DSLabel!
    @IBOutlet weak var titleLineView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let layout = UICollectionViewFlowLayout()
    
    private var comics: [Comic] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        titleLineView.backgroundColor = .separator
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView.register(UINib(nibName: ComicCollectionViewCell.cellType, bundle: nil), forCellWithReuseIdentifier: ComicCollectionViewCell.cellType)
        collectionView.dataSource = self
        collectionView.delegate = self
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
    
    func configure(title: String, comics: [Comic]) {
        self.comics = comics
        titleLabel.style = .title(title, .left, true, 1)
    }
}

extension CharacterDetailComicsTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        comics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComicCollectionViewCell.cellType, for: indexPath) as! ComicCollectionViewCell
        cell.configure(title: comics[indexPath.row].displayName)
        return cell
    }
}

extension CharacterDetailComicsTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 180)
    }
}
