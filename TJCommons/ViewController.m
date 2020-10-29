//
//  ViewController.m
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import "ViewController.h"
#import "TJCommons.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [TJCommon avoidALLCrashExchangeMothed];
    
  
    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonClick {
    NSArray *array = @[];
    array[3];
    array = @[@"1",@""];
    array[9];
    array = @[@1];
    array[44];

    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:100];
    [array objectsAtIndexes:indexSet];

    NSRange range = NSMakeRange(0, 110);
    __unsafe_unretained id cArray[range.length];
    [array getObjects:cArray range:range];

    NSString *nilStr = nil;
    NSArray *array1 = @[@"chenfanfang",nilStr, @"iOSDeveloper"];
    array1 = [[NSArray alloc] initWithObjects:@"chenfanfang",nilStr, @"iOSDeveloper", nil];

    NSMutableArray *arraym = [NSMutableArray arrayWithArray:@[@"chenfanfang",nilStr, @"iOSDeveloper"]];
    arraym[9];
    [arraym insertObject:@"cool" atIndex:10];
    [arraym getObjects:cArray range:range];


    NSMutableDictionary *dict = @{@"name":@"chenfanfang"}.mutableCopy;
    NSString *ageKey = nil;
    dict[ageKey] = @(25);
    [dict setObject:@"asda" forKey:ageKey];
    [dict removeObjectForKey:ageKey];
    
    NSString *time = [NSDate TJ_getTimeStampNow];
    NSLog(@"%@",time);
    NSLog(@"%@",[NSDate TJ_getDay:time]);
    NSLog(@"%@",[NSDate TJ_getMoth:time]);
    NSLog(@"%@",[NSDate TJ_getYear:time]);
    NSLog(@"%@",[NSDate TJ_getHour:time]);
    NSLog(@"%@",[NSDate TJ_getSecond:time]);
    NSLog(@"%@",[NSDate TJ_getMinute:time]);



}


@end
