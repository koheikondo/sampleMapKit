//
//  ViewController.m
//  sampleMapKid
//
//  Created by 近藤 康平 on 2015/09/17.
//  Copyright (c) 2015年 Kohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //地図は地図を表示するVIEWの上に地図が映る。→そのVIewを準備する必要がある。
    
    //MapViewoオブジェクトを生成
    MKMapView *mapView =[[MKMapView alloc] init];
    
    //大きさ、位置を決定
    mapView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20);//iphone4s似合うくらいの大きさ今は設定。
                //左端０，上のどこからスタートするか（20）、上の時間表示などに被らないようにするには２０が適切。
                //残り右2つは数値でしてしても良いが、デバスに合わせて表示したい場合このように書く。
                //-20している理由は、最初の指定で20下げているから
    
    //表示するためにViewを追加。
    //[self.view addSubview:mapView];
    
    //↑一応ここまでで表示はできる。
    
    //表示位置の設定。
    CLLocationCoordinate2D co;
    
    //アヤラのいちを設定
    co.latitude=10.317347;//緯度
    co.longitude=123.905759;//経度
    
    [mapView setCenterCoordinate:co];
    
    //縮尺を指定
    MKCoordinateRegion cr = mapView.region;
    
    //地図の範囲を指定(緯度)
    cr.span.latitudeDelta=0.02; //ここの範囲小さくするほど、地図は狭くなる。→より詳細な地図になる。
    
    //地図の範囲を指定（経度）
    cr.span.longitudeDelta=0.02; //緯度経度　両方指定する必要はない.両方共指定するする場合は同じにしたほうが良い。
                                //片方だけ指定すると、自動的にもう片方も同じ数値になる。
    
    cr.center=co;
    
    [mapView setRegion:cr];
    
    //地図の表示種類設定。
    mapView.mapType =MKMapTypeHybrid;
    
    //ピンを立てる
    //アヤラ
    MKPointAnnotation *pin =[[MKPointAnnotation alloc]init];    //ピンのオブジェクトを生成。（インスタンス）
    pin.coordinate=CLLocationCoordinate2DMake(10.317347, 123.905759);//ピンの場所を指定。
    
    pin.title=@"アヤラ";
    pin.subtitle=@"セブで一番お大きい";
    
    [mapView addAnnotation:pin];
    
    MKPointAnnotation *pin2=[[MKPointAnnotation alloc]init];
    pin2.coordinate=CLLocationCoordinate2DMake(10.311715, 123.918332);
    
    pin2.title=@"SMモール";
    pin2.subtitle=@"セブで2番めに大きい";
    
    [mapView addAnnotation:pin2];
    
    MKPointAnnotation *pin3=[[MKPointAnnotation alloc]init];
    pin3.coordinate=CLLocationCoordinate2DMake(10.314276, 123.90535);
    
    pin3.title=@"2Quad";
    pin3.subtitle=@"NexSeed";
    
    [mapView addAnnotation:pin3];
    
    MKPointAnnotation *pin4=[[MKPointAnnotation alloc]init];
    pin4.coordinate=CLLocationCoordinate2DMake(10.314207, 123.89176);
    
    pin4.title=@"cebu doctor hospital";
    pin4.subtitle=@"correct";
    
    [mapView addAnnotation:pin4];
    
    MKPointAnnotation *pin5=[[MKPointAnnotation alloc]init];
    pin5.coordinate=CLLocationCoordinate2DMake(10.315699, 123.885437);
    
    pin5.title=@"cebu";
    pin5.subtitle=@"セブ♫";
    
    [mapView addAnnotation:pin5];
    
    //表示するためにViewを追加。
    [self.view addSubview:mapView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
