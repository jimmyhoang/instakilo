//
//  ViewController.m
//  InstaKilo
//
//  Created by Jimmy Hoang on 2017-06-14.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCollectionViewCell.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray* photos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Initialize photos array with photos inside assets
    self.photos = @[
                [UIImage imageNamed:@"image1"],
                [UIImage imageNamed:@"image2"],
                [UIImage imageNamed:@"image3"],
                [UIImage imageNamed:@"image4"],
                [UIImage imageNamed:@"image5"],
                [UIImage imageNamed:@"image6"],
                [UIImage imageNamed:@"image7"],
                [UIImage imageNamed:@"image8"],
                [UIImage imageNamed:@"image9"],
                [UIImage imageNamed:@"image10"]
                ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CollectionView

-(PhotoCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    UIImage* image = self.photos[indexPath.item];
    
    cell.imageView.image = image;

    return cell;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.photos.count;
}



@end
