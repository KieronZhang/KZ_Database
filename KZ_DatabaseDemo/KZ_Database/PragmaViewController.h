//
//  PragmaViewController.h
//  KZ_Database
//
//  Created by Kieron Zhang on 2017/11/17.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PragmaViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UITableView *databaseTableView;
    NSArray *databaseArray;
}

@end
