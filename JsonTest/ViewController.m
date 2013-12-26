//
//  ViewController.m
//  JsonTest
//
//  Created by Dn on 13-4-11.
//  Copyright (c) 2013年 Dn. All rights reserved.
//

#import "ViewController.h"

#import "SBJSON.h"
#import "ASIFormDataRequest.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize cityidLabel,dateLabel,weekLabel,weatherLabel,tempLabel,cityLabel;

- (void)dealloc
{
    [cityidLabel release],[dateLabel release],[weekLabel release],[weatherLabel release],[tempLabel release],[cityLabel release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:@"http://m.weather.com.cn/data/101210101.html"]];
    
    request.delegate = self;
    [request startAsynchronous];


}

#pragma mark -
#pragma mark ASIHTTPRequestDelegate

- (void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"请求开始了");
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"请求结束了");
    //responseString就是response响应的正文内容.(即网页的源代码)
    NSString *str = request.responseString;
    NSLog(@"str is ---> %@",str);

    SBJSON *json = [[SBJSON alloc] init];
    NSDictionary *dic = [json objectWithString:str];
    NSLog(@"dic = %@",dic);
    
    NSDictionary *weatherinfo = [dic objectForKey:@"weatherinfo"];
    NSLog(@"weatherinfo  =  %@",weatherinfo);
    
    NSString *city = [weatherinfo objectForKey:@"city"];
    cityLabel.text = city;
    
    NSString *date = [weatherinfo objectForKey:@"date_y"];
    dateLabel.text = date;
    
    NSString *week = [weatherinfo objectForKey:@"week"];
    weekLabel.text = week;
    
    NSString *cityid = [weatherinfo objectForKey:@"cityid"];
    cityidLabel.text = cityid;
    
    NSString *temp = [weatherinfo objectForKey:@"temp1"];
    tempLabel.text = temp;
    
    NSString *weather = [weatherinfo objectForKey:@"weather1"];
    weatherLabel.text = weather;
    
//    NSString *image = [weatherinfo objectForKey:@"img2"];
//    NSLog(@"img1 = %@",image);
//    imageV.image = [UIImage imageNamed:image];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"请求失败了");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
