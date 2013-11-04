//
//  imageOject.m
//  QuocvuongAlibaba
//
//  Created by iOS17 on 11/1/13.
//  Copyright (c) 2013 iOS17. All rights reserved.
//

#import "ImageOject.h"

@implementation ImageOject
-(id)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        _imageName = [dict objectForKey:@"imageName"];
        _text = [dict objectForKey:@"text"];
        
    }
    return self;
}
@end
