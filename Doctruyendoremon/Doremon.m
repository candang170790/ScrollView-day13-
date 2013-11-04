//
//  Doremon.m
//  Doctruyendoremon
//
//  Created by iOS17 on 11/1/13.
//  Copyright (c) 2013 iOS17. All rights reserved.
//

#import "Doremon.h"
#import "ImageOject.h"

@interface Doremon ()<UIScrollViewDelegate>
{
   NSMutableArray *data;
}

@property(nonatomic,strong) UIScrollView *myScollView;
@property(nonatomic,strong) UIImageView *myImageView;

@end

@implementation Doremon

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(NSString*)getPathFilePlistWithName:(NSString*)_imageName
{
    return [[NSBundle mainBundle] pathForResource:_imageName ofType:@"plist"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];

    NSString *filePath = [self getPathFilePlistWithName:@"photoList"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    
    data = [NSMutableArray array];
    for (NSDictionary *dictObj in array) {
        ImageOject *image = [[ImageOject alloc] initWithDict:dictObj];
        [data addObject:image];
        
        
    }


}
-(void)viewWillLayoutSubviews{
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeRight || self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
                NSLog(@"man hinh ngang");
        [_myScollView removeFromSuperview];
        self.myScollView.delegate = self;
        
        
        
        self.myScollView = [[UIScrollView alloc] initWithFrame:CGRectMake(85, 20, 400, self.view.bounds.size.height-20)];
        float swidth = 400;
        float sheight = self.myScollView.bounds.size.height;
        self.myScollView.contentSize = CGSizeMake((swidth*[data count])/2, sheight);
        int count = 0;
        for (ImageOject *photoName in data) {
            _myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(count *(swidth/2), 0, swidth/2, sheight) ];
            _myImageView.image = [UIImage imageNamed:photoName.imageName];
            //_myImageView.contentMode = UIViewContentModeScaleAspectFill;
            [self.myScollView addSubview:self.myImageView];
            count ++;
        }
        //NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_myScollView);
        self.myScollView.pagingEnabled = YES;
        [self.view addSubview:self.myScollView];
        
        self.myScollView.translatesAutoresizingMaskIntoConstraints  = NO;
      
        
       
       //NSArray *array1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_myScrollView]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewsDictionary];
        //[self.view addConstraints:array1];
        
       // NSArray *array2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[-myScrollView]|" options:0 metrics:0 views:viewsDictionary];
        //[self.view addConstraints:array2];
    }
    else
    {
        [_myScollView removeFromSuperview];
        NSLog(@"man hinh doc");
        self.myScollView.delegate = self;
        
        self.myScollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20)];
        float swidth = self.myScollView.bounds.size.width;
        float sheight = self.myScollView.bounds.size.height;
        self.myScollView.contentSize = CGSizeMake(swidth*[data count], sheight);
        int count = 0;
        for (ImageOject *photoName in data) {
            _myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(count *(swidth), 0, swidth, sheight) ];
            _myImageView.image = [UIImage imageNamed:photoName.imageName];
           //_myImageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.myScollView addSubview:self.myImageView];
            count ++;
        }
        self.myScollView.pagingEnabled = YES;
        [self.view addSubview:self.myScollView];
    }
}




@end
