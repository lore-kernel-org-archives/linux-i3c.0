Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCDAC44500
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Jan 2026 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Og5do8gcksRjIK0JJUjxK6nRCo48zxO8APGqnDuM1Dc=; b=s9EK1V1sl0jer1
	EbFrp/IWSMRwStQ39h9HCNdR679zQXWKHe64peb63LzjwmuI7ciQ7/7wXoKSa3aipsEEnqQog93O2
	w9ly30qO4QHRMvaEmgwjvVhmu5uQiyoX35EXtfa3DXjPXTY9K+5sysS7mQI0DrI2wygALV8iNwTqI
	1D/VoCVCa4lwpTC7dKjzLiMSd6clahdjnPlwTPhUf/k7HRTU2C0nNnHCXF/gkIy3e0h3z3WQBv/vs
	uCvrnCTd/NmCAOIFp945t1T572zpSViEbIC4YUR8jQJ8H0hkH1U18aaIov5ZdjDvXgvCWM3txYCyt
	//UkyIWLyWnnCw/2H0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit07-00000006yxn-3xCd;
	Thu, 22 Jan 2026 11:37:23 +0000
Received: from mail-swedencentralazon11013031.outbound.protection.outlook.com ([52.101.83.31] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit05-00000006ywc-2EcZ
	for linux-i3c@lists.infradead.org;
	Thu, 22 Jan 2026 11:37:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKoNRCsz8ph6IF3xH+74K8qEFQfnd/ilet/BVrX2CE+/vTBYtTV7kJfpvoeTPCe2vAnLQDIkGjbornOpJPEZmyh5Ho5dz7JloPvFtBPV3YgI2jTTbw/pJtueDKI7vxan0XHmZayTPBGFmyJSSVcK4SssqxB22GDC2pF5nXh7L2QB1TbaUE1KNMeAsXoACXMTZhpri/5V822jMP68t3D2EIs7ahEGcNsofm1RJeLHKxI4Btd/PI3JxqKh1dPEGdbGktTZfutZ1TpQ/cv9umWpiaGZxnSAJuDeMNRi5B4gZCLWUQ3/gecZvbOiQmXX7j/J/c16yrzgb41QCiju9QgTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjEIRPlq3BeBG5XdCvsuz08lT+8W7DDEclTlnjpwU+4=;
 b=DzthlYL74//D0jTrNsz6C2WeEmp7iEC/q7TVr5gMWfBjpaN88f7qJBHMyzzswy6M6wRBVjbucuRoKRWGiYom7LR1a/z/8w8xBoE/oNKzGW1uxI5ijpm2tcKDyRnbDlJxKiwEpxv5/YfgcdBvlotGEstsfkVlNtDGpx+h4eNQjCMbsSKS3DIPGomAl1+7ncrdbrtTyxmSDF4q7StDTbHIVSBH53mdFh88Nvm54N3hcnuyQKbMqEP/UDfVELqdoLmtuvTbki/lTrNcNHBZ4ipOxusC5XcB+9RCNak/0WoVc3JtGvu2CaiDAEyuCrByZ9PP5WiCy1fOf8YB0iHiWW/o5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjEIRPlq3BeBG5XdCvsuz08lT+8W7DDEclTlnjpwU+4=;
 b=bR4Us5b/M8V0A+FJOEHOULsAmMel4E/4SWRpmvGibwGbi+igO5XAvsp2NtaV4pxCbCJ3tQmIndcBhgoZI1HzemTaXT5WeRSaCJTLIbZln9sMAHKf/aT6Ddxr5K7dACnySW/StSgLyB/OHVFy3aOvWusqsd4BgUKJnR0gqiMVvxIL2ONETdtZFR/zPuokg/RXmh8Ve3ianNU5aH++TgmjZeBdDkETf389HTcStfX7qvqGKxfDQQAliT/wGHLJe4vUJCj8myTNYG6L43jmPGhD4wEtbEmEP98YZ3PdNADVbdJBwOiCLH9Ha5cwtDhWRzC0fBH7kZ5PL/bgdEhjgatDCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Thu, 22 Jan
 2026 11:37:14 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%4]) with mapi id 15.20.9520.011; Thu, 22 Jan 2026
 11:37:14 +0000
From: =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
Date: Thu, 22 Jan 2026 12:36:30 +0100
Subject: [PATCH] i3c: master: Add WO sysfs option to re-DDA bus.
Message-Id: <20260122-i3c_rescan-v1-1-0c17071e232b@est.tech>
X-B4-Tracking: v=1; b=H4sIAL0LcmkC/yXMQQqDMBBA0avIrA3MxBBoryIiMU7b6SJKRktBv
 LtRl2/x/wbKWVjhWW2Q+ScqUyqguoL4CenNRsZisGg9EnkjTewzawzJuIelEQdHARFKMGd+yf+
 atd1tXYcvx+U8wL4fu4FTOG4AAAA=
X-Change-ID: 20260116-i3c_rescan-4921d0b41a00
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769081830; l=1482;
 i=david.nystrom@est.tech; s=20251215; h=from:subject:message-id;
 bh=OWBBNMRYley2VNrjrkcDsavyRDXJzGtP4gkjcambZAs=;
 b=VV98t7pFZmpxaPadZBEDqdFbAqZmW8vZp3HZJ9Q2waI7qrMMvWvteKrUccSh4gukLAoX6FQvS
 A2BreOmZesyAzxaUvyHoOYd8R/o1YGLYiCaZQz1cov0wEHrN68rk7aP
X-Developer-Key: i=david.nystrom@est.tech; a=ed25519;
 pk=4E3iRjA+3w+a4ykfCHDoL5z4ONs9OcY4IN3pTwIG7Bs=
X-ClientProxiedBy: GVZP280CA0069.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:270::17) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|DU2PPFB77F8FB19:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c2683c-d7ff-4356-be37-08de59aa96cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alExZ2RUZWxMbHpVY2lSYWN6bHIvSkMxVnkxd2ZWajByam5ORkRCSDNBc29n?=
 =?utf-8?B?b2JjNE5Ba1hkdmoxdElsK0pEUllnUk1EM1hKUlJOVEljOWxJSEU4UENlOTgr?=
 =?utf-8?B?UDZ4d2J0LzZQcHh4eFpiZzZ5dzBhWXFHa0xCS0FJQTlndnpSczBJdmRpYUIv?=
 =?utf-8?B?WmxwZi9mQlRDTWgvUGo2YkdxaXljMXNPOEJUYnJ3K0tjZmRSbGVEdUxDWklK?=
 =?utf-8?B?dHNyUENLVHpHSUswSC91UnFTZEdPOEpTb0RCcENsWjlpczdORjdRclNMZzV3?=
 =?utf-8?B?U1AzWW1oVGhYalVCMWdJMTM0NHUxbWRhbUdTSytOSWVVMzRqTmJCZ0NidXVI?=
 =?utf-8?B?UlFrZ0tvWVRzV2ZSblh5UDI4OUxqOU9HdW9hdXBFNU82bWIxQmJHdmhqWXF4?=
 =?utf-8?B?NTNoU1BGbDR3QzZsNWNwaGx2M3FiOW9iajdjQlRYU0JZOXJJeGRCbTFZRWdT?=
 =?utf-8?B?WTJCNVVnYmQ5azlKK0pUU1QwaGRDQUthWk5CWWxHTE45VVpqeVJaYnNwT2x0?=
 =?utf-8?B?bmVtR3IwWW8veG94dzRLa2Q5eUorc3hVNGppSXJZblRqOUV6MTRwTnd6Z1Fq?=
 =?utf-8?B?RTJrSCtOUGpQN2lxbkJ5cllScEgwejJOb0x4V3doOVlDUUljVFJPQ0VuZ3h4?=
 =?utf-8?B?eWRBUERVWFVWdGFwYnFjQlJ6dUNMa3ZFaTgvUzNQRWhYZ0J5QzZCK2s4azR6?=
 =?utf-8?B?MlAySVBFZUJYN1lOdW1VOThCdkF6YjVQdm9lRzltVE92T3V5aGI3MlByeXd0?=
 =?utf-8?B?NXQ4NlNIOXJ5U05mK2lSeWFNOVFDRDh6RzNmZEszdWVRTThvN0pOODlBOC9O?=
 =?utf-8?B?NFZWZ2FSYWU2VnpqSksrN3VLMXVUek12d0ZTUHpKZ0h5WjEybFRsT0V6VWdM?=
 =?utf-8?B?ZU1HZTA4UXBscFBUbFVIUWxZU2FQc1hJcUZNQ1ZOZE0yTmtHSnVBM2xrOTRM?=
 =?utf-8?B?SkJPeTMybkxVdStXSEdEbGFMTS91NVN5RHJhdHk0U2dIa3ovMzRtelBCNnR0?=
 =?utf-8?B?V3hoNStGVGFWTWVtUlpqV1V3RWNWL3k5ei80dGd4YTBIYzlhNVhESVd5WDdp?=
 =?utf-8?B?azdWdUF3T0hoMVJObVFQcmh5RmlyK2RCTldETXNuWU4zb25JUWVhM3ZvNmtK?=
 =?utf-8?B?ZkVhdFBvRE1FWjh4dXhVYk1NS3QraExPUnRGVEtlSlF2Y0VIdDdxeDg0U2lm?=
 =?utf-8?B?aFpVbkJDeGN0NUVEM1loMnYyQk1WMURYWm1NVFBuMFExUnFNMFd2K0Y5T1I0?=
 =?utf-8?B?cVBOWElCTmdjdW5nUm9BektCY1haRkZ4aHBCYnQ3emhuejkrWWd1ZTE5VENN?=
 =?utf-8?B?bVhCZFBtTThQTldaU21aZXNWOFR1bUkzeXpDZGFrcDVrOXM4TUJDekhJSFgv?=
 =?utf-8?B?YlN6c0ZSbGdNT0krdmtxY0xnVkdGMnZxUG9xb1k1b3JWR0ZjOXpjVEJjV1Fk?=
 =?utf-8?B?a091ZExsTDA1WnRBUmJka2RGRnVEdm1FeGlWb1NobEt5MHVlZHlmWFNwbytP?=
 =?utf-8?B?UklHSDZRTFo2d0J4aFdsNncvb1ZpY1FOMndiWWVtUlFDNFlPMk9idE85L3Fr?=
 =?utf-8?B?VEJpT2NwQzdOK0R6VDRzQ2VwT3V3eDloSUZBRmRET0I5UzB1a3o0N2xPMFRn?=
 =?utf-8?B?NHFaRy82U21VVjM2MU42YXJEMjlwOXIzdzhzTTI5bERpLzZsdnFOYjZMb0JT?=
 =?utf-8?B?YlJON21nb2R3Tk1IU3FnaWxlVEl6cXo4aFE0TWVicUUvMy9YQWJtZDVpYUs4?=
 =?utf-8?B?c3FKUU5mUjhQLzgxUGZWY1hUMW9hR1VjdFNxUys5SDRha1pQSmU2ODdDVFNn?=
 =?utf-8?B?ZE5qQ1dzdTJaTytoREpkd2lYdTVFZHA2Y0l0Qm1aeEJQMGtpdkJlZmZpdnl0?=
 =?utf-8?B?ZnEwNk00ZmlPM1l2aUJiU0NwQzNzUFZkRG1GNW5waFFXSWxIZGREK1R1MXQ0?=
 =?utf-8?B?ZEtZUUIzdE5ScnhEcDlONXpGWlRVMGpobFF6dEpYZjBLZjhod21wb1N0N1Zy?=
 =?utf-8?B?dUJnNVpQcjdLVjd3WE8xWSsyRENrVjlqVGtsd1A1ekpqRXl2Qm9PRGFWOU1V?=
 =?utf-8?B?WnpoN2ZlNXBoamoxc2NORXdDNlVkNUZiUnpqQVhKVHU0Q1hRdUt0TEp2a1Z6?=
 =?utf-8?Q?8zqI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmpYN1RkUkhQaXlFUit4V2NBaUNXVzE5YlRlaWcrdnMxbCtuNEs5Q1RXeDFL?=
 =?utf-8?B?SmdXak42RExwZEpFN2FDYmQrVnpyeXdMbklBeVlhZ3JrN3Rqc29CT2hTQ0FI?=
 =?utf-8?B?VkJvcCs2UGMyZW9IWFdyZUo1cmF4cUowV0xPRkNWS205MFpOblpjK2RMbGVh?=
 =?utf-8?B?MExQYnY2SzNwZEFZQWczUC9ZWmM5aGxvc0s4ZmJ0NXd0L1JXRUhQYkxrdWta?=
 =?utf-8?B?V0Y0TVZsdXAvZGhtcVQ1TDZwc0pQYmFKelNtSXhkdWVHYW9GQmc4UUhXSi9z?=
 =?utf-8?B?RWJDR01WaXRBT2xMYTVIb2lmWWs0N0RJU2hRVVg4MFEyZWpEYUppYlYvbzMw?=
 =?utf-8?B?Rk51R3NhR2JLbjNYUXczYm9YRmpEUzNESHU1YVdxWjVIUHhhcy9FenVkQmlu?=
 =?utf-8?B?Mkw5OC9NeGtVbEpaV2lob2NET2pvMDJIQlNIVkNCMWI0YU5nR3ZQekE1NGJj?=
 =?utf-8?B?bUl4OEwrdFErMC9WUWt1NFloQlBMNFMvaTU3OEsxVW95Q3E4Y25yRU1oMUt6?=
 =?utf-8?B?VndKaFAyQk9LdWQ5YlBtNiswbXI4c2tMYlhIMnRpem4xY3daSTI1LzZ6NUp4?=
 =?utf-8?B?cm9aT1FZSkVaNi9oL1h2V1E4SEZGSURjR05lWEI1akVaazZZSUJLaC9qWmNF?=
 =?utf-8?B?ZVVQdUlJRUUxd2ZnbVZVRk9HYXVUM0xlb0hkU01FdGlIVis5aFpZanFIZE4r?=
 =?utf-8?B?Q2EyWHR6bHNlWk1zQVJ2Z2dvNU9EQnhERTIzTElheXJtUEx1VzlkRnd2dlA3?=
 =?utf-8?B?bmlEVHBMcUhRUHJ5NitlNjFBVnlhVVRyTEEzTlJRbDJhbXVQQzVnYTRVL2Jq?=
 =?utf-8?B?Zm1BTTNCRjNPc1I5VjAzR1A4cG1nbS9RZ25TL2RkdGFvelRjL0dXclFiTkpo?=
 =?utf-8?B?Ky9tRi91UWVoSEZmOEVjTUFmaTlKazROUWprUVEwR293QzhmMUNJQXVNa2FM?=
 =?utf-8?B?bVhobzVhdXZSNUkzWmFrOHc5SXVXb2RLK281bTdPSlh4MVBrR1BRdDBFbFJj?=
 =?utf-8?B?aVdZY001WDFkUUJIVXd4b1hZanFwbTdPVWEyMXNWSlZ5WStGQUNLMnpBMTNn?=
 =?utf-8?B?dS9MemdoOGRXaHhsWEN0cWo2RFVvTXIzTjBsVGhCbG1yVTM2SDZSSXpwMm9i?=
 =?utf-8?B?YU9tdCtsTnMyS0NkcVE0c2JMRGVsczhsUitkNnlCVXNWMGdoY0hmd25HM3R5?=
 =?utf-8?B?VDVCaHp4QmVkZldNV1FYY1EreWowZDhMa2RvaExxZG83WEpublJySnk4d2ZX?=
 =?utf-8?B?ampvcTZCS0g0UEUwLytJalVtRGNIQm91eTJ3bm42K1ZiTFh4dEVQSzVlRDI0?=
 =?utf-8?B?cEVWcmdma01zd0dnallOSmcyM1phd040SG5LM09kVDI5aTdUcFdteHo4R0Iy?=
 =?utf-8?B?MmhMbWxlcWxLWWtlSkZabEE5MWtoSXFFd1Q2NXZsZkc4NUE2eW4zcDJNTWJB?=
 =?utf-8?B?YVVKV0ovWlQ2V0JqNmltYzZJRjJyWThseWd0RWQzQVBoQWE0RTF6M0wydWtV?=
 =?utf-8?B?cVdvUWxLOFd6UEhsS1V6M2JOSEordm9qL0lGYnNZTENRWXZuS29VSlErR0Zm?=
 =?utf-8?B?SS9HeGc0LzNpOEtZTkRLRGptanlnUUtjUk5MNlpyYTc3VjVocTVtQStJSUVM?=
 =?utf-8?B?UzZnMEN0QjdYaUVkMHcwKytKUUUyaWpLN2lSVWdPUWhrd3RuM1dsc1hvYk1v?=
 =?utf-8?B?V1ErcmR0UXRvL3l2MFk4MGN3N21wTExuVXBmZEhBeklZZ1dCRTZQWnV4UjZY?=
 =?utf-8?B?cC9kM2JwdDVkVGo4TDg1U1d4bzVPMUVEOWtwNllxenJVU2pvTmRNQXhrLzJL?=
 =?utf-8?B?d21CUGFpZDdkMlZhdVV2WUdTUzFmbDF3MjJ3S21lb1V5d1d5WUIwdFFtbEpm?=
 =?utf-8?B?L2F2dVREdEhzTTRZT2xkdGtmWjlveFJmZ0U4RmVQOGMxdVZCOURzWWlzTzdo?=
 =?utf-8?B?U3JBY09jOW01Wi8xQTJadnQyU0ZuMkRYbkJYZHNaNzlmWDdFb2xCT1hHeWV4?=
 =?utf-8?B?bEMrZi9jVjNTOXhDZE16RDhERncxVndpOVdwaFdMK1RUVVA0aU5oRGlIdFFj?=
 =?utf-8?B?MXlzaWIrZFQ5VTd0Sk9NS3dEQURKdlJaRFpmSzdYcG8yejZObmtGVmV6U09o?=
 =?utf-8?B?RDVsTE5WYWdBWE1HVXFpTEhBNzkzOWh5US9FWEtBR01BWEF6MXVJakJPTysr?=
 =?utf-8?B?Y001TkUxMEdFN29MemVKODdiWjA0TXh5OFZUNVVHbUNqMnN5UWdtanFsc1o4?=
 =?utf-8?B?ODN2bHBWOE5DSDNoZjhULzcvdlhWSHU5TlcrR2FCeXNTRDJXaGVhVmdybWts?=
 =?utf-8?B?OUFUNXd3bHh1TTdZV1dHRStQZEg0QUZXaU1ZY1ZHMXNKZTUxLzJ3Zz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c2683c-d7ff-4356-be37-08de59aa96cf
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:37:14.3320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 156UBShPpBKbTZy0LBPvzuL3QkMUCqBWueRmstWC0qXy47CAF9X1ecNIypLoVqeTinr6uZiEfNlB0VJgXESncg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPFB77F8FB19
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_033721_628747_E5704C0A 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

QWRkIGFiaWxpdHkgdG8gcmVzY2FuIHRoZSBpM2MgYnVzIGZyb20gdXNlcnNwYWNlLCBpLmUuIHBy
b3Zva2UgYSBEREEuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBOeXN0csO2bSA8ZGF2aWQubnlzdHJv
bUBlc3QudGVjaD4KLS0tCiBkcml2ZXJzL2kzYy9tYXN0ZXIuYyB8IDI0ICsrKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCmluZGV4IDgwZGRh
MGU4NTU1OC4uZWRlYWU3NDkzYjNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwor
KysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwpAQCAtNzU4LDYgKzc1OCwyOSBAQCBzdGF0aWMgc3Np
emVfdCBkZXZfbmFja19yZXRyeV9jb3VudF9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAKIHN0
YXRpYyBERVZJQ0VfQVRUUl9SVyhkZXZfbmFja19yZXRyeV9jb3VudCk7CiAKK3N0YXRpYyBzc2l6
ZV90IHJlc2Nhbl9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsCisJCQkgICAgc3RydWN0IGRldmlj
ZV9hdHRyaWJ1dGUgKmF0dHIsCisJCQkgICAgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgY291bnQp
Cit7CisJc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyID0gZGV2X3RvX2kzY21h
c3RlcihkZXYpOworCXVuc2lnbmVkIGxvbmcgdmFsOworCWludCByZXQ7CisKKwlyZXQgPSBrc3Ry
dG91bChidWYsIDAsICZ2YWwpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlpZiAodmFs
KSB7CisJCXJldCA9IGkzY19tYXN0ZXJfZG9fZGFhKG1hc3Rlcik7CisJCWlmIChyZXQpCisJCQly
ZXR1cm4gcmV0OworCX0KKworCXJldHVybiBjb3VudDsKK30KKworc3RhdGljIERFVklDRV9BVFRS
X1dPKHJlc2Nhbik7CisKIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICppM2NfbWFzdGVyZGV2X2F0
dHJzW10gPSB7CiAJJmRldl9hdHRyX21vZGUuYXR0ciwKIAkmZGV2X2F0dHJfY3VycmVudF9tYXN0
ZXIuYXR0ciwKQEAgLTc2OSw2ICs3OTIsNyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqaTNj
X21hc3RlcmRldl9hdHRyc1tdID0gewogCSZkZXZfYXR0cl9keW5hbWljX2FkZHJlc3MuYXR0ciwK
IAkmZGV2X2F0dHJfaGRyY2FwLmF0dHIsCiAJJmRldl9hdHRyX2hvdGpvaW4uYXR0ciwKKwkmZGV2
X2F0dHJfcmVzY2FuLmF0dHIsCiAJTlVMTCwKIH07CiBBVFRSSUJVVEVfR1JPVVBTKGkzY19tYXN0
ZXJkZXYpOwoKLS0tCmJhc2UtY29tbWl0OiA5Yjc5NzdmOWUzOWI3NzY4YzcwYzJhYTQ5N2YwNGU3
NTY5ZmQzZTAwCmNoYW5nZS1pZDogMjAyNjAxMTYtaTNjX3Jlc2Nhbi00OTIxZDBiNDFhMDAKCkJl
c3QgcmVnYXJkcywKLS0gIApEYXZpZCBOeXN0csO2bSA8ZGF2aWQubnlzdHJvbUBlc3QudGVjaD4K
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
