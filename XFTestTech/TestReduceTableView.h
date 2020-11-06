//
//  TestReduceTableView.h
//  TestTech
//
//  Created by HelloBoy on 2018/4/2.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NSUInteger (^NumberOfSectionsInTableView)(UITableView *tableView);
typedef NSUInteger (^NumberOfRowsInSection)(UITableView *tableView, NSInteger section);
typedef UITableViewCell* (^CellForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);

typedef void (^DidCellForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);


typedef NSString *(^TitleForHeaderInSection)(UITableView *tableView, NSInteger section);
typedef NSString *(^TitleForFooterInSection)(UITableView *tableView, NSInteger section);


typedef BOOL (^CanEditRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef BOOL (^CanMoveRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);

typedef NSArray<NSString *> * (^SectionIndexTitlesForTableView)(UITableView *tableView);
typedef NSInteger (^SectionForSectionIndexTitle)(UITableView *tableView, NSString *title, NSInteger index);

typedef void (^CommitEditingStyle)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath);
typedef void (^MoveRowAtIndexPath)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath);

@interface TestReduceTableView : NSObject<UITableViewDelegate, UITableViewDataSource>

+ (instancetype)instance;

- (void)numberOfSectionsInTableView:(NumberOfSectionsInTableView)numberOfSectionsInTableView
              numberOfRowsInSection:(NumberOfRowsInSection)numberOfRowsInSection
              cellForRowAtIndexPath:(CellForRowAtIndexPath)cellForRowAtIndexPath;

- (void)titleForHeaderInSection:(TitleForHeaderInSection)titleForHeaderInSection
        titleForFooterInSection:(TitleForFooterInSection)titleForFooterInSection;

- (void)canEditRowAtIndexPath:(CanEditRowAtIndexPath)canEditRowAtIndexPath
        canMoveRowAtIndexPath:(CanMoveRowAtIndexPath)canMoveRowAtIndexPath;

- (void)sectionIndexTitlesForTableView:(SectionIndexTitlesForTableView)sectionIndexTitlesForTableView
           sectionForSectionIndexTitle:(SectionForSectionIndexTitle)sectionForSectionIndexTitle;

- (void)commitEditingStyle:(CommitEditingStyle)commitEditingStyle
        moveRowAtIndexPath:(MoveRowAtIndexPath)moveRowAtIndexPath;


- (void)didCellForRowInTableView:(DidCellForRowAtIndexPath)didCellForRorAtIndexPath;

@end
