//
//  ViewController.m
//  CoreDataUsingWebServices
//
//  Created by Vaishali on 26/5/17.
//  Copyright © 2017 VaishaliApp. All rights reserved.
//

//#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1

//#define jibeURL [NSURL URLWithString:@"http://stg2-test.jibe.com.sg/STG2_ASM/MobileService.svc/"] //2



#import "ViewController.h"
#import "LoginData.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"%@", [paths objectAtIndex:0]);
}

- (IBAction)LoginAction:(id)sender
{
    
    NSString *urlpath = [NSString stringWithFormat:@"http://stg2-test.jibe.com.sg/STG2_ASM/MobileService.svc/get_userdetails/user_name/%@/user_password/%@/DeviceID/%@",self.textUsername.text,self.textPass.text,@"123"];
    
    
    ///////////////////////////////////////////////////////////////////////////////////
    
    
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *encodedUrlAsString = [urlpath stringByAddingPercentEncodingWithAllowedCharacters:set];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithURL:[NSURL URLWithString:encodedUrlAsString]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                
                NSLog(@"RESPONSE: %@",response);
                NSLog(@"DATA: %@",data);
                
                if (!error)
                {
                    // Success
                    if ([response isKindOfClass:[NSHTTPURLResponse class]])
                    {
                        NSError *jsonError;
                        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                        
                        [self saveLoginDataintoCoreData:jsonResponse];
                        
                        if (jsonError)
                        {
                            // Error Parsing JSON
                            
                        } else {
                            // Success Parsing JSON
                            // Log NSDictionary response:
                            NSLog(@"%@",jsonResponse);
                        }
                    }  else {
                        //Web server is returning an error
                    }
                } else {
                    // Fail
                    NSLog(@"error : %@", error.description);
                }
            }] resume];
    
    ///////////////////////////////////////////////////////////////////////////////////
}

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

-(void)saveLoginDataintoCoreData:(NSDictionary *)response
{
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    
    LoginData *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"LoginData"
                  inManagedObjectContext:context];
         
         
         if ([[response objectForKey:@"Get_UserDetailsResult"] count] > 0)
         {
             NSDictionary *userDict  = [[response objectForKey:@"Get_UserDetailsResult"] objectAtIndex:0];
             
             NSNumber* userId = [NSNumber numberWithInt:[[userDict objectForKey:@"User_ID"] intValue]];
             [newContact setValue:userId forKey:@"userID"];
             NSLog(@"userID:%@", userId);
             
             NSString *userName1= [userDict objectForKey:@"User_Name"];
             [newContact setValue:userName1 forKey:@"userName"];
             NSLog(@"User_Name: %@", userName1);

             
             NSString *userRank1=[userDict objectForKey:@"User_Rank"];
             [newContact setValue:userRank1 forKey:@"userRank"];
             NSLog(@"%@", userRank1);

             NSNumber* status1 = [NSNumber numberWithInt:[[userDict objectForKey:@"Status"] intValue]];
             [newContact setValue:status1 forKey:@"status"];
             NSLog(@"%@", status1);

             
             NSNumber* staffcode1 = [NSNumber numberWithInt:[[userDict objectForKey:@"Staff_Code"] intValue]];
             [newContact setValue:staffcode1 forKey:@"staffCode"];
             NSLog(@"%@", staffcode1);

             
             NSNumber* maxImage1 = [NSNumber numberWithInt:[[userDict objectForKey:@"Max_Image"] intValue]];
             [newContact setValue:maxImage1 forKey:@"maxImage"];
             NSLog(@"%@", maxImage1);

             
             NSNumber* maxAudio1 = [NSNumber numberWithInt:[[userDict objectForKey:@"Max_Audio"] intValue]];
             [newContact setValue:maxAudio1 forKey:@"maxAudio"];
             NSLog(@"%@", maxAudio1);

             NSNumber* maxActivity = [NSNumber numberWithInt:[[userDict objectForKey:@"Max_Activity"] intValue]];
             [newContact setValue:maxActivity forKey:@"maxActivity"];
             NSLog(@"%@", maxActivity);

             
             NSNumber* imageCount1 = [NSNumber numberWithInt:[[userDict objectForKey:@"Image_Count"] intValue]];
             [newContact setValue:imageCount1 forKey:@"imageCount"];
             NSLog(@"%@", imageCount1);

             
             NSNumber* email1 = [userDict objectForKey:@"Email"];
             [newContact setValue:email1 forKey:@"email"];
             NSLog(@"%@", email1);

             
             NSNumber* companyID1 = [NSNumber numberWithInt:[[userDict objectForKey:@"Company_ID"] intValue]];
             [newContact setValue:companyID1 forKey:@"companyID"];
             NSLog(@"%@", companyID1);

             
             NSString *companyName1= [userDict objectForKey:@"Company_Name"];
             [newContact setValue:companyName1 forKey:@"companyName"];
             NSLog(@"%@", companyName1);

             
             NSString *authenticationToken1= [userDict objectForKey:@"Authentication_Token"];
             [newContact setValue:authenticationToken1 forKey:@"authenticationToken"];
             NSLog(@"%@", authenticationToken1);

             
             NSNumber* audioCount1 = [NSNumber numberWithInt:[[userDict objectForKey:@"Audio_Count"] intValue]];
             [newContact setValue:audioCount1 forKey:@"audioCount"];
             NSLog(@"%@", audioCount1);

             
             NSNumber* approvedUser1 = [NSNumber numberWithInt:[[userDict objectForKey:@"Approved_User"] intValue]];
             [newContact setValue:approvedUser1 forKey:@"approvedUser"];
             NSLog(@"%@", approvedUser1);

             
             NSNumber* activityCount1 = [NSNumber numberWithInt:[[userDict objectForKey:@"Activity_Count"] intValue]];
             [newContact setValue:activityCount1 forKey:@"activityCount"];
             NSLog(@"%@", activityCount1);

             
             NSString *name1= [userDict objectForKey:@"Name"];
             [newContact setValue:name1 forKey:@"name"];
             NSLog(@"%@", name1);

             
             NSString *password1= [userDict objectForKey:@"Password"];
             [newContact setValue:password1 forKey:@"password"];
             NSLog(@"%@", password1);

             
             NSString *phone1= [userDict objectForKey:@"Phone"];
             [newContact setValue:phone1 forKey:@"phone"];
             NSLog(@"%@", phone1);

             
             NSString *role1= [userDict objectForKey:@"Role"];
             [newContact setValue:role1 forKey:@"role"];
             NSLog(@"%@", role1);
             
             NSError *error = nil;
             // Save the object to persistent store
             if (![context save:&error])
             {
                 NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
             }
             else
             {
                 NSLog(@"Core Data Has been Updted sucessfully......");
             }
         }
 
}

    

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
