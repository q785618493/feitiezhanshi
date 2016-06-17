//
//  TopView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/10.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "TopView.h"

#define HEIGHT frame.size.height
#define WIDTH frame.size.width
#define PAGETAG 1010;

@interface TopView()<UIScrollViewDelegate>

//@property (strong, nonatomic) UIScrollView *imageTopScroll;
//@property (strong, nonatomic) NSMutableArray *urlArray;
//@property (assign, nonatomic) NSInteger index;
//@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) UIScrollView *scrollTop;
@property (strong, nonatomic) NSArray *imageArray;
@property (assign, nonatomic) NSInteger index;
@property (assign, nonatomic) NSInteger arrCount;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame andImagesTop:(NSArray *)imagesTop {
    if (self = [super initWithFrame:frame]) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        self.arrCount = imagesTop.count;
        _scrollTop = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _scrollTop.delegate = self;
        [self addSubview:_scrollTop];
        
        NSMutableArray *muImages = [[NSMutableArray alloc] initWithArray:imagesTop];
        [muImages insertObject:[imagesTop firstObject] atIndex:imagesTop.count];
        [muImages insertObject:[imagesTop lastObject] atIndex:0];
        
        for (NSUInteger i = 0; i < muImages.count; i ++) {
            UIButton *imageBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            imageBtn.tag = 1000 + i;
            [imageBtn setFrame:CGRectMake(i *  WIDTH,1, WIDTH, HEIGHT - 2)];
            ReadingModelCarousel *model = muImages[i];
            [imageBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.img] forState:(UIControlStateNormal)];
            [imageBtn addTarget:self action:@selector(touchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
            [self.scrollTop addSubview:imageBtn];
        }
        
        [self.scrollTop setBounces:NO];
        [self.scrollTop setContentSize:CGSizeMake((imagesTop.count+2) * WIDTH, HEIGHT)];
        [self.scrollTop setContentOffset:CGPointMake(WIDTH, 0)];
        [self.scrollTop setPagingEnabled:YES];
        [self.scrollTop setShowsHorizontalScrollIndicator:NO];
        
        UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(WIDTH - 80, HEIGHT-  20, 80, 20)];
        page.tag = PAGETAG;
        [self addSubview:page];
        [page setBackgroundColor:[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0]];
        [page setNumberOfPages:imagesTop.count];
        
        /** 设置计时器的方法，以及调用方法*/
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(pageAceion) userInfo:nil repeats:YES];
        
        /** 开启计时器*/
        [self.timer setFireDate:[NSDate distantPast]];
        self.index = 1;
    }
    return self;
}

/** 计时器的触发方法*/
- (void)pageAceion {
    
    CGPoint offset = CGPointMake(self.scrollTop.frame.size.width * self.index, 0);
    UIPageControl *page = (UIPageControl *) [self.scrollTop.superview viewWithTag:1010];
    if (self.index == self.arrCount + 1) {
        [UIView animateWithDuration:0.5 animations:^{
            [self.scrollTop setContentOffset:offset];
            page.currentPage = 0;
        } completion:^(BOOL finished) {
            [self.scrollTop setContentOffset:CGPointMake(self.scrollTop.frame.size.width, 0)];
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            [self.scrollTop setContentOffset:offset];
            page.currentPage = self.index - 1;
        }];
    }
    
    if (self.index == self.arrCount + 1) {
        self.index = 2;
    } else {
        self.index ++;
    }
}

#pragma make-阅读的 UIScrollViewDelegate
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    //当对scrollView进行拖动的时候终止计时器的计时操作
    [self.timer setFireDate:[NSDate distantFuture]];
}

//当对scrollView的拖动停止时，重新开始对计时器的计时操作
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    /** 从新开始计时器*/
     self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(pageAceion) userInfo:nil repeats:YES];
    [self.timer setFireDate:[NSDate distantPast]];
}

/**
 *  滚动轮播器不仅支持自动滚动，还应支持手动滑动
 *  因此设置此代理方法。之所以用这个方法而不是上一方法是因为这一方法能精准判
 *  断scrollView停止滑动的那一刻，而上一方法会造成一瞬间的卡屏
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //获取结束滑动时的偏移量
    CGPoint offset = scrollView.contentOffset;
    
    //获取pagecontroller控件
    UIPageControl *page = (UIPageControl *)[self viewWithTag:1010];
    
    //当滑动到最后一张图（数组的第一张图的替代）时
    if (offset.x == self.frame.size.width * (self.arrCount + 1)) {
        //将图片滑动到数组的第一张图上
        [scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
        page.currentPage = 0;
        //当滑动到第一张图（数组的最后一张图的替代）时
        
    } else if (offset.x == 0) {
        //将图片滑动到数组的最后一张图上
        [scrollView setContentOffset:CGPointMake(self.frame.size.width * self.arrCount, 0)];
        page.currentPage = self.arrCount - 1;
        
    } else {
        page.currentPage = (offset.x - self.frame.size.width) / self.frame.size.width;
    }
    //通过pagecontroller当前显示的页数获得当前页数的索引
    self.index = page.currentPage + 1;
    
}

//- (NSMutableArray *)urlArray {
//    if (!_urlArray) {
//        _urlArray = [[NSMutableArray alloc] init];
//    }
//    return _urlArray;
//}
//
//- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray {
//    if (self = [super initWithFrame:frame]) {
//        
//        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
//        [self addSubview:backView];
//        
//        _imageTopScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
//        [_imageTopScroll setBackgroundColor:RGB(250, 250, 250)];
//        _imageTopScroll.delegate = self;
//        [backView addSubview:_imageTopScroll];
//        
//        NSMutableArray *arrayImages = [NSMutableArray arrayWithArray:imageArray];
//        [arrayImages insertObject:imageArray[0] atIndex:arrayImages.count];
//        [arrayImages insertObject:imageArray[imageArray.count - 1] atIndex:0];
//        
//        for (NSInteger i =0 ; i < arrayImages.count; i ++) {
//            
//            ReadingModelCarousel *modelImage = arrayImages[i];
//            [self.urlArray addObject:modelImage.url];
//            
//            UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//            [btn setTag:1000 + i];
//            [btn setFrame:CGRectMake(VIEW_WIDTH * i, 0, WIDTH, HEIGHT)];
//            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:modelImage.img] forState:(UIControlStateNormal)];
//            [btn addTarget:self action:@selector(touchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
//            [_imageTopScroll addSubview:btn];
//        }
//        
//        [_imageTopScroll setBounces:NO];
//        [_imageTopScroll setPagingEnabled:YES];
//        [_imageTopScroll setContentOffset:CGPointZero];
//        [_imageTopScroll setContentSize:CGSizeMake(WIDTH * imageArray.count, HEIGHT)];
//        [_imageTopScroll setShowsVerticalScrollIndicator:NO];
//        [_imageTopScroll setShowsHorizontalScrollIndicator:NO];
//        
//        /** 创建 UIPage (圆点)*/
//        UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(WIDTH - 50, HEIGHT - 20, 50, 20)];
//        page.tag = PAGETAG;
//        /** 设置圆点个数*/
//        [page setNumberOfPages:imageArray.count];
//        /** 设置背景色和透明度*/
//        [page setBackgroundColor:RGBAlpha(100, 100, 100, 0)];
//        /** 设置圆点的选中颜色*/
//        [page setCurrentPageIndicatorTintColor:[UIColor whiteColor]];
//        /** 设置当前圆点亮起的位置*/
//        [page setCurrentPage:0];
//        [backView addSubview:page];
//        
//        /** 创建计时器 timer */
//        self.timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(addTimerNextImage) userInfo:nil repeats:YES];
//        [self.timer setFireDate:[NSDate distantPast]];
//        self.index = 1;
//        
//    }
//    return self;
//}
//
///** Timer 的触发方法*/
//- (void)addTimerNextImage {
//    
//    CGPoint offset = CGPointMake(VIEW_WIDTH * self.index, 0);
//    
//    if (3 <= self.index ) {
//        /** 添加动画效果*/
//        [UIView animateWithDuration:2 animations:^{
//            /** 设置轮播视图的位置*/
//            [self.imageTopScroll setContentOffset:offset];
//            /**记录 轮播视图的坐标位置*/
//            CGPoint offset1 = self.imageTopScroll.contentOffset;
//            /** 创建圆点 page*/
//            UIPageControl *page1 = (UIPageControl *)[self.imageTopScroll.superview viewWithTag:1010];
//            /** 改变圆点的亮起位置*/
//            [page1 setCurrentPage:(NSInteger)offset1.x / VIEW_WIDTH - 1];
//        }];
//    }
//    
//    if (4 == self.index) {
//        /** 轮播视图运行到最后一张的时候的动画*/
//        [UIView animateWithDuration:2 animations:^{
//            /** 让轮播视图的坐标回到设定的位置*/
//            [self.imageTopScroll setContentOffset:offset];
//            /** 创建圆点 page*/
//            UIPageControl *page2 = (UIPageControl *)[self.imageTopScroll.superview viewWithTag:1010];
//            /** 让圆点的亮位置归 0*/
//            [page2 setCurrentPage:0];
//            
//        } completion:^(BOOL finished) {
//            [self.imageTopScroll setContentOffset:CGPointMake(VIEW_WIDTH, 0)];
//        }];
//        self.index = 1;
//    }
//    self.index ++;
//    
//}
//
/** 按钮的点击事件触发方法*/
- (void)touchActionBtn:(UIButton *)btn {
    if (_btnTopTag) {
        _btnTopTag(btn.tag - 1000);
    }
}
//
//#pragma make- 废铁战友顶部轮播视图的 UIScrollViewDelegate
///** 精准判断偏移量*/
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    /** 记录当前轮播视图的位置*/
//    CGPoint offset3 = scrollView.contentOffset;
//    
//    /** 创建圆点 page*/
//    UIPageControl *page5 = (UIPageControl *)[scrollView.superview viewWithTag:1010];
//    
//    /** 判断轮播视图的 X 轴位置 执行相应的方法*/
//    if (offset3.x == VIEW_WIDTH * 4) {
//        [scrollView setContentOffset:CGPointMake(VIEW_WIDTH, 0)];
//        [page5 setCurrentPage:0];
//        
//    } else if (offset3.x == 0) {
//        [scrollView setContentOffset:CGPointMake(VIEW_WIDTH * 3, 0)];
//        [page5 setCurrentPage:2];
//    } else {
//        [page5 setCurrentPage:(NSInteger)(offset3.x - VIEW_WIDTH) / VIEW_WIDTH];
//    }
//    self.index = page5.currentPage + 1;
//}
//
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    [self.timer setFireDate:[NSDate distantFuture]];
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    [self.timer setFireDate:[NSDate distantPast]];
//}

@end

