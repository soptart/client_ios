//
//  Pinterest.swift
//  Artoo
//
//  Created by 보윤 on 27/12/2018.
//  Copyright © 2018 홍정민. All rights reserved.
//

import UIKit

class PinterLayout: UICollectionViewLayout {
    
    weak var delegate: PinterestLayoutDelegate!
    
    //레이아웃 구성은 2개가 있는데, 컬럼(열)개수와  셀 패딩이 있다.
    
    fileprivate var numberOfColumns = 2 //한 셀에 몇 개 들어갈까?
    fileprivate var cellPadding: CGFloat = 6 //셀 간의 간격
    
    //속성을 계산하는 변수이다.
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    //4. 컨텐츠 사이즈를 저장하는 두 가지 속성 contentHeight, contentWidth
    //contentHeight는 사진 개수를 늘려가는 것이다.
    fileprivate var contentHeight: CGFloat = 0
    
    //셀의 너비인듯
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else{
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    //5. collectionViewContentSize를 재정의한다.
    override var collectionViewContentSize: CGSize{
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare(){
        
        //1 cache가 비어있고 컬렉션 뷰가 존재했을때만 계산한다.
        guard cache.isEmpty == true, let collectionView = collectionView else {
            return
        }
        
        //2
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        //하나의 셀의 너비
        var xOffset = [CGFloat]() //
        for column in 0 ..< numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        
        //3
        for item in 0 ..< collectionView.numberOfItems(inSection: 0){
            let indexPath = IndexPath(item: item, section: 0)
            
            //4. 프레임을 계산
            let photoHeight = delegate.collectionView(collectionView, heightForPhotoAtIndexPath: indexPath)
            let height = cellPadding * 2 + photoHeight
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            //5
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            //6
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
            
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        //Loop
        for attributes in cache {
            if attributes.frame.intersects(rect){
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}

//photo의 높이를 요구하는 코드이다.
protocol PinterestLayoutDelegate: class{
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat
}

