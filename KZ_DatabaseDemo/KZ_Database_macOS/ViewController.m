//
//  ViewController.m
//  KZ_Database_macOS
//
//  Created by Kieron Zhang on 2018/4/23.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "ViewController.h"
#import <KZ_Database_macOS/KZ_DatabaseHeader.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    databaseArray = @[@"SQLite 创建表", @"SQLite 删除表", @"SQLite Insert 语句", @"SQLite Replace 语句", @"SQLite Select 语句", @"SQLite Where 子句", @"SQLite Update 语句", @"SQLite Delete 语句", @"SQLite Limit 字句", @"SQLite Order By", @"SQLite Group By", @"SQLite Having 字句", @"SQLite Distinct 关键字"];
    pragmaArray = @[@"SQLite 约束", @"SQLite Joins", @"SQLite Unions 子句", @"SQLite 别名", @"SQLite Index 索引", @"SQLite Indexed By", @"SQLite Alter 命令", @"SQLite View 视图", @"SQLite Trigger 触发器"];
    
    NSScrollView *tableContainer = [[NSScrollView alloc] initWithFrame:self.view.bounds];
    databaseTableView = [[NSTableView alloc] initWithFrame:self.view.bounds];
    databaseTableView.delegate = self;
    databaseTableView.dataSource = self;
    
    NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"TableColumn"];
    column.width = CGRectGetWidth(tableContainer.frame) / 2;
    column.minWidth = CGRectGetWidth(tableContainer.frame) / 2;
    column.maxWidth = CGRectGetWidth(tableContainer.frame) / 2;
    column.title = @"SQLite 基础操作";
    [databaseTableView addTableColumn:column];
    
    NSTableColumn *column2 = [[NSTableColumn alloc] initWithIdentifier:@"TableColumn2"];
    column2.width = CGRectGetWidth(tableContainer.frame) / 2;
    column2.minWidth = CGRectGetWidth(tableContainer.frame) / 2;
    column2.maxWidth = CGRectGetWidth(tableContainer.frame) / 2;
    column2.title = @"SQLite 高级语法";
    [databaseTableView addTableColumn:column2];
    
    tableContainer.documentView = databaseTableView;
    tableContainer.hasVerticalScroller = YES;
    [self.view addSubview:tableContainer];
}

#pragma mark NSTableViewDelegate
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return MAX(databaseArray.count, pragmaArray.count);
}

- (BOOL)tableView:(NSTableView *)tableView shouldEditTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return NO;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    if ([tableColumn.identifier isEqualToString:@"TableColumn"] && row < databaseArray.count) {
        return databaseArray[row];
    }
    if ([tableColumn.identifier isEqualToString:@"TableColumn2"] && row < pragmaArray.count) {
        return pragmaArray[row];
    }
    return nil;
}

- (BOOL)tableView:(NSTableView *)tableView shouldTrackCell:(NSCell *)cell forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    [tableView deselectRow:row];
    if ([tableColumn.identifier isEqualToString:@"TableColumn"] && row < databaseArray.count) {
        NSLog(@"点击了 %@ %@", tableColumn.title, databaseArray[row]);
        switch (row) {
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
    if ([tableColumn.identifier isEqualToString:@"TableColumn2"] && row < pragmaArray.count) {
        NSLog(@"点击了 %@ %@", tableColumn.title, pragmaArray[row]);
        switch (row) {
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
    return YES;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    return YES;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

@end
