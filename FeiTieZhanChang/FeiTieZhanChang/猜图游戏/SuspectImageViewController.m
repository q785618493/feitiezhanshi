//
//  SuspectImageViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/24.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "SuspectImageViewController.h"
#import "DataImageModel.h"

@interface SuspectImageViewController ()<UIAlertViewDelegate>

@property (strong, nonatomic) UIImageView *showImage;
@property (strong, nonatomic) UILabel *numberLabel;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *coinBtn;
@property (strong, nonatomic) UIButton *displayBtn;
@property (strong, nonatomic) UIButton *promptBtn;
@property (strong, nonatomic) UIButton *helpBtn;
@property (strong, nonatomic) UIButton *bigBtn;
@property (strong, nonatomic) UIButton *nextBtn;
@property (strong, nonatomic) UIButton *btnCover;

@property (strong, nonatomic) NSArray *arrayData;
@property (assign, nonatomic) NSInteger index;

@property (strong, nonatomic) UIView *answerView;
@property (strong, nonatomic) UIView *chooseView;

@end

@implementation SuspectImageViewController

/** 懒加载本地数据*/
- (NSArray *)arrayData {
    if (!_arrayData) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *muArray = [NSMutableArray array];
        for (NSDictionary *dicModel in array) {
            DataImageModel *model = [[DataImageModel alloc] initWithDataImageModelDic:dicModel];
            [muArray addObject:model];
        }
        _arrayData = muArray;
    }
    return _arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self navSideView];
    [self.navLabel setText:@"超级猜图"];
    
    if (0 == self.index) {
        self.index = -1;
    }
    
    [self addImageView];
    [self questionNext];
    
}

/** 动态创建控件 */
- (void)addImageView {
    
    self.showImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64)];
    [self.showImage setImage:[UIImage imageNamed:@"bj"]];
    [self.showImage setAlpha:0.9];
    
    /** 开启 UIImageView 响应事件(避免 Btn 的响应事件不能传到控制器上 NO关闭 YES开启)*/
    [self.showImage setUserInteractionEnabled:YES];
    [self.view addSubview:self.showImage];
    
    self.coinBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.coinBtn setFrame:CGRectMake(VIEW_WIDTH - 86, 1, 80, 20)];
    /** 关闭或者开启 控件和用户的交互状态 (YES 可以交互有单击事件 ；NO 关闭交互不能用 )*/
    [self.coinBtn setUserInteractionEnabled:NO];
    
    /** 设置有图片和文字的 按钮 水平居左对齐的方法 */
    [self.coinBtn setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentLeft)];
    [self.coinBtn setImage:[UIImage imageNamed:@"coin"] forState:(UIControlStateNormal)];
    [self.coinBtn setTitle:@"10000" forState:(UIControlStateNormal)];
    [self.coinBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.coinBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [self.showImage addSubview:self.coinBtn];
    
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, VIEW_WIDTH, 20)];
    [self.numberLabel setTextColor:[UIColor whiteColor]];
    [self.numberLabel setTextAlignment:(NSTextAlignmentCenter)];
    [self.showImage addSubview:self.numberLabel];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, VIEW_WIDTH, 20)];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    [self.titleLabel setTextAlignment:(NSTextAlignmentCenter)];
    [self.showImage addSubview:self.titleLabel];
    
    /** 透明的作弊按钮*/
    UIButton *cheatBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [cheatBtn setFrame:CGRectMake(0, 40, 40, 40)];
    [cheatBtn addTarget:self action:@selector(cheatTouchAdd) forControlEvents:(UIControlEventTouchUpInside)];
    [self.showImage addSubview:cheatBtn];
    
    self.displayBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.displayBtn setFrame:CGRectMake((VIEW_WIDTH - 200) / 2.0, 90, 200, 200)];
    [self.displayBtn setTag:1];
    /** 设置按钮图片的方法*/
    //    [self.displayBtn setImage:[UIImage imageNamed:@"movie_zghhr"] forState:(UIControlStateNormal)];
    /** 设置按钮图片距离四边的距离，以做成一个图片框的效果的方法*/
    [self.displayBtn setImageEdgeInsets:(UIEdgeInsetsMake(5, 5, 5, 5))];
    
    /** 设置按钮的整个背景图片的方法*/
    [self.displayBtn setBackgroundImage:[UIImage imageNamed:@"center_img"] forState:(UIControlStateNormal)];
    [self.displayBtn addTarget:self action:@selector(touchBigBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.showImage addSubview:self.displayBtn];
    
    self.promptBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.promptBtn setFrame:CGRectMake(0, 130, (VIEW_WIDTH - 200) / 2.0 -3, 30)];
    [self.promptBtn setTag:2];
    [self.promptBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self.promptBtn setBackgroundImage:[UIImage imageNamed:@"btn_left"] forState:(UIControlStateNormal)];
    [self.promptBtn setBackgroundImage:[UIImage imageNamed:@"btn_left_highlighted"] forState:(UIControlStateHighlighted)];
    [self.promptBtn addTarget:self action:@selector(promptTouchBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.promptBtn setTitle:@"💡提示" forState:(UIControlStateNormal)];
    [self.showImage addSubview:self.promptBtn];
    
    self.helpBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.helpBtn setTag:3];
    [self.helpBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self.helpBtn setFrame:CGRectMake(0, 210, (VIEW_WIDTH - 200) / 2.0 - 3, 30)];
    [self.helpBtn setTitle:@"👌帮助" forState:(UIControlStateNormal)];
    [self.helpBtn setBackgroundImage:[UIImage imageNamed:@"btn_left"] forState:(UIControlStateNormal)];
    [self.helpBtn setBackgroundImage:[UIImage imageNamed:@"btn_left_highlighted"] forState:(UIControlStateHighlighted)];
    [self.showImage addSubview:self.helpBtn];
    
    self.bigBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.bigBtn setFrame:CGRectMake(VIEW_WIDTH - (VIEW_WIDTH - 200) / 2.0 + 3, 130, (VIEW_WIDTH - 200) / 2.0 - 3, 30)];
    [self.bigBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self.bigBtn setTitle:@"🔍大图" forState:(UIControlStateNormal)];
    [self.bigBtn setBackgroundImage:[UIImage imageNamed:@"btn_right"] forState:(UIControlStateNormal)];
    [self.bigBtn setBackgroundImage:[UIImage imageNamed:@"btn_right_highlighted"] forState:(UIControlStateHighlighted)];
    [self.bigBtn addTarget:self action:@selector(touchBigBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.showImage addSubview:self.bigBtn];
    
    self.nextBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.nextBtn setTag:4];
    [self.nextBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self.nextBtn setFrame:CGRectMake(VIEW_WIDTH - (VIEW_WIDTH - 200) / 2.0 + 3, 210, (VIEW_WIDTH - 200) / 2.0 - 3, 30)];
    [self.nextBtn setBackgroundImage:[UIImage imageNamed:@"btn_right"] forState:(UIControlStateNormal)];
    [self.nextBtn setBackgroundImage:[UIImage imageNamed:@"btn_right_highlighted"] forState:(UIControlStateHighlighted)];
    [self.nextBtn addTarget:self action:@selector(nextTouchBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.nextBtn setTitle:@"下一题" forState:(UIControlStateNormal)];
    [self.showImage addSubview:self.nextBtn];
    
    self.answerView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, VIEW_WIDTH, BTNWIDTH)];
    [self.showImage addSubview:self.answerView];
    
    self.chooseView = [[UIView alloc] initWithFrame:CGRectMake(0, 335, VIEW_WIDTH, VIEW_HEIGHT - 335 - 64)];
    [self.showImage addSubview:self.chooseView];
    
}

/** 提示按钮的单击事件*/
- (void)promptTouchBtn {
    
    /** 1.让分数减 1000*/
    [self addScourePoint:-1000];
    
    /** 2.把所有的 答案按钮 的文字清空(其实这里的“清空”，最好是调用每个“答案按钮”的单击事件)，后显示出第一个正确答案的文字*/
    for (UIButton *anserBtn in self.answerView.subviews) {
        
        /** 不判断，让每一个 答案按钮 都点击一下*/
        [self answerTouchBtnAnswer:anserBtn];
    }
    
    /** 3.根据当前索引，从数组(self.arrayData)中找到对应的数据模型*/
    ///从数据模型中获取正确答案的第一个字符，把选择按钮中和这个字符相等的那个按钮点击一下
    DataImageModel *model = self.arrayData[self.index];
    
    /** 截取字符串的方法 (这个是从第 0 个 元素截取到底几个元素之前的)*/
    NSString *firstChar = [model.answer substringToIndex:1];
    
    /** 截取字符串的方法:1. 从给定索引开始截取，一直截取到最后!
     [model.answer substringFromIndex:2];
     2.[model.answer substringToIndex:1]
     这个是从第 0 个 元素截取到底几个元素之前的;
     3.model.answer substringWithRange:<#(NSRange)#>
     是指定范围截取相应的字符串
     */
    
    /** 根据 firstChar 字符串，在 选择按钮 中找到对应文字的 选择按钮，让这个按钮点击一下 */
    for (UIButton *chooseBtn in self.chooseView.subviews) {
        if ([firstChar isEqualToString:chooseBtn.currentTitle]) {
            [self chooseTouchBtnChoose:chooseBtn];
            break;
        }
    }
    
    /**  完成提示操作，关闭提示按钮与用户的交互(每一题只提示一次)*/
    [self.promptBtn setUserInteractionEnabled:NO];
}


/** 作弊按钮的方法*/
- (void)cheatTouchAdd {
    [self addScourePoint:1000];
}

/** 放大图片的按钮点击事件*/
- (void)touchBigBtn {
    
    /** 判断图片是否放大，如果已经放大了，调用阴影按钮的点击事件并返回*/
    if (VIEW_WIDTH == self.displayBtn.frame.size.width) {
        [self smallImageBtn:self.btnCover];
        return;
    }
    
    /* 1.创建大小与 self.view 一样的按钮，把这个按钮作为一个阴影 */
    self.btnCover = [[UIButton alloc] init];
    [self.btnCover setFrame:self.view.bounds];
    [self.btnCover setBackgroundColor:[UIColor blackColor]];
    [self.btnCover setAlpha:0];
    [self.showImage addSubview:self.btnCover];
    
    [self.btnCover addTarget:self action:@selector(smallImageBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    
    /** 2.把图片设置到阴影上面(self.view 里的方法,因为所以子控件都是在 self.view 里的，只把 self.displayBtn 控件显示到最上层)*/
    [self.showImage bringSubviewToFront:self.displayBtn];
    
    /** 3.通过动画的方法把图片放大*/
    [UIView animateWithDuration:1 animations:^{
        [self.btnCover setAlpha:0.5];
        [self.displayBtn setFrame:CGRectMake(0, (VIEW_HEIGHT - VIEW_WIDTH - 64) / 2.0 , VIEW_WIDTH, VIEW_WIDTH)];
    }];
    
}

/** 阴影按钮的单击事件,变小图片*/
- (void)smallImageBtn:(UIButton *)btnCover {
    /** 动画还原图片的大小*/
    [UIView animateWithDuration:1 animations:^{
        [self.displayBtn setFrame:CGRectMake((VIEW_WIDTH - 200) / 2.0, 90, 200, 200)];
        [btnCover setAlpha:0];
    } completion:^(BOOL finished) {
        if (finished) {
            [btnCover removeFromSuperview];
        }
    }];
}

/** nextBtn 的点击事件*/
- (void)nextTouchBtn {
    
    [self questionNext];
}

/** 封装下一题的方法*/
- (void)questionNext {
    
    /** 开启提示按钮的交互*/
    [self.promptBtn setUserInteractionEnabled:YES];
    
    /** 让索引自加 */
    self.index ++;
    
    /** 设置到达最后一题禁用下一题按钮*/
    self.nextBtn.enabled = self.index != self.arrayData.count - 1;
    
    /** 判断当前索引是否越界，如果索引越界，则提示用户*/
    if (self.arrayData.count == self.index) {
        
        /** 弹出一个对话框，提示用户*/
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"操作提示" message:@"恭喜过关" delegate:self cancelButtonTitle:@"⭐️确定⭐️" otherButtonTitles:nil];
        
        /** 显示提示框*/
        [alert show];
        return;
    }
    
    /** 根据索引获取当前的模型数据*/
    DataImageModel *modelNext = self.arrayData[self.index];
    
    /** 给相应的控件赋值 */
    [self dataArrayModelNext:modelNext];
    
    
    /** 动态创建答案按钮，根据当前答案的文字个数不同来创建不同数目的答案*/
    [self setUpAnswerBtnModelNext:modelNext];
    
    
    /** 动态创建选择按钮*/
    [self makeOptionsModelNext:modelNext];
    
}

/** UIAlertView 的代理方法*/
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    /** 根据提示框按钮的索引，判断提示框上的哪个按钮被点击了*/
    if (0 == buttonIndex) {
        self.index = -1;
        [self questionNext];
    }
}

/** 给控件赋值的方法*/
- (void)dataArrayModelNext:(DataImageModel *)modelNext {
    
    [self.numberLabel setText:[NSString stringWithFormat:@"%ld/%ld",self.index + 1,self.arrayData.count]];
    
    [self.titleLabel setText:modelNext.title];
    
    [self.displayBtn setImage:[UIImage imageNamed:modelNext.icon] forState:(UIControlStateNormal)];
}

/** 动态创建答案按钮的方法*/
- (void)setUpAnswerBtnModelNext:(DataImageModel *)modelNext {
    
    /** 判断按钮加载到数据是最后的数据吗，然后让下一题按钮禁用*/
    //    if (self.index == self.arrayData.count - 1) {
    //        [self.nextBtn setEnabled:NO];
    //    }
    
    
    /** 清处所有的答案按钮,以免重叠创建按钮*/
    //    while (self.answerView.subviews.firstObject) {
    //        [self.answerView.subviews.firstObject removeFromSuperview];
    //    }
    
    /** 这句话的意思是:让 subviews 这个数组中的每个对象，分别调用一次 removeFromSuperview方法；
     内部执行了循环，无需我们自己来循环*/
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    /** 获取文字个数*/
    NSUInteger len = modelNext.answer.length;
    CGFloat margin = 10;
    CGFloat leftMargin = (VIEW_WIDTH - len * BTNWIDTH - (len - 1) * 10) / 2.0;
    
    
    /** 循环创建答案按钮*/
    for (NSInteger i = 0; i < len; i ++) {
        UIButton *btnAnswer = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btnAnswer setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [btnAnswer setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:(UIControlStateNormal)];
        [btnAnswer setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:(UIControlStateHighlighted)];
        [btnAnswer setFrame:CGRectMake(i * (BTNWIDTH + margin)+ leftMargin, 0, BTNWIDTH, BTNWIDTH)];
        [btnAnswer addTarget:self action:@selector(answerTouchBtnAnswer:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.answerView addSubview:btnAnswer];
    }
}

/** 答案按钮的单击事件方法*/
- (void)answerTouchBtnAnswer:(UIButton *)btnAnswer {
    
    /** 1.启用选择按钮的视图与用户的交互*/
    [self.chooseView setUserInteractionEnabled:YES];
    
    /** 设置所有的 答案按钮 的文字颜色为黑色*/
    [self btnTitleForBtnColor:[UIColor blackColor]];
    
    /** 2.在“选择按钮” 中找到与之前被点击的答案按钮文字相同的选择按钮，设置该按钮显示出来*/
    /** 还是先遍历 选择按钮 */
    for (UIButton *chooseBtn in self.chooseView.subviews) {
        
        /** 比较判断 选择按钮 的文字是否与当前被点击的 答案按钮 的文字一致(有相同文字的会有 bug，最好根据 选择按钮 的 tag 值来判断)*/
        //        if ([btnAnswer.currentTitle isEqualToString:chooseBtn.currentTitle]) {
        //            [chooseBtn setHidden:NO];
        //            break;
        //        }
        
        /** 判断 按钮 的 tag 值*/
        if (btnAnswer.tag == chooseBtn.tag) {
            [chooseBtn setHidden:NO];
            break;
        }
    }
    
    /** 3.清空被点击 答案按钮的文字*/
    [btnAnswer setTitle:nil forState:(UIControlStateNormal)];
    
}


/** 动态创建选择按钮的方法*/
- (void)makeOptionsModelNext:(DataImageModel *)modelNext {
    
    /** 每次创建 选择按钮 的时候，先让选择视图可以和 用户交互*/
    [self.chooseView setUserInteractionEnabled:YES];
    
    /** 这句话的意思是:让 subviews 这个数组中的每个对象，分别调用一次 removeFromSuperview方法；
     内部执行了循环，无需我们自己来循环*/
    [self.chooseView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat btnChooseW = 10;
    CGFloat spacingW = (VIEW_WIDTH - BTNWIDTH * 7) / 8.0;
    NSInteger count2 = modelNext.options.count;
    /** 循环创建选测按钮*/
    for (NSInteger p = 0; p < count2 ; p ++) {
        UIButton *choooseBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [choooseBtn setTag:20 + p];
        [choooseBtn setFrame:CGRectMake(p % 7 * (BTNWIDTH + spacingW) + spacingW, p / 7 * (BTNWIDTH + btnChooseW) + btnChooseW, BTNWIDTH, BTNWIDTH)];
        [choooseBtn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:(UIControlStateNormal)];
        [choooseBtn setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:(UIControlStateHighlighted)];
        [choooseBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [choooseBtn setTitle:[NSString stringWithFormat:@"%@",modelNext.options[p]] forState:(UIControlStateNormal)];
        [choooseBtn addTarget:self action:@selector(chooseTouchBtnChoose:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.chooseView addSubview:choooseBtn];
    }
}

/** 选择按钮的单击事件方法*/
- (void)chooseTouchBtnChoose:(UIButton *)btnChoose {
    
    /** 1.隐藏当前被点击的按钮*/
    [btnChoose setHidden:YES];
    
    /** 2.把当前被点击按钮的文字显示到 第一个为空的“答案按钮”上*/
    /** 2.1获取当前被点击按钮的文字 指定状态下(2种方法都可以)*/
    //    NSString *text = [btn titleForState:(UIControlStateNormal)];
    /** 获取按钮当前状态下的文字*/
    NSString *text = btnChoose.currentTitle;
    
    /** 2.2把文字显示到答案按钮上*/
    /** 先遍历每一个答案按钮*/
    for (UIButton *answerBtn in self.answerView.subviews) {
        
        /** 判断每个 答案按钮 上的文字是否为 nil*/
        if (nil == answerBtn.currentTitle) {
            
            /** 把当前点击的 选择按钮 的文字设置给对应的 答案按钮*/
            [answerBtn setTitle:text forState:(UIControlStateNormal)];
            
            /** 把当前点击的 选择按钮 的 tag 值也设置给 答案按钮*/
            answerBtn.tag = btnChoose.tag;
            break;
        }
    }
    
    /** 3.判断 答案按钮 文字是否已满*/
    /** 一开始假设答案按钮是填满的*/
    BOOL isFull = YES;
    
    /** 声明一个用来保存用户输入的答案字符串*/
    NSMutableString *userInput = [NSMutableString string];
    
    
    for (UIButton *btnAnswer in self.answerView.subviews) {
        if (nil == btnAnswer.currentTitle) {
            isFull = NO;
            break;
        } else {
            /** 如果当前 答案按钮 上面有文字，那么就把这个文字拼接起来*/
            [userInput appendString:btnAnswer.currentTitle];
        }
    }
    
    /** 4.如果答案按钮已经填满文字，就禁止其所在视图与用户的交互*/
    if (isFull) {
        
        /** 禁止待选按钮被点击2种方法：1循环按钮一个一个禁止(太费事了)
         2.直接禁用按钮所在视图的交互(下面用的就是禁用视图的交互)*/
        [self.chooseView setUserInteractionEnabled:NO];
        
        /** 获取当前题目的 正确答案 (先拿到模型数据)*/
        DataImageModel *model = self.arrayData[self.index];
        
        /** 5.如果 答案按钮 被填满了，就判断用户点击输入的答案是否与标准答案一致*/
        if ([userInput isEqualToString:model.answer]) {
            
            /** 如果答题正确，加 100 分*/
            [self addScourePoint:100];
            
            /** */
            
            /** 如果答案正确，让答案按钮 的文字显示为蓝色*/
            [self btnTitleForBtnColor:RGB(59, 82, 156)];
            
            /** 延时在0.5秒后显示下一题*/
            [self performSelector:@selector(questionNext) withObject:nil afterDelay:0.5];
            
        } else {
            
            /** 如果输入的答案错误，设置 答案按钮 文字颜色为红色*/
            [self btnTitleForBtnColor:[UIColor redColor]];
        }
    }
}

/** 根据指定的分数，来对界面上的按钮进行 加分和减分*/
- (void)addScourePoint:(NSInteger)point  {
    
    /** 1.获取按钮上的分值*/
    NSString *n2 = self.coinBtn.currentTitle;
    
    /** 2.把分数转换成数字类型*/
    NSInteger n2Add = n2.integerValue;
    
    /** 3.对这个分数进行操作*/
    n2Add += point;
    
    /** 4.把新的数值重新赋值给控件*/
    [self.coinBtn setTitle:[NSString stringWithFormat:@"%ld",n2Add] forState:(UIControlStateNormal)];
    
}

/** 统一设置 答案按钮 的文字颜色*/
- (void)btnTitleForBtnColor:(UIColor *)color {
    
    /** 遍历每一个 答案按钮 设置文字颜色*/
    for (UIButton *answerBtn in self.answerView.subviews) {
        [answerBtn setTitleColor:color forState:(UIControlStateNormal)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
