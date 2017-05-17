#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"About";
}

- (void)dealloc {
    [_aboutLable release];
    [super dealloc];
}
@end
