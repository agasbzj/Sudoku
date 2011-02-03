//
//  Data.h
//  Sokokus
//
//  Created by 卞 中杰 on 11-1-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct{
	float check;
	int gameActive;
	int originalGenerated[9][9];	//原始生成的数独
	int correct[9][9];	//空格处正确的数字，其余为0
	int doing[9][9];	//玩家正在做的数组
}Data;
