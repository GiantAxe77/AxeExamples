//
//  AXEUMengSocialViewController.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/15.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEUMengSocialViewController.h"

//tools
#import <UMSocial.h>
#import "UILabel+AXEVerticalAlign.h"

// view
#import "CBCustomAlertView.h"

@interface AXEUMengSocialViewController () <UMSocialUIDelegate, UITextViewDelegate>

@property (nonatomic, strong) RACCommand *command;

@property (nonatomic, strong) UITextView *txt;

@end

@implementation AXEUMengSocialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化
    [self setup];
    
    //
    [self setupUI];
    
    
    
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    // 生成UIPreviewAction
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"one" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"Action 1");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"two" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"Action 2");
    }];
    
    // 添加到数组里返回
    NSArray *actions = @[action1, action2];
    
    return actions;
}

- (void)setup
{
    self.navigationItem.title = @"友盟社会化组件";
    self.view.backgroundColor = AXENormalColor;
}

- (void)setupUI
{
    // 发出通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"testRacNotification" object:nil];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"UMengShare" forState:UIControlStateNormal];
    btn.titleLabel.font = AXEFont(21.0);
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    btn.width = AXE_SCREEN_WIDTH - 80;
    btn.height = 60;
    btn.center = self.view.center;
    btn.layer.cornerRadius = 5.f;
    btn.layer.masksToBounds = YES;
    [btn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // test UILabel分类 注意是多行且内容少
//    UILabel *label = [[UILabel alloc] init];
//    label.numberOfLines = 10;
//    label.text = @"我是大双11";
//    label.frame = CGRectMake(0, 0, 200, 200);
//    label.font = [UIFont systemFontOfSize:15.0];
//    [label alignBottom];
//    [self.view addSubview:label];
//    label.backgroundColor = [UIColor yellowColor];

    
    UIButton *oo = [[UIButton alloc] init];
    [oo setTitle:@"oo" forState:UIControlStateNormal];
    oo.titleLabel.font = AXEFont(21.0);
    oo.backgroundColor = [UIColor grayColor];
    oo.width = AXE_SCREEN_WIDTH - 80;
    oo.height = 60;
    oo.centerX = self.view.centerX;
    oo.centerY = self.view.centerY - 100;
    [oo addTarget:self action:@selector(ooclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:oo];
    
    UIButton *niub = [[UIButton alloc] init];
    [niub setTitle:@"niub" forState:UIControlStateNormal];
    niub.titleLabel.font = AXEFont(21.0);
    niub.backgroundColor = [UIColor grayColor];
    niub.width = AXE_SCREEN_WIDTH - 80;
    niub.height = 60;
    niub.centerX = self.view.centerX;
    niub.centerY = self.view.centerY - 200;
    [self.view addSubview:niub];
    
    [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
        
    }];
    
    /*
    @weakify(self);
    // 代替点击事件
    [[niub rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        AXELog(@"按钮被点击了");
        UITextView *txt = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        txt.delegate = self;
        txt.returnKeyType = UIReturnKeyDone;
        [self.view addSubview:txt];
        self.txt = txt;
        
        [txt.rac_textSignal subscribeNext:^(id x) {
            
            NSLog(@"文字改变:%@", x);
        }];
    }];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        niub.width -= 20;
    });
    
    // 代替kvo
    [[niub rac_valuesForKeyPath:@"frame" observer:nil] subscribeNext:^(id x) {
        
        NSLog(@"---%@", x);
    }];
     
     
    
    // 代替通知(键盘弹出的通知)
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(id x) {
        
        NSLog(@"监听到通知");
    }];
    */
}

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark - 事件处理

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.txt endEditing:YES];
}

- (void)niubClick
{
    /*
    // 遍历数组
    NSArray *arr = @[@1, @2, @3, @4];
    [arr.rac_sequence.signal subscribeNext:^(id x) {
        
        NSLog(@"%@", x);
    }];
    
    // 遍历字典
    NSDictionary *dic = @{
                          @"name" : @"tom",
                          @"age" : @"12"
                          };
    [dic.rac_sequence.signal subscribeNext:^(id x) {
        
        RACTupleUnpack(NSString *key, NSString *value) = x;
        
        NSLog(@"%@ %@", key, value);
    }];
     
    

    // RACCommand
    // 1.创建命令
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        NSLog(@"执行命令");
        
        // 2.创建信号,用来传输数据.
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            [subscriber sendNext:@"请求数据"];
            
            // 注意,数据传递完,最好用sendCompleted,这时命令才执行完毕.
            [subscriber sendCompleted];
            
            return nil;
        }];
    }];
    
    // 强引用命令，不要被销毁，否则接收不到数据
    _command = command;
    
    // 3.订阅RACCommand中的信号
    [command.executionSignals subscribeNext:^(id x) {
        
        [x subscribeNext:^(id x) {
            
            NSLog(@"%@", x);
        }];
        
    }];
    */
}

- (void)ooclick
{
    void(^block1)() = ^{
        AXELog(@"1");
    };
    void(^block2)() = ^{
        AXELog(@"1");
    };
//    CBCustomAlertView *alertView = [[CBCustomAlertView alloc] initWithMessage:@"hello" buttonTextArr:@[@"can"] btnCallBlockArr:@[block] infoImageName:@"02"];
    
    CBCustomAlertView *alertView = [[CBCustomAlertView alloc] initWithMessage:@"Can you speak chinese?" buttonTextArr:@[@"yes", @"no"] btnCallBlockArr:@[block1, block2] infoImageName:@"02"];
    [alertView show];
}

- (void)share
{
    // UMeng fast share
    [UMSocialData defaultData].extConfig.title = @"ouhayou";
    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://baidu.com";
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"57b12d4167e58e86b0003a5c" shareText:@"Welcome To AXE" shareImage:[UIImage imageNamed:@"alpha"] shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone] delegate:nil];
    
   /*
    // 自定义UI
    UIView *view = [[UIView alloc] init];
    view.width = AXE_SCREEN_WIDTH - 80;
    view.height = 80;
    view.center = self.view.center;
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
      */
}

@end
