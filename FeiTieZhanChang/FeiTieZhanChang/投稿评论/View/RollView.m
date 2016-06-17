//
//  RollView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "RollView.h"

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height

@interface RollView ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *rollScroll;
@property (assign, nonatomic) NSInteger index;
@property (assign, nonatomic) NSInteger countA;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UIPageControl *page;

@end

@implementation RollView

- (instancetype)initWithFrame:(CGRect)frame photoArray:(NSArray *)photoArray {
    if (self= [super initWithFrame:frame]) {
        
        _countA = photoArray.count;
        _rollScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        [_rollScroll setDelegate:self];
        [self addSubview:_rollScroll];
        
        NSMutableArray *twoMuArray = [NSMutableArray arrayWithArray:photoArray];
        [twoMuArray insertObject:[photoArray firstObject] atIndex:photoArray.count];
        [twoMuArray insertObject:[photoArray lastObject] atIndex:0];
        
        for (NSInteger i = 0; i < twoMuArray.count; i ++) {
            UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            [btn setFrame:CGRectMake(i * WIDTH, 0, WIDTH, HEIGHT)];
            [btn setImage:[UIImage imageNamed:twoMuArray[i]] forState:(UIControlStateNormal)];
            [_rollScroll addSubview:btn];
        }
        
        [_rollScroll setBounces:NO];
        [_rollScroll setContentOffset:CGPointMake(WIDTH, 0)];
        [_rollScroll setContentSize:CGSizeMake(twoMuArray.count * WIDTH, HEIGHT)];
        [_rollScroll setPagingEnabled:YES];
        [_rollScroll setShowsHorizontalScrollIndicator:NO];
        [_rollScroll setShowsVerticalScrollIndicator:NO];
        
        _page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, HEIGHT - 25, WIDTH, 25)];
        [_page setNumberOfPages:photoArray.count];
        [_page setPageIndicatorTintColor:[UIColor yellowColor]];
        [_page setCurrentPageIndicatorTintColor:[UIColor redColor]];
        [self addSubview:_page];
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAddAction) userInfo:nil repeats:YES];
        [_timer setFireDate:[NSDate distantPast]];
        
        NSRunLoop *run = [NSRunLoop currentRunLoop];
        [run addTimer:_timer forMode:NSRunLoopCommonModes];
        
        self.index = 1;
        
    }
    return self;
}

- (void)timerAddAction {
    
    CGPoint offset = CGPointMake(WIDTH * self.index, 0);
    
    if (self.index == self.countA + 1) {
        [UIView animateWithDuration:0.4 animations:^{
            [_rollScroll setContentOffset:offset];
            _page.currentPage = 0;
        } completion:^(BOOL finished) {
            [_rollScroll setContentOffset:CGPointMake(WIDTH, 0) ];
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            [_rollScroll setContentOffset:offset];
            _page.currentPage = self.index - 1;
        }];
    }
    
    if (self.index == self.countA + 1) {
        self.index = 2;
    } else {
        self.index ++;
    }
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    [_timer setFireDate:[NSDate distantFuture]];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAddAction) userInfo:nil repeats:YES];
    [_timer setFireDate:[NSDate distantPast]];
    
    NSRunLoop *run = [NSRunLoop currentRunLoop];
    [run addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGPoint offset = scrollView.contentOffset;
    
    if (offset.x == WIDTH * (self.countA + 1)) {
        [scrollView setContentOffset:CGPointMake(WIDTH, 0)];
        _page.currentPage = 0;
    } else if (offset.x == 0) {
        [scrollView setContentOffset:CGPointMake(self.countA * WIDTH, 0)];
        _page.currentPage = self.countA - 1;
    } else {
        _page.currentPage = (offset.x - WIDTH) / WIDTH;
    }
    
    self.index = _page.currentPage + 1;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
