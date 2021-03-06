#pragma once
#include "Type.h"

typedef void(__stdcall *cardReadProgress)(unsigned int nProgress, YZWLHandle nhandle);

typedef enum _eDeviceType
{
	yzwlType = 0,
	sdtapiType = 1
}eDeviceType;

void __stdcall setDeviceType(int nDeviceType);

YZWLHandle __stdcall cardOpenDevice(int nouttime, int nDeviceNo = 0);

bool __stdcall cardReadTwoCard(YZWLHandle nDeviceHandle, cardReadProgress cardCB, 
	char* szFactoryFlag, char* szServerIp, int nServerPort,
	TwoIdInfoStructEx &cardinfo, bool bTest);

const char* __stdcall cardGetSerialNumber(YZWLHandle nDeviceHandle);

bool __stdcall cardGetCardDN(YZWLHandle nDeviceHandle, char* szsn, int &nlen);
bool __stdcall cardGetCardSN(YZWLHandle nDeviceHandle, char* szsn, int &nlen);

bool __stdcall cardBeep(YZWLHandle nDeviceHandle);

bool __stdcall setCardType(YZWLHandle nDeviceHandle, cardType ctype);
bool __stdcall getCardNo(YZWLHandle nDeviceHandle, char* arrcardNo, int &nlen);
bool __stdcall cardFindCard(YZWLHandle nDeviceHandle, bool &bmove);
bool __stdcall cardSelectCard(YZWLHandle nDeviceHandle);

void __stdcall cardCloseDevice(YZWLHandle nDeviceHandle);

int __stdcall	cardGetLastErrorCode(YZWLHandle nDeviceHandle);
const char*	__stdcall cardGetErrorInfo(YZWLHandle nDeviceHandle, int &nlen, int nErrorCode);
const char*	__stdcall cardGetLastError(YZWLHandle nDeviceHandle, int &nlen);

void __stdcall convertCardInfoToAnsi(TwoIdInfoStructEx &cardinfo);
void __stdcall convertCardInfoToUncode(TwoIdInfoStructEx &cardinfo);

// srcimage长度固定为1024 
// outimage大小由外面自己申请，大小不小于40KB
// outlen传入时为outimage实际大小，传出时为实际图片大小
bool __stdcall decodeCardImage(unsigned char* srcimage, char* outimage, int& outlen);