//
//  ViewController.h
//  SamplePList
//
//  Created by 佐藤凌馬 on 2014/11/04.
//  Copyright (c) 2014年 RyomaSato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{

  NSArray *_pListArray;

}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

