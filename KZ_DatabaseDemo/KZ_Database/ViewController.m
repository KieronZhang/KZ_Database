//
//  ViewController.m
//  KZ_Database
//
//  Created by Kieron Zhang on 2017/11/17.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "ViewController.h"
#import <KZ_DatabaseFramework/KZ_DatabaseHeader.h>
#import "PragmaViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SQLite 基础操作";
        
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"高级" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonTapped)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    databaseArray = @[@"SQLite 创建表", @"SQLite 删除表", @"SQLite Insert 语句", @"SQLite Replace 语句", @"SQLite Select 语句", @"SQLite Where 子句", @"SQLite Update 语句", @"SQLite Delete 语句", @"SQLite Limit 字句", @"SQLite Order By", @"SQLite Group By", @"SQLite Having 字句", @"SQLite Distinct 关键字"];
    
    databaseTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    databaseTableView.delegate = self;
    databaseTableView.dataSource = self;
    [self.view addSubview:databaseTableView];
}

- (void)rightButtonTapped {
    PragmaViewController *pragmaViewController = [[PragmaViewController alloc] init];
    [self.navigationController pushViewController:pragmaViewController animated:YES];
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return databaseArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *DatabaseCell = @"DatabaseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DatabaseCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DatabaseCell];
    }
    cell.textLabel.text = databaseArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击了 %@", databaseArray[indexPath.row]);
    switch (indexPath.row) {
        case 0: {
            [KZ_CREATE.TABLE(KZ_IF_NOT_EXISTS(@"COMPANY")).parameters(@[KZ_INTEGER(@"ID").PRIMARY_KEY.NOT_NULL, KZ_TEXT(@"NAME").NOT_NULL, KZ_INTEGER(@"AGE").NOT_NULL, KZ_TEXT(@"ADDRESS"), KZ_REAL(@"SALARY")]) execute:^(id result, int resultCode) {
                NSLog(@"0-1 %@", [result boolValue] ? @"创建数据库成功" : [NSString stringWithFormat:@"创建数据库失败 %d", (int)resultCode]);
            }];
        }
            break;
        case 1: {
            [KZ_DROP.TABLE(@"COMPANY") execute:^(id result, int resultCode) {
                NSLog(@"1-1 %@", [result boolValue] ? @"删除数据库成功" : [NSString stringWithFormat:@"删除数据库失败 %d", (int)resultCode]);
            }];
        }
            break;
        case 2: {
            [KZ_INSERT.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(1), @"'Paul'", @"32", @"'California'", @(20000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"2-1 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(2), @"'Allen'", @"25", @"'Texas'", @(15000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"2-2 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(3), @"'Teddy'", @"23", @"'Norway'", @(20000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"2-3 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(4), @"'Mark'", @"25", @"'Rich-Mond'", @(65000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"2-4 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(5), @"'David'", @"27", @"'Texas'", @(85000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"2-5 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(6), @"'Kim'", @"22", @"'South-Hall'", @(45000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"2-6 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(7), @"'James'", @"24", @"'Houston'", @(10000.0)]) execute:^(id result, int resultCode) {
                NSLog(@"2-7 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@"?, ?, ?, ?, ?") executeWithValues:@[@[@(8), @"'Paul'", @"24", @"'Houston'", @(20000.00)], @[@(9), @"'James'", @"44", @"'Norway'", @(5000.00)], @[@(10), @"'James'", @"45", @"'Texas'", @(5000.00)]] execute:^(id result, int resultCode) {
                NSLog(@"2-8 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
        }
            break;
        case 3: {
            [KZ_REPLACE.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(1), @"'Paul'", @"32", @"'California'", @(20000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"3-1 %@", [result boolValue] ? @"替换数据库成功" : [NSString stringWithFormat:@"替换数据库失败 %d", (int)resultCode]);
            }];
            [KZ_REPLACE.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(2), @"'Allen'", @"25", @"'Texas'", @(15000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"3-2 %@", [result boolValue] ? @"替换数据库成功" : [NSString stringWithFormat:@"替换数据库失败 %d", (int)resultCode]);
            }];
            [KZ_REPLACE.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(3), @"'Teddy'", @"23", @"'Norway'", @(20000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"3-3 %@", [result boolValue] ? @"替换数据库成功" : [NSString stringWithFormat:@"替换数据库失败 %d", (int)resultCode]);
            }];
            [KZ_REPLACE.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(4), @"'Mark'", @"25", @"'Rich-Mond'", @(65000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"3-4 %@", [result boolValue] ? @"替换数据库成功" : [NSString stringWithFormat:@"替换数据库失败 %d", (int)resultCode]);
            }];
            [KZ_REPLACE.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(5), @"'David'", @"27", @"'Texas'", @(85000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"3-5 %@", [result boolValue] ? @"替换数据库成功" : [NSString stringWithFormat:@"替换数据库失败 %d", (int)resultCode]);
            }];
            [KZ_REPLACE.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(6), @"'Kim'", @"22", @"'South-Hall'", @(45000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"3-6 %@", [result boolValue] ? @"替换数据库成功" : [NSString stringWithFormat:@"替换数据库失败 %d", (int)resultCode]);
            }];
            [KZ_REPLACE.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@"?, ?, ?, ?, ?") executeWithValues:@[@(7), @"'James'", @"24", @"'Houston'", @(10000.0)] execute:^(id result, int resultCode) {
                NSLog(@"3-7 %@", [result boolValue] ? @"替换数据库成功" : [NSString stringWithFormat:@"替换数据库失败 %d", (int)resultCode]);
            }];
            [KZ_REPLACE.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@"?, ?, ?, ?, ?") executeWithValues:@[@[@(8), @"'Paul'", @"24", @"'Houston'", @(20000.00)], @[@(9), @"'James'", @"44", @"'Norway'", @(5000.00)], @[@(10), @"'James'", @"45", @"'Texas'", @(5000.00)]] execute:^(id result, int resultCode) {
                NSLog(@"3-8 %@", [result boolValue] ? @"替换数据库成功" : [NSString stringWithFormat:@"替换数据库失败 %d", (int)resultCode]);
            }];
        }
            break;
        case 4: {
            [KZ_SELECT(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).FROM(@"COMPANY") execute:^(id result, int resultCode) {
                NSLog(@"4-1 %@", result);
            }];
        }
            break;
        case 5: {
            [KZ_SELECT(@"*").FROM(@"COMPANY").WHERE(@"AGE >= 25").AND(@"SALARY >= 65000") execute:^(id result, int resultCode) {
                NSLog(@"5-1 %@", result);
            }];
            [KZ_SELECT(@"*").FROM(@"COMPANY").WHERE(@"AGE >= 25").OR(@"SALARY >= 65000") execute:^(id result, int resultCode) {
                NSLog(@"5-2 %@", result);
            }];
            [KZ_SELECT(@"*").FROM(@"COMPANY").WHERE(@"AGE").IS.NOT_NULL execute:^(id result, int resultCode) {
                NSLog(@"5-3 %@", result);
            }];
            [KZ_SELECT(@"*").FROM(@"COMPANY").WHERE(@"NAME").LIKE(@"'Ki%'") execute:^(id result, int resultCode) {
                NSLog(@"5-4 %@", result);
            }];
            [KZ_SELECT(@"*").FROM(@"COMPANY").WHERE(@"NAME").GLOB(@"'Ki*'") execute:^(id result, int resultCode) {
                NSLog(@"5-5 %@", result);
            }];
            [KZ_SELECT(@"*").FROM(@"COMPANY").WHERE(@"AGE").IN(@(25), @"27") execute:^(id result, int resultCode) {
                NSLog(@"5-6 %@", result);
            }];
            [KZ_SELECT(@"*").FROM(@"COMPANY").WHERE(@"AGE").NOT.IN(@(25), @"27") execute:^(id result, int resultCode) {
                NSLog(@"5-7 %@", result);
            }];
            [KZ_SELECT(@[@"AGE", @"NAME"]).FROM(@"COMPANY").WHERE(@"AGE").BETWEEN(@"25").AND(@"27") execute:^(id result, int resultCode) {
                NSLog(@"5-8 %@", result);
            }];
            [KZ_SELECT(@"AGE").FROM(@"COMPANY").WHERE(@"").EXISTS(KZ_SELECT(@"AGE").FROM(@"COMPANY").WHERE(@"SALARY > 65000")) execute:^(id result, int resultCode) {
                NSLog(@"5-9 %@", result);
            }];
            [KZ_SELECT(@"AGE").FROM(@"COMPANY").WHERE(KZ_EXISTS(KZ_SELECT(@"AGE").FROM(@"COMPANY").WHERE(@"SALARY > 65000"))) execute:^(id result, int resultCode) {
                NSLog(@"5-10 %@", result);
            }];
            [KZ_SELECT(@"*").FROM(@"COMPANY").WHERE([NSString stringWithFormat:@"AGE > %@", KZ_SELECT(@"AGE").FROM(@"COMPANY").WHERE(@"SALARY > 65000").subSqlString]) execute:^(id result, int resultCode) {
                NSLog(@"5-11 %@", result);
            }];
        }
            break;
        case 6: {
            [KZ_UPDATE(@"COMPANY").SET(@"ADDRESS = 'Texas'").WHERE(@"ID = 6") execute:^(id result, int resultCode) {
                NSLog(@"6-1 %@", [result boolValue] ? @"更新数据库成功" : [NSString stringWithFormat:@"更新数据库失败 %d", (int)resultCode]);
            }];
            [KZ_UPDATE(@"COMPANY").SET(@{@"ADDRESS" : @"'Texas'", @"SALARY" : @"20000.00"}) execute:^(id result, int resultCode) {
                NSLog(@"6-2 %@", [result boolValue] ? @"更新数据库成功" : [NSString stringWithFormat:@"更新数据库失败 %d", (int)resultCode]);
            }];
        }
            break;
        case 7: {
            [KZ_DELETE.FROM(@"COMPANY").WHERE(@"ID = 7") execute:^(id result, int resultCode) {
                NSLog(@"7-1 %@", [result boolValue] ? @"删除数据库成功" : [NSString stringWithFormat:@"删除数据库失败 %d", (int)resultCode]);
            }];
            [KZ_DELETE.FROM(@"COMPANY") execute:^(id result, int resultCode) {
                NSLog(@"7-2 %@", [result boolValue] ? @"删除数据库成功" : [NSString stringWithFormat:@"删除数据库失败 %d", (int)resultCode]);
            }];
        }
            break;
        case 8: {
            [KZ_SELECT(@"*").FROM(@"COMPANY").LIMIT(6) execute:^(id result, int resultCode) {
                NSLog(@"8-1 %@", result);
            }];
            [KZ_SELECT(@"*").FROM(@"COMPANY").LIMIT(3).OFFSET(2) execute:^(id result, int resultCode) {
                NSLog(@"8-2 %@", result);
            }];
        }
            break;
        case 9: {
            [KZ_SELECT(@"*").FROM(@"COMPANY").ORDER_BY(@"SALARY").ASC execute:^(id result, int resultCode) {
                NSLog(@"9-1 %@", result);
            }];
            [KZ_SELECT(@"*").FROM(@"COMPANY").ORDER_BY(@[@"NAME", @"SALARY"]).ASC execute:^(id result, int resultCode) {
                NSLog(@"9-2 %@", result);
            }];
            [KZ_SELECT(@"*").FROM(@"COMPANY").ORDER_BY(@"NAME").DESC execute:^(id result, int resultCode) {
                NSLog(@"9-3 %@", result);
            }];
        }
            break;
        case 10: {
            [KZ_SELECT(@[@"NAME", @"SUM(SALARY)"]).FROM(@"COMPANY").GROUP_BY(@"NAME") execute:^(id result, int resultCode) {
                NSLog(@"10-1 %@", result);
            }];
            [KZ_SELECT(@[@"NAME", @"SUM(SALARY)"]).FROM(@"COMPANY").GROUP_BY(@"NAME").ORDER_BY(@"NAME") execute:^(id result, int resultCode) {
                NSLog(@"10-2 %@", result);
            }];
            [KZ_SELECT(@[@"NAME", @"SUM(SALARY)"]).FROM(@"COMPANY").GROUP_BY(@"NAME").ORDER_BY(@"NAME").DESC execute:^(id result, int resultCode) {
                NSLog(@"10-3 %@", result);
            }];
        }
            break;
        case 11: {
            [KZ_SELECT(@"*").FROM(@"COMPANY").GROUP_BY(@"NAME").HAVING(@"count(name) < 2") execute:^(id result, int resultCode) {
                NSLog(@"11-1 %@", result);
            }];
            [KZ_SELECT(@"*").FROM(@"COMPANY").GROUP_BY(@"NAME").HAVING(@"count(name) > 2") execute:^(id result, int resultCode) {
                NSLog(@"11-2 %@", result);
            }];
        }
            break;
        case 12: {
            [KZ_SELECT(KZ_DISTINCT(@"NAME")).FROM(@"COMPANY") execute:^(id result, int resultCode) {
                NSLog(@"12-1 %@", result);
            }];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
