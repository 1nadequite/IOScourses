#import "ViewController.h"
#import "AboutViewController.h"
#import "LicenseViewController.h"

static NSString *const ZERO_VALUE = @"0";
static NSString *const DOT_VALUE = @".";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numberFloat = NO;
    UISwipeGestureRecognizer *swipeRight =[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    [swipeRight release];
}

- (IBAction)digitCollectionButtonTapped:(id)sender {
    NSString *newDigit = [sender titleForState:UIControlStateNormal];
    self.displayLabel.text = [self.displayLabel.text isEqualToString:ZERO_VALUE] ? newDigit : [NSString stringWithFormat:@"%@%@", self.displayLabel.text, newDigit];
}

- (IBAction)clearButtonTapped:(id)sender {
    self.numberFloat = NO;
    self.displayLabel.text = ZERO_VALUE;
}

- (IBAction)dotButtonTapped:(id)sender {
    if (!self.isNumberFloat) {
        self.numberFloat = YES;
        NSString *newDigit = [sender titleForState:UIControlStateNormal];
        self.displayLabel.text = [NSString stringWithFormat:@"%@%@", self.displayLabel.text, newDigit];
    }
}

- (void)swipeRight:(UISwipeGestureRecognizer*)gestureRecognizer {
    NSString *prevElement = [self.displayLabel.text substringWithRange:NSMakeRange(self.displayLabel.text.length - 1, 1)];
    if ([prevElement isEqualToString:DOT_VALUE]) self.numberFloat = NO;
    self.displayLabel.text = self.displayLabel.text.length > 1 ? [self.displayLabel.text substringToIndex:self.displayLabel.text.length - 1] : ZERO_VALUE ;
}

- (IBAction)aboutButtonTapped:(id)sender {
    AboutViewController *aboutController = [[AboutViewController alloc] init];
    [self.navigationController pushViewController:aboutController animated:YES];
    [aboutController release];
}

- (IBAction)licenseButtonTapped:(id)sender {
    LicenseViewController *licenseController = [[LicenseViewController alloc] init];
    [self presentViewController:licenseController animated:YES completion:nil];
    [licenseController release];
}

- (void)dealloc {
    [_displayLabel release];
    [_digitCollectionButtons release];
    [_clearButton release];
    [_dotButton release];
    [_aboutBarButtonItem release];
    [_licenseButton release];
    [super dealloc];
}

@end
