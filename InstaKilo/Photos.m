//
//  Photos.m
//  InstaKilo
//
//  Created by Jimmy Hoang on 2017-06-14.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "Photos.h"

@implementation Photos

- (instancetype)initWithImage:(UIImage*)image andSubject:(NSString*)subject andLocation:(NSString*)location
{
    self = [super init];
    if (self) {
        _image = image;
        _subject = subject;
        _location = location;
    }
    return self;
}

@end
