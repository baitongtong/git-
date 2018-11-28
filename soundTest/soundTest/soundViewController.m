//
//  soundViewController.m
//  soundTest
//
//  Created by M.emor.Y on 2018/11/20.
//  Copyright © 2018年 白童童. All rights reserved.
//

#import "soundViewController.h"

@interface soundViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation soundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sound"
                                                     ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc]
                          initWithContentsOfFile:path];
    self.names = dict;
    NSMutableDictionary *mu = [NSMutableDictionary dictionaryWithDictionary:self.names];
    [mu setValue:@"dadadadadd" forKey:@"sound.mp3"];
    self.names = mu;
    
    NSArray *array = [[self.names allKeys] sortedArrayUsingSelector:
                      @selector(compare:)];
    self.keys = array;
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - tableview DataSouse
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.names.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    NSUInteger row = [indexPath row];
    
    NSString *key = [self.keys objectAtIndex:row];
    NSString*nameSection = [self.names objectForKey:key];
    cell.textLabel.text = nameSection;

    return cell;
    
}
#pragma mark - tableview Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSUInteger row = [indexPath row];
    
    NSString *key = [self.keys objectAtIndex:row];
    if (row == self.names.count - 1) {
        [self playSoundWithFileName:@"sound.mp3"];
        return;
    }
    [self playSound:[key intValue]];
}
-(void)playSound:(int)soundID{
    SystemSoundID id = soundID;
    AudioServicesPlaySystemSound(id);
}
- (void)playSoundWithFileName:(NSString *)fileName
{
    SystemSoundID soundID;
    NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
    OSStatus errorCode = AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url) , &soundID);
    if (errorCode != 0) {
        NSLog(@"create sound failed");
    }else{
        AudioServicesPlaySystemSound(soundID);
    }
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
