
//
//  TestReduceTableView.m
//  TestTech
//
//  Created by HelloBoy on 2018/4/2.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import "TestReduceTableView.h"

@interface TestReduceTableView()<UITableViewDataSource>

@property(nonatomic, strong) NumberOfSectionsInTableView numberOfSections;
@property(nonatomic, strong) NumberOfRowsInSection numberOfRows;
@property(nonatomic, strong) CellForRowAtIndexPath cellForRowAtIndexPath;
@property(nonatomic, strong) DidCellForRowAtIndexPath didCellForRowAtIndexPath;

@property(nonatomic, strong) TitleForHeaderInSection titleForHeaderInSection;
@property(nonatomic, strong) TitleForFooterInSection titleForFooterInSection;

@property(nonatomic, strong) CanEditRowAtIndexPath canEditRowAtIndexPath;
@property(nonatomic, strong) CanMoveRowAtIndexPath canMoveRowAtIndexPath;

@property(nonatomic, strong) SectionIndexTitlesForTableView sectionIndexTitlesForTableView;
@property(nonatomic, strong) SectionForSectionIndexTitle sectionForSectionIndexTitle;

@property(nonatomic, strong) CommitEditingStyle commitEditingStyle;
@property(nonatomic, strong) MoveRowAtIndexPath moveRowAtIndexPath;

@end



@implementation TestReduceTableView


+ (instancetype)instance {
    static TestReduceTableView *dataSource = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataSource = [[TestReduceTableView alloc]init];
    });
    return dataSource;
}


- (void)numberOfSectionsInTableView:(NumberOfSectionsInTableView)numberOfSectionsInTableView
              numberOfRowsInSection:(NumberOfRowsInSection)numberOfRowsInSection
              cellForRowAtIndexPath:(CellForRowAtIndexPath)cellForRowAtIndexPath{
    
    self.cellForRowAtIndexPath = cellForRowAtIndexPath;
    self.numberOfSections = numberOfSectionsInTableView;
    self.numberOfRows = numberOfRowsInSection;
}

- (void)titleForHeaderInSection:(TitleForHeaderInSection)titleForHeaderInSection
        titleForFooterInSection:(TitleForFooterInSection)titleForFooterInSection {
    
    self.titleForHeaderInSection = titleForHeaderInSection;
    self.titleForFooterInSection = titleForFooterInSection;
}

- (void)canEditRowAtIndexPath:(CanEditRowAtIndexPath)canEditRowAtIndexPath
        canMoveRowAtIndexPath:(CanMoveRowAtIndexPath)canMoveRowAtIndexPath {
    
    self.canEditRowAtIndexPath = canEditRowAtIndexPath;
    self.canMoveRowAtIndexPath = canMoveRowAtIndexPath;
}

- (void)sectionIndexTitlesForTableView:(SectionIndexTitlesForTableView)sectionIndexTitlesForTableView
           sectionForSectionIndexTitle:(SectionForSectionIndexTitle)sectionForSectionIndexTitle {
    
    self.sectionIndexTitlesForTableView = sectionIndexTitlesForTableView;
    self.sectionForSectionIndexTitle = sectionForSectionIndexTitle;
}

- (void)commitEditingStyle:(CommitEditingStyle)commitEditingStyle
        moveRowAtIndexPath:(MoveRowAtIndexPath)moveRowAtIndexPath {
    self.commitEditingStyle = commitEditingStyle;
    self.moveRowAtIndexPath = moveRowAtIndexPath;
}

- (void)didCellForRowInTableView:(DidCellForRowAtIndexPath)didCellForRorAtIndexPath{
    self.didCellForRowAtIndexPath = didCellForRorAtIndexPath;
}
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (!self.numberOfSections) {
        return 0;
    }
    return self.numberOfSections(tableView);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!self.numberOfRows) {
        return 0;
    }
    return self.numberOfRows(tableView, section);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellForRowAtIndexPath(tableView, indexPath);
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.titleForHeaderInSection) {
        return self.titleForHeaderInSection(tableView, section);
    }
    return @"";
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (self.titleForFooterInSection) {
        return self.titleForFooterInSection(tableView, section);
    }
    return @"";
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.canEditRowAtIndexPath) {
        return self.canEditRowAtIndexPath(tableView, indexPath);
    }
    return false;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.canMoveRowAtIndexPath) {
        return self.canMoveRowAtIndexPath(tableView, indexPath);
    }
    return false;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (self.sectionIndexTitlesForTableView) {
        return self.sectionIndexTitlesForTableView(tableView);
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if (self.sectionForSectionIndexTitle) {
        return self.sectionForSectionIndexTitle(tableView, title, index);
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.commitEditingStyle) {
        self.commitEditingStyle(tableView, editingStyle, indexPath);
    }
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if (self.moveRowAtIndexPath) {
        self.moveRowAtIndexPath(tableView, sourceIndexPath, destinationIndexPath);
    }
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didCellForRowAtIndexPath) {
        self.didCellForRowAtIndexPath(tableView, indexPath);
    }
}




@end
