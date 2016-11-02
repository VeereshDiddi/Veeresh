//
//  FirstViewController.m
//  NSUserDefaultsDemo
//
//  Created by AsquareMobileTechnologies on 6/14/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [[NSUserDefaults standardUserDefaults]objectForKey:@"name"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)createBtnClicked:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"Path :%@",paths);
    NSString *path = [paths objectAtIndex:0];
    NSString *folderPath = [path stringByAppendingPathComponent:@"asquare"];
    if (![[NSFileManager defaultManager]fileExistsAtPath:folderPath]) {
        [[NSFileManager defaultManager]createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *existingFilePath = [[NSBundle mainBundle]pathForResource:@"dummy" ofType:@"txt"];
    NSString *filePath = [folderPath stringByAppendingPathComponent:@"asquare.txt"];
    NSData *fileData = [NSData dataWithContentsOfFile:existingFilePath];
    [fileData writeToFile:filePath atomically:YES];
}

- (IBAction)galleryBtnClicked:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    NSData *imageData = UIImageJPEGRepresentation(selectedImage, 1.0);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"Path :%@",paths);
    NSString *path = [paths objectAtIndex:0];
    NSString *folderPath = [path stringByAppendingPathComponent:@"asquare"];
    if (![[NSFileManager defaultManager]fileExistsAtPath:folderPath]) {
        [[NSFileManager defaultManager]createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *filePath  = [folderPath stringByAppendingPathComponent:@"test.jpeg"];
    [imageData writeToFile:filePath atomically:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
