//
//  ViewController.h
//  JsonTest
//
//  Created by Dn on 13-4-11.
//  Copyright (c) 2013年 Dn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *cityLabel;
    IBOutlet UILabel *dateLabel;
    IBOutlet UILabel *weekLabel;
    IBOutlet UILabel *cityidLabel;
    IBOutlet UILabel *tempLabel;
    IBOutlet UILabel *weatherLabel;
    //IBOutlet UIImageView *imageV;
}
@property (nonatomic ,retain) UILabel *cityLabel;
@property (nonatomic ,retain) UILabel *dateLabel;
@property (nonatomic ,retain) UILabel *weekLabel;
@property (nonatomic ,retain) UILabel *cityidLabel;
@property (nonatomic ,retain) UILabel *tempLabel;
@property (nonatomic ,retain) UILabel *weatherLabel;
//@property (nonatomic ,retain) UIImageView *imageV;
@end
