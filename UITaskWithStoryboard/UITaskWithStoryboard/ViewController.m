#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)helloButtonTapped:(id)sender {
    NSString *fullName = [[[NSString alloc] initWithFormat:@"Hello %@ %@", self.firstNameTextField.text, self.lastNameTextField.text] autorelease];
    if ([self.firstNameTextField.text length] == 0 && [self.lastNameTextField.text length] == 0) {
        [self.fullNameLabel setText:@"You have to input your name!"];
    } else {
        [self.fullNameLabel setText:fullName];
    }
    NSLog(@"%@", self.fullNameLabel.text);
}

@end
