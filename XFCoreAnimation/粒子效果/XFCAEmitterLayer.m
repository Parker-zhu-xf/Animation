//
//  CAEmitterLayer.m
//  XFCoreAnimation
//
//  Created by 朱晓峰 on 16/9/9.
//  Copyright © 2016年 朱晓峰. All rights reserved.
//

#import "XFCAEmitterLayer.h"

@interface XFCAEmitterLayer ()

@end

@implementation XFCAEmitterLayer

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"粒子";
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    CAEmitterLayer *fireworksEmitter=[CAEmitterLayer layer];
    CGRect viewBounds=self.view.layer.bounds;
    //粒子发射位置
    fireworksEmitter.emitterPosition=CGPointMake(self.view.frame.size.width, self.view.frame.size.height);
    fireworksEmitter.zPosition=100;
    
//    发射源的尺寸大小
    fireworksEmitter.emitterSize=CGSizeMake(viewBounds.size.width/2.0, 0);
    
    //发射模式
    fireworksEmitter.emitterMode=kCAEmitterLayerVolume;
    
    //发射形状
    fireworksEmitter.emitterShape=kCAEmitterLayerLine;
    
    //渲染模式
    fireworksEmitter.renderMode=kCAEmitterLayerAdditive;
    
    //初始化随机数函数的种子
    fireworksEmitter.seed=(arc4random()%100)+1;
    
    //
    CAEmitterCell *rocket=[CAEmitterCell emitterCell];
//    粒子参数的速度乘数因子
    rocket.birthRate=1.0;
//    周围发射角度
    rocket.emissionRange=0.25*M_PI;
//    速度
    rocket.velocity=380;
//    速度范围
    rocket.velocityRange=100;
//    粒子y方向的加速分量
    rocket.yAcceleration=75;
//    粒子的生命周期
    rocket.lifetime=1.02;
    
    //粒子要展现的图片
    rocket.contents=(id)[[UIImage imageNamed:@"1"]CGImage];
//    缩放
    rocket.scale=0.2;
//    粒子的颜色
    rocket.color=[[UIColor redColor]CGColor];
//    粒子颜色能改变的范围
    rocket.greenRange=1.0;
    rocket.redRange=1.0;
    rocket.blueRange=1.0;
//    粒子旋转角度范围
    rocket.spinRange=M_PI;
    
    CAEmitterCell *burst=[CAEmitterCell emitterCell];
    
    burst.birthRate=1.0;
    burst.velocity=0;
    burst.scale=2.5;
    burst.redSpeed=-1.5;
    burst.blueSpeed=+1.5;
    burst.greenSpeed=+1.0;
    burst.lifetime=3.5;
    
    CAEmitterCell *spark=[CAEmitterCell emitterCell];
    
    spark.birthRate=400;
    spark.velocity=125;
    spark.emissionRange=2*M_PI;
    spark.yAcceleration=75;
    spark.lifetime=3;
    spark.contents=(id)[[UIImage imageNamed:@"2"]CGImage];
    spark.scaleSpeed=-0.2;
    spark.greenSpeed=-0.1;
    spark.redSpeed=0.4;
    spark.blueSpeed=-0.1;
    spark.alphaSpeed=-0.25;
    spark.spin=2*M_PI;
    spark.spinRange=2*M_PI;
    
    fireworksEmitter.emitterCells=[NSArray arrayWithObject:rocket];
    rocket.emitterCells=[NSArray arrayWithObject:burst];
    burst.emitterCells=[NSArray arrayWithObject:spark];
    
//    添加到涂层
    [self.view.layer addSublayer:fireworksEmitter];
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

@end
