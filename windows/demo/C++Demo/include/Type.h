#pragma once

#include <stdint.h>

//#define		FOR_WINDOWS10					//WINDOWS 10 ��long long
#ifdef FOR_WINDOWS10
typedef long long YZWLHandle;				//��Ծ������������� ���ڸĶ�
#else
typedef long YZWLHandle;				//��Ծ������������� ���ڸĶ�
#endif

#define		COS_RESULT_BUFFER_LENGTH		256
#define		COS_SEND_BUFFER_LENGTH			256


typedef bool(__stdcall *userApduCommand)(char* inbuf, int ninbuf, unsigned char* outbuf, int &noutbuf, void* userdata);

typedef enum cardType
{
	unkwonType = -1,
	ACardType = 0,
	BCardType = 1
};


#if 1 //��ΪVC demo����ͷ�ļ� ��0��Ϊ1
typedef int		 					BOOL;
typedef unsigned char		 		byte;

#define		RT_NOT_HALT				0x26
#define		RT_ALL					0x52

#define		AM_A					0x60
#define		AM_B					0x61
#endif

typedef struct TwoIdInfoStructEx
{
	char arrTwoIdName[30];					//���� UNICODE
	char arrTwoIdSex[2];					//�Ա� UNICODE
	char arrTwoIdNation[4];					//���� UNICODE
	char arrTwoIdBirthday[16];				//�������� UNICODE YYYYMMDD
	char arrTwoIdAddress[70];				//סַ UNICODE
	char arrTwoIdNo[36];					//���֤���� UNICODE
	char arrTwoIdSignedDepartment[30];		//ǩ������ UNICODE
	char arrTwoIdValidityPeriodBegin[16];	//��Ч����ʼ���� UNICODE YYYYMMDD
	char arrTwoIdValidityPeriodEnd[16];		//��Ч�ڽ�ֹ���� UNICODE YYYYMMDD ��Ч��Ϊ����ʱ�洢�����ڡ�

	char arrTwoOtherNO[18]; // ͨ��֤�����
	char arrTwoSignNum[4];		// ǩ������
	char arrTwoRemark1[6];	// Ԥ����
	char arrTwoType[2];		// ֤�����ͱ�ʶ
	char arrTwoRemark2[6];	// Ԥ����

	char arrTwoIdNewAddress[70];			//����סַ UNICODE
	char arrReserve[2];						//�����ֽ� �ֽڶ�����
	unsigned char arrTwoIdPhoto[1024];		//��Ƭ��Ϣ
	unsigned char arrTwoIdFingerprint[1024];//ָ����Ϣ
	unsigned char arrTwoIdPhotoJpeg[4096];	//��Ƭ��Ϣ JPEG ��ʽ
	unsigned int  unTwoIdPhotoJpegLength;	//��Ƭ��Ϣ���� JPEG��ʽ
};

