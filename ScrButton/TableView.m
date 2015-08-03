//
//  TableView.m
//  ScrButton
//
//  Created by 口贷网 on 15/7/22.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "TableView.h"
#import "BiaoTableViewCell.h"

@implementation TableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerNib:[UINib nibWithNibName:@"BiaoTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"BiaoTableViewCell"];
    }
    return self;
}

- (NSInteger)numberOfSections {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BiaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BiaoTableViewCell"];
    return cell;
}


@end
