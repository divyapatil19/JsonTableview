//
//  DataViewController.h
//  CoreDataUsingWebServices
//
//  Created by Vaishali on 26/5/17.
//  Copyright © 2017 VaishaliApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *jsonTableView;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@end
