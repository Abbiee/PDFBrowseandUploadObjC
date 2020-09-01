//
//  ViewController.m
//  PDFBrowserObjC
//
//  Created by Abbie on 01/09/20.
//  Copyright © 2020 Abbie. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "ViewMyPDFViewController.h"

@interface ViewController ()<UIDocumentPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)buttonAction:(id)sender {
    
    NSArray *types = @[(NSString*)kUTTypePDF];
    //Create a object of document picker view and set the mode to Import
    UIDocumentPickerViewController *docPicker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:types inMode:UIDocumentPickerModeImport];
    //Set the delegate
    docPicker.delegate = self;
    //present the document picker
    [self presentViewController:docPicker animated:YES completion:nil];
}
#pragma mark Delegate-UIDocumentPickerViewController

/**
 *  This delegate method is called when user will either upload or download the file.
 *
 *  @param controller UIDocumentPickerViewController object
 *  @param url        url of the file
 */

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url
{
    if (controller.documentPickerMode == UIDocumentPickerModeImport)
    {

        // Condition called when user download the file
//        NSData *fileData = [NSData dataWithContentsOfURL:url];
//        NSLog(@"fileData %@", fileData);
        NSLog(@"%@", url);
        ViewMyPDFViewController *webview = [[ViewMyPDFViewController alloc]init];
        webview.productURL = url;
        [self presentViewController:webview animated:YES completion:nil];
        
    }
    
}

/**
 *  Delegate called when user cancel the document picker
 *
 *  @param controller - document picker object
 */
- (void)documentPickerWasCancelled:(UIDocumentPickerViewController *)controller {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
