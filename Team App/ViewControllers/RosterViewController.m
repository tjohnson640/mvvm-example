#import "RosterViewController.h"

#pragma mark - Implementation

@implementation RosterViewController

#pragma mark - Init and Dealloc Methods

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"Roster";
        self.navigationItem.title = @"Team App";
        
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[UIImage imageNamed:@"teamapp-roster_off"]
                                                selectedImage:[UIImage imageNamed:@"teamapp-roster_on"]];
    }
    
    return self;
}

@end
