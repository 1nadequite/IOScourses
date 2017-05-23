#import "LicenseViewController.h"

@interface LicenseViewController ()

@end

@implementation LicenseViewController

- (IBAction)doneButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    [_licenseTextView release];
    [_doneButton release];
    [super dealloc];
}
@end
