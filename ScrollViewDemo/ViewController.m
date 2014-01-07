//
//  ViewController.m
//  ScrollViewDemo
//
//  Created by Andrew on 13-3-25.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)IBOutlet UIImageView *imageView;

@end

@implementation ViewController
@synthesize scrollView=_scrollView;
@synthesize imageView=_imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIImage *imageToLoad = [UIImage imageNamed:@"MacBookAir.png"];
    self.imageView=[[UIImageView alloc]initWithImage:imageToLoad];
    self.scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize=self.imageView.bounds.size;
    self.scrollView.delegate=self;
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    [self.view addSubview:self.scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    /* Gets called when user scrolls or drags */
    self.scrollView.alpha = 0.50f;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    /* Gets called only after scrolling */
    self.scrollView.alpha = 1.0f;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate{
    /* Make sure the alpha is reset even if the user is dragging */
    self.scrollView.alpha = 1.0f;
}

@end
