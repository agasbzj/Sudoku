#import "GameData.h"

extern GameData gSaveGame;

void SavePrefs()
{
	int a;
	//建立字典并注册
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  [NSNumber numberWithFloat:63], @"SaveGame", 
						  @"dummy", [NSNumber numberWithFloat:1],
						  nil];
	[[NSUserDefaults standardUserDefaults] registerDefaults:dict];
	
	gSaveGame.check = 1.0;
	
	NSData *savedata;
	unsigned char *ptr;
	unsigned char *save;
	save = malloc(sizeof(gSaveGame));
	
	ptr = (unsigned char *)&gSaveGame;
	for (a = 0; a < sizeof(gSaveGame); a ++) {
		*(save + a) = *(ptr + a);
	}
	savedata = [[NSData alloc] initWithBytes:save length:sizeof(gSaveGame)];
	
	[[NSUserDefaults standardUserDefaults] setObject:savedata forKey:@"SaveGame"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
}

void LoadPrefs()
{
	int check;
	NSData *savedata;
	savedata = [[NSUserDefaults standardUserDefaults] dataForKey:@"SaveGame"];
	
	//首次启动，设置默认值并保存
	if (savedata == NULL) {
		SavePrefs();
	}
	else {
		[savedata getBytes:&gSaveGame length:sizeof(gSaveGame)];
		//获取数据
		check = gSaveGame.check;
		//检查版本
		if (check == 1.0) {
			if (gSaveGame.gameActive) {
				gSaveGame.gameActive = 0;
			}
		}
		
	}	
	
}

void ResumeGame()
{
	
}
