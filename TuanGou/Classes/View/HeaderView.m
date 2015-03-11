//
//  HeaderView.m
//  团购
//
//  Created by medicool on 15/2/26.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "HeaderView.h"

NSInteger const ScrollView_WIDTH = 375;
NSInteger const ScrollView_HEIGHT = 165;
NSInteger const ImageView_COUNT = 5;


@interface HeaderView ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HeaderView

+ (instancetype)headerView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:nil options:nil]lastObject];
}

/**
 *  当一个对象从xib中创建，初始化完毕的时候就会调用一次
 */
- (void)awakeFromNib
{
    self.scrollView.contentSize = CGSizeMake(ScrollView_WIDTH * ImageView_COUNT, ScrollView_HEIGHT);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    [self createImageViewNumber:ImageView_COUNT];
    [self addTimer];

}

- (void)createImageViewNumber:(NSInteger)viewNum
{
    for (NSInteger i = 0; i <= viewNum; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScrollView_WIDTH * i, 0, ScrollView_WIDTH, ScrollView_HEIGHT)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ad_0%li",(long)i]];;
        [self.scrollView addSubview:imageView];
    }
}

- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)nextImage
{
    NSInteger page = self.pageControl.currentPage;
    
    if (page == ImageView_COUNT -1) {
        page = 0;
    }
    else
    {
        page++;
    }
    //滚动scrollView
    CGFloat x = page * ScrollView_WIDTH;
    self.scrollView.contentOffset = CGPointMake(x, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //页码 = (contentoffset.x + scrollView一半宽度)/scrollView宽度
    CGFloat x = self.scrollView.contentOffset.x;
    NSInteger page = (x + ScrollView_WIDTH * 0.5) / ScrollView_WIDTH;
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)removeTimer
{
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}
@end
