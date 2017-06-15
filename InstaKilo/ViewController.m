//
//  ViewController.m
//  InstaKilo
//
//  Created by Jimmy Hoang on 2017-06-14.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCollectionViewCell.h"
#import "SubjectCollectionHeaderView.h"
#import "Photos.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray* photos;
@property (nonatomic, strong) NSDictionary* locationPhotos;
@property (nonatomic, assign) BOOL sortedBySubject;
@property (nonatomic, strong) NSArray* dictKeys;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sortedBySubject = YES;

    // Initialize photos
    Photos* photo1 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"image1"] andSubject:@"Asian Food" andLocation:@"Vancouver"];
    Photos* photo2 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"image2"] andSubject:@"Asian Food" andLocation:@"New York"];
    Photos* photo3 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"image3"] andSubject:@"Western Food" andLocation:@"Vancouver"];
    Photos* photo4 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"image4"] andSubject:@"Western Food" andLocation:@"New York"];
    Photos* photo5 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"image5"] andSubject:@"Western Food" andLocation:@"Toronto"];
    Photos* photo6 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"image6"] andSubject:@"Asian Food" andLocation:@"London"];
    Photos* photo7 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"image7"] andSubject:@"Western Food" andLocation:@"Toronto"];
    Photos* photo8 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"image8"] andSubject:@"Western Food" andLocation:@"New York"];
    Photos* photo9 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"image9"] andSubject:@"Western Food" andLocation:@"London"];
    Photos* photo10 = [[Photos alloc] initWithImage:[UIImage imageNamed:@"image10"] andSubject:@"Asian Food" andLocation:@"Vancouver"];
    
    // Add asian food to asianFood array and western food to westernFood array
    NSArray* asianFood = [NSArray arrayWithObjects:photo1,photo2,photo6,photo10, nil];
    NSArray* westernFood = [NSArray arrayWithObjects:photo3,photo4,photo5,photo7,photo8,photo9, nil];
    
    // Add both arrays to photos array
    self.photos = [NSArray arrayWithObjects:asianFood, westernFood, nil];
    
    self.locationPhotos = @{@"Vancouver":@[photo1,photo3,photo10],
                            @"New York":@[photo2,photo4,photo8],
                            @"London":@[photo6,photo9],
                            @"Toronto":@[photo5,photo7]
                            };
    self.dictKeys = [self.locationPhotos allKeys];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Collection View
-(PhotoCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Photos* photo;
    
    PhotoCollectionViewCell* cell = (PhotoCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    
    if (self.sortedBySubject) {
        photo = [self.photos[indexPath.section] objectAtIndex:indexPath.item];
    } else {
        NSArray* sortedSections = [[self.locationPhotos allKeys] sortedArrayUsingSelector: @selector(compare:)];
        NSString* key = sortedSections[[indexPath indexAtPosition: 0]];
        NSArray* images = self.locationPhotos[key];
        photo = images[indexPath.item];
    }
    
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.imageView.image = photo.image;

    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    if (self.sortedBySubject) {
        return self.photos.count;
    } else {
        return self.locationPhotos.count;
    }

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (self.sortedBySubject) {
        return [[self.photos objectAtIndex:section] count];
    } else {
        NSArray* sortedSections = [[self.locationPhotos allKeys] sortedArrayUsingSelector: @selector(compare:)];
        NSString* key = sortedSections[section];
        NSArray* images = self.locationPhotos[key];
        return images.count;
    }
    
}

-(SubjectCollectionHeaderView*)collectionView:(UICollectionView*)collectionView viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)indexPath {
    
    Photos* photo;
    
    if (self.sortedBySubject) {
        photo = [self.photos[indexPath.section] objectAtIndex:indexPath.item];
    }
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SubjectCollectionHeaderView* header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"subjectHeader" forIndexPath:indexPath];
        
        if (self.sortedBySubject) {
            header.subjectLabel.text = photo.subject;
        } else {
            header.subjectLabel.text = self.dictKeys[indexPath.section];
        }
        return header;
    } else {
        return nil;
    }
    
}


#pragma mark - Segmented Button Action
- (IBAction)toggleSort:(UISegmentedControl *)sender {

    if (sender.selectedSegmentIndex == 0) {
        self.sortedBySubject = YES;
    } else {
        self.sortedBySubject = NO;
    }
    
    [self.collectionView reloadData];
}




@end
