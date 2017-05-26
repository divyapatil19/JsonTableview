//
//  LoginData+CoreDataProperties.h
//  CoreDataUsingWebServices
//
//  Created by Vaishali on 26/5/17.
//  Copyright © 2017 VaishaliApp. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LoginData.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *activityCount;
@property (nullable, nonatomic, retain) NSNumber *approvedUser;
@property (nullable, nonatomic, retain) NSNumber *audioCount;
@property (nullable, nonatomic, retain) NSString *authenticationToken;
@property (nullable, nonatomic, retain) NSNumber *companyID;
@property (nullable, nonatomic, retain) NSString *companyName;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSNumber *imageCount;
@property (nullable, nonatomic, retain) NSNumber *maxActivity;
@property (nullable, nonatomic, retain) NSNumber *maxAudio;
@property (nullable, nonatomic, retain) NSNumber *maxImage;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *password;
@property (nullable, nonatomic, retain) NSString *phone;
@property (nullable, nonatomic, retain) NSString *role;
@property (nullable, nonatomic, retain) NSNumber *staffCode;
@property (nullable, nonatomic, retain) NSNumber *status;
@property (nullable, nonatomic, retain) NSNumber *userID;
@property (nullable, nonatomic, retain) NSString *userName;
@property (nullable, nonatomic, retain) NSString *userRank;

@end

NS_ASSUME_NONNULL_END
