//
//  ViewController.m
//  Roulet
//
//  Created by Master on 2015/03/16.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

#import "ViewController.h"

#define CENTER self.view.center.x
#define LEFT self.view.center.x - 100
#define RIGHT self.view.center.x + 100

#define PARTICIPANTS 30

@interface ViewController ()

@end

@implementation ViewController {
    
    BOOL isStarted;
    BOOL isScaled;
    
    NSTimer *timer;
    NSMutableArray *randomNumberArray;
    
    IBOutlet UIImageView *monitorImageView;
    IBOutlet UIImageView *backgroundImageView;
    IBOutlet UIButton *startButton;
    
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;
    IBOutlet UILabel *label3;
    IBOutlet UILabel *label4;
    IBOutlet UILabel *label5;
    IBOutlet UILabel *label6;
    IBOutlet UILabel *label7;
    IBOutlet UILabel *label8;
    IBOutlet UILabel *label9;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initialize
    isStarted = NO;
    isScaled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startShuffle {
    
    if (isStarted == NO) {
        if (isScaled == NO) {
            [UIView animateWithDuration:1.0f
                                  delay:0.0f
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 monitorImageView.transform = CGAffineTransformMakeScale(2.5, 2.5);
                                 monitorImageView.center = CGPointMake(self.view.center.x, monitorImageView.center.y - 70);
                                 
                             } completion:^(BOOL finished) {
                                 [self shuffleNumbers];
                                 isScaled = YES;
                             }];
            [self scaleLabels];
        }else {
            [self shuffleNumbers];
        }
        isStarted = YES;
        
    }else {
        [timer invalidate];
        isStarted = NO;
    }
}

- (void)scaleLabels {
    [UIView animateWithDuration:1.0f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         label1.transform = CGAffineTransformMakeScale(2.5, 2.5);
                         label1.center = CGPointMake(LEFT, label1.center.y - 120);
                         
                         label2.transform = CGAffineTransformMakeScale(2.5, 2.5);
                         label2.center = CGPointMake(CENTER, label2.center.y - 120);
                         
                         label3.transform = CGAffineTransformMakeScale(2.5, 2.5);
                         label3.center = CGPointMake(RIGHT, label3.center.y - 120);
                         
                         label4.transform = CGAffineTransformMakeScale(2.5, 2.5);
                         label4.center = CGPointMake(LEFT, label4.center.y - 70);
                         
                         label5.transform = CGAffineTransformMakeScale(2.5, 2.5);
                         label5.center = CGPointMake(CENTER, label5.center.y - 70);
                         
                         label6.transform = CGAffineTransformMakeScale(2.5, 2.5);
                         label6.center = CGPointMake(RIGHT, label6.center.y - 70);
                         
                         label7.transform = CGAffineTransformMakeScale(2.5, 2.5);
                         label7.center = CGPointMake(LEFT, label7.center.y - 20);
                         
                         label8.transform = CGAffineTransformMakeScale(2.5, 2.5);
                         label8.center = CGPointMake(CENTER, label8.center.y - 20);
                         
                         label9.transform = CGAffineTransformMakeScale(2.5, 2.5);
                         label9.center = CGPointMake(RIGHT, label9.center.y - 20);
                         
                     } completion:^(BOOL finished) {
                         
                         if (isStarted) {
                             
                         }
                     }];
}

- (void)shuffleNumbers {
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(up) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)up {
    
    [self createRandomArray];
    
    label1.text = [NSString stringWithFormat:@"%@", randomNumberArray[0]];
    label2.text = [NSString stringWithFormat:@"%@", randomNumberArray[1]];
    label3.text = [NSString stringWithFormat:@"%@", randomNumberArray[2]];
    label4.text = [NSString stringWithFormat:@"%@", randomNumberArray[3]];
    label5.text = [NSString stringWithFormat:@"%@", randomNumberArray[4]];
    label6.text = [NSString stringWithFormat:@"%@", randomNumberArray[5]];
    label7.text = [NSString stringWithFormat:@"%@", randomNumberArray[6]];
    label8.text = [NSString stringWithFormat:@"%@", randomNumberArray[7]];
    label9.text = [NSString stringWithFormat:@"%@", randomNumberArray[8]];
}

-(void)createRandomArray{
    
    randomNumberArray = [NSMutableArray array];
    NSInteger number;
    while (randomNumberArray.count < PARTICIPANTS) {
        number = arc4random_uniform(PARTICIPANTS) + 1;
        NSUInteger index = [randomNumberArray indexOfObject:@(number)];
        if(index == NSNotFound){
            [randomNumberArray addObject:@(number)];
        }
    }
}






@end
