//
//  imageOject.h
//  QuocvuongAlibaba
//
//  Created by iOS17 on 11/1/13.
//  Copyright (c) 2013 iOS17. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageOject : NSObject
@property(nonatomic,strong) NSString *imageName;
@property(nonatomic,strong) NSString *text;
-(id)initWithDict:(NSDictionary*)dict;
@end
