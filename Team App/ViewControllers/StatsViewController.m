#import "StatsViewController.h"
#import "StatsViewController+Private.h"

#pragma mark - Implementation

@implementation StatsViewController

#pragma mark - Init and Dealloc Methods

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"Stats";
        self.navigationItem.title = @"Team App";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[UIImage imageNamed:@"teamapp-stats_off"]
                                                selectedImage:[UIImage imageNamed:@"teamapp-stats_on"]];
    }
    
    return self;
}

#pragma mark - Instance Methods

- (void)selectPageAtIndex:(NSUInteger)pageIndex
{
    self.displayedPage = pageIndex;
    
    self.segmentedControl.selectedSegmentIndex = self.displayedPage;
    
    NSInteger statsPageNumber = self.displayedPage + 1;
    NSString *labelString = [NSString stringWithFormat:@"Stats %ld", (long)statsPageNumber];
    self.label.text = labelString;
}

#pragma mark - IBAction Methods

- (IBAction)segmentedControlTapped:(UISegmentedControl *)sender
{
    [self selectPageAtIndex:sender.selectedSegmentIndex];
}

#pragma mark - View Lifecycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.segmentedControlContainer.backgroundColor = self.navigationController.navigationBar.barTintColor;
    
    [self selectPageAtIndex:self.displayedPage];
}

@end
