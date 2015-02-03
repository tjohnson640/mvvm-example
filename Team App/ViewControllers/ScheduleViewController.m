#import "ScheduleViewController.h"

#pragma mark - Implementation

@implementation ScheduleViewController

#pragma mark - Init and dealloc Methods

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"Schedule";
        self.navigationItem.title = @"Team App";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[UIImage imageNamed:@"teamapp-schedule_off"]
                                                selectedImage:[UIImage imageNamed:@"teamapp-schedule_on"]];
    }
    
    return self;
}

@end
