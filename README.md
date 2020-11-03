# TJCommons
//处理键盘弹出变化
    [[TJKeyboardManager sharedInstance] addKeyboardShowViewChange];
    [[TJKeyboardManager sharedInstance] setChangeInfo:@{@"100":@"50"}];
    [TJKeyboardManager sharedInstance].Block = ^float(NSInteger tag) {
        return 0;
    };
    //崩溃数据检测
    [TJCommon avoidALLCrashExchangeMothed];
