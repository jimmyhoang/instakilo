//
//  Photos.h
//  InstaKilo
//
//  Created by Jimmy Hoang on 2017-06-14.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface Photos : NSObject

@property (nonatomic, strong) UIImage* image;
@property (nonatomic, strong) NSString* subject;
@property (nonatomic, strong) NSString* location;

- (instancetype)initWithImage:(UIImage*)image andSubject:(NSString*)subject andLocation:(NSString*)location;

@end
