//
//  soundViewController.h
//  soundTest
//
//  Created by M.emor.Y on 2018/11/20.
//  Copyright © 2018年 白童童. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

NS_ASSUME_NONNULL_BEGIN

@interface soundViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSDictionary *names;
@property (nonatomic, retain) NSArray *keys;
@end

NS_ASSUME_NONNULL_END
