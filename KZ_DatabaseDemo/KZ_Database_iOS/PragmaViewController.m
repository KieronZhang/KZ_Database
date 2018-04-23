//
//  PragmaViewController.m
//  KZ_Database_iOS
//
//  Created by Kieron Zhang on 2018/4/23.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "PragmaViewController.h"
#import <KZ_Database_iOS/KZ_DatabaseHeader.h>

@implementation PragmaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SQLite 高级语法";
    
    databaseArray = @[@"SQLite 约束", @"SQLite Joins", @"SQLite Unions 子句", @"SQLite 别名", @"SQLite Index 索引", @"SQLite Indexed By", @"SQLite Alter 命令", @"SQLite View 视图", @"SQLite Trigger 触发器"];
    
    databaseTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    databaseTableView.delegate = self;
    databaseTableView.dataSource = self;
    [self.view addSubview:databaseTableView];
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
            [KZ_CREATE.TABLE(@"DEPARTMENT").parameters(@[KZ_INTEGER(@"ID").PRIMARY_KEY.NOT_NULL, KZ_TEXT(@"DEPT").NOT_NULL, KZ_INTEGER(@"EMP_ID").NOT_NULL]) execute:^(id result, int resultCode) {
                NSLog(@"0-1 %@", [result boolValue] ? @"创建数据库成功" : [NSString stringWithFormat:@"创建数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"DEPARTMENT").parameters(@[@"ID", @"DEPT", @"EMP_ID"]).VALUES.parameters(@[@(1), @"'IT Billing'", @(1)]) execute:^(id result, int resultCode) {
                NSLog(@"0-2 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"DEPARTMENT").parameters(@[@"ID", @"DEPT", @"EMP_ID"]).VALUES.parameters(@[@(2), @"'Engineering'", @(2)]) execute:^(id result, int resultCode) {
                NSLog(@"0-3 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"DEPARTMENT").parameters(@[@"ID", @"DEPT", @"EMP_ID"]).VALUES.parameters(@[@(3), @"'Finance'", @(7)]) execute:^(id result, int resultCode) {
                NSLog(@"0-4 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"DEPARTMENT").parameters(@[@"ID", @"DEPT", @"EMP_ID"]).VALUES.parameters(@[@(4), @"'Engineering'", @(3)]) execute:^(id result, int resultCode) {
                NSLog(@"0-5 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"DEPARTMENT").parameters(@[@"ID", @"DEPT", @"EMP_ID"]).VALUES.parameters(@[@(5), @"'Finance'", @(4)]) execute:^(id result, int resultCode) {
                NSLog(@"0-6 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"DEPARTMENT").parameters(@[@"ID", @"DEPT", @"EMP_ID"]).VALUES.parameters(@[@(6), @"'Engineering'", @(5)]) execute:^(id result, int resultCode) {
                NSLog(@"0-7 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"DEPARTMENT").parameters(@[@"ID", @"DEPT", @"EMP_ID"]).VALUES.parameters(@[@(7), @"'Finance'", @(6)]) execute:^(id result, int resultCode) {
                NSLog(@"0-8 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
        }
            break;
        case 1: {
            [KZ_SELECT(@[@"EMP_ID", @"NAME", @"DEPT"]).FROM(@"COMPANY").CROSS.JOIN(@"DEPARTMENT") execute:^(id result, int resultCode) {
                NSLog(@"1-1 %@", result);
            }];
            [KZ_SELECT(@[@"EMP_ID", @"NAME", @"DEPT"]).FROM(@"COMPANY").INNER.JOIN(@"DEPARTMENT").ON(@"COMPANY.ID = DEPARTMENT.EMP_ID") execute:^(id result, int resultCode) {
                NSLog(@"1-2 %@", result);
            }];
            [KZ_SELECT(@[@"EMP_ID", @"NAME", @"DEPT"]).FROM(@"COMPANY").JOIN(@"DEPARTMENT").ON(@"COMPANY.ID = DEPARTMENT.EMP_ID") execute:^(id result, int resultCode) {
                NSLog(@"1-3 %@", result);
            }];
            [KZ_SELECT(@[@"EMP_ID", @"NAME", @"DEPT"]).FROM(@"COMPANY").JOIN(@"DEPARTMENT").USING(@"ID") execute:^(id result, int resultCode) {
                NSLog(@"1-4 %@", result);
            }];
            [KZ_SELECT(@[@"EMP_ID", @"NAME", @"DEPT"]).FROM(@"COMPANY").NATURAL.JOIN(@"DEPARTMENT") execute:^(id result, int resultCode) {
                NSLog(@"1-5 %@", result);
            }];
            [KZ_SELECT(@[@"EMP_ID", @"NAME", @"DEPT"]).FROM(@"COMPANY").LEFT.OUTER.JOIN(@"DEPARTMENT").ON(@"COMPANY.ID = DEPARTMENT.EMP_ID") execute:^(id result, int resultCode) {
                NSLog(@"1-6 %@", result);
            }];
            [KZ_SELECT(@[@"EMP_ID", @"NAME", @"DEPT"]).FROM(@"COMPANY").LEFT.OUTER.JOIN(@"DEPARTMENT").USING(@"ID") execute:^(id result, int resultCode) {
                NSLog(@"1-7 %@", result);
            }];
        }
            break;
        case 2: {
            [KZ_SELECT(@[@"EMP_ID", @"NAME", @"DEPT"]).FROM(@"COMPANY").INNER.JOIN(@"DEPARTMENT").ON(@"COMPANY.ID = DEPARTMENT.EMP_ID").UNION.SELECT(@[@"EMP_ID", @"NAME", @"DEPT"]).FROM(@"COMPANY").LEFT.OUTER.JOIN(@"DEPARTMENT").ON(@"COMPANY.ID = DEPARTMENT.EMP_ID") execute:^(id result, int resultCode) {
                NSLog(@"2-1 %@", result);
            }];
            [KZ_SELECT(@[@"EMP_ID", @"NAME", @"DEPT"]).FROM(@"COMPANY").INNER.JOIN(@"DEPARTMENT").ON(@"COMPANY.ID = DEPARTMENT.EMP_ID").UNION.ALL.SELECT(@[@"EMP_ID", @"NAME", @"DEPT"]).FROM(@"COMPANY").LEFT.OUTER.JOIN(@"DEPARTMENT").ON(@"COMPANY.ID = DEPARTMENT.EMP_ID") execute:^(id result, int resultCode) {
                NSLog(@"2-2 %@", result);
            }];
        }
            break;
        case 3: {
            [KZ_SELECT(@[@"C.ID", @"C.NAME", @"C.AGE", @"D.DEPT"]).FROM(@[KZ_AS(@"COMPANY", @"C"), KZ_AS(@"DEPARTMENT", @"D")]).WHERE(@"C.ID = D.EMP_ID") execute:^(id result, int resultCode) {
                NSLog(@"3-1 %@", result);
            }];
            [KZ_SELECT(@[KZ_AS(@"C.ID", @"COMPANY_ID"), KZ_AS(@"C.NAME", @"COMPANY_NAME"), @"C.AGE", @"D.DEPT"]).FROM(@[KZ_AS(@"COMPANY", @"C"), KZ_AS(@"DEPARTMENT", @"D")]).WHERE(@"C.ID = D.EMP_ID") execute:^(id result, int resultCode) {
                NSLog(@"3-2 %@", result);
            }];
        }
            break;
        case 4: {
            [KZ_CREATE.INDEX(@"salary_index").ON(@"COMPANY").parameters(@"salary") execute:^(id result, int resultCode) {
                NSLog(@"4-1 %@", [result boolValue] ? @"创建索引成功" : [NSString stringWithFormat:@"创建索引失败 %d", (int)resultCode]);
            }];
            [KZ_SELECT(@"*").FROM(@"sqlite_master").WHERE(@"type = 'index'") execute:^(id result, int resultCode) {
                NSLog(@"4-2 %@", result);
            }];
        }
            break;
        case 5: {
            [KZ_SELECT(@"*").FROM(@"COMPANY").INDEXED_BY(@"salary_index").WHERE(@"salary > 5000") execute:^(id result, int resultCode) {
                NSLog(@"5-1 %@", result);
            }];
        }
            break;
        case 6: {
            [KZ_ALTER.TABLE(@"COMPANY").RENAME_TO(@"OLD_COMPANY") execute:^(id result, int resultCode) {
                NSLog(@"6-1 %@", [result boolValue] ? @"修改数据库成功" : [NSString stringWithFormat:@"修改数据库失败 %d", (int)resultCode]);
            }];
            [KZ_ALTER.TABLE(@"OLD_COMPANY").ADD_COLUMN(KZ_TEXT(@"SEX")) execute:^(id result, int resultCode) {
                NSLog(@"6-2 %@", [result boolValue] ? @"修改数据库成功" : [NSString stringWithFormat:@"修改数据库失败 %d", (int)resultCode]);
            }];
            [KZ_SELECT(@"*").FROM(@"OLD_COMPANY") execute:^(id result, int resultCode) {
                NSLog(@"6-3 %@", result);
            }];
        }
            break;
        case 7: {
            [KZ_CREATE.VIEW(KZ_AS(@"COMPANY_VIEW", KZ_SELECT(@[@"ID", @"NAME", @"AGE"]).FROM(@"COMPANY").isNotSub)) execute:^(id result, int resultCode) {
                NSLog(@"7-1 %@", [result boolValue] ? @"创建视图成功" : [NSString stringWithFormat:@"创建视图失败 %d", (int)resultCode]);
            }];
            [KZ_SELECT(@"*").FROM(@"COMPANY_VIEW") execute:^(id result, int resultCode) {
                NSLog(@"7-2 %@", result);
            }];
        }
            break;
        case 8: {
            [KZ_CREATE.TABLE(KZ_IF_NOT_EXISTS(@"AUDIT")).parameters(@[KZ_INTEGER(@"EMP_ID").NOT_NULL, KZ_TEXT(@"ENTRY_DATE").NOT_NULL]) execute:^(id result, int resultCode) {
                NSLog(@"4-1 %@", [result boolValue] ? @"创建数据库成功" : [NSString stringWithFormat:@"创建数据库失败 %d", (int)resultCode]);
            }];
            [KZ_CREATE.TRIGGER(@"audit_log").AFTER.INSERT.ON(@"COMPANY") execute:^(id result, int resultCode) {
                NSLog(@"4-2 %@", [result boolValue] ? @"创建触发器成功" : [NSString stringWithFormat:@"创建触发器失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"AUDIT").parameters(@[@"EMP_ID", @"ENTRY_DATE"]).VALUES.parameters(@[@"new.ID", @"datatime('now')"]) execute:^(id result, int resultCode) {
                NSLog(@"4-3 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_INSERT.INTO(@"COMPANY").parameters(@[@"ID", @"NAME", @"AGE", @"ADDRESS", @"SALARY"]).VALUES.parameters(@[@(1), @"'Paul'", @(12), @"'California'", @(2000.00)]) execute:^(id result, int resultCode) {
                NSLog(@"4-4 %@", [result boolValue] ? @"插入数据库成功" : [NSString stringWithFormat:@"插入数据库失败 %d", (int)resultCode]);
            }];
            [KZ_SELECT(@"*").FROM(@"AUDIT") execute:^(id result, int resultCode) {
                NSLog(@"4-5 %@", result);
            }];
        }
            break;
        default:
            break;
    }
}

@end
