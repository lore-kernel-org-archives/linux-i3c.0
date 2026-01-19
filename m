Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D754B103E2E4
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Mar 2026 22:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtykSX9PHSGl3PT3cWnkP5xADKDUjXEW/aU5VEoQaCI=; b=Foh7iIFXKWHnhkwZFFZSqqEW14
	0TpIIv7ulXuqZSbLslt9gtKSGU64QjRk//LHqxCyKJ/188r5dF/ndcxc+CO9aENdh1jW3hpq3uB5v
	0fF5WTYyEerWQrJfTI6kAK6pd9IhZHFc8/SHJZVLhuTYdrvSjrihkmI27gfAOksqKnCJENcWjXd7a
	ZMPzIuDH2C0t+mttBodSSe3Eo+KcG4utbsOhkEa8yEgsiXl1dgEZm02U6tmF0YrQe8crwwPhEkXMu
	zY4hDHb27duBroWZS0+BT+zDV7+AEPWITtsMHLdeIMNjerI8qKRTTVnZ7M39KwuxM9WB2uiHQU7Vx
	9VX+0l1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rcs-0000000CbbH-0rR9;
	Wed, 11 Mar 2026 22:01:58 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjrL-00000001Vpq-3K8L
	for linux-i3c@lists.infradead.org;
	Mon, 19 Jan 2026 07:39:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1Q1xgg+nmhMCN6+b8inPB+1mGRJbKApznLqPKDSyLosy8QtMUCHFPDRSSFnn1wKlJiZe9aJDNuSnFGoXFY7gXmTf6Twx8c1mPhVeKorFWIbmFDZ5jbo9MrglJTNru//ul190sZePKevj/Nf9ew6MIKfxGztoJ56MXf9YLGCi3R2bIO5IBJ147SajO2mX4w1jZ3kbCTIEHl4W5i1LJSYzyvqaCPuwvVTp4xDpHrg8WV2iQxaKBvXAoBtZV6/8MCZav4pbT2EKMtYkJLo1XyyVmfcCBGUrpVp+FkUFy81yAYkz5g54sLLtp5kL9VbydwgcNwhJSAZ4+3CYpH+XnS3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJmEU17mYNrzC4Z7KyMm/tYy31Ax5H5XtrzrbogdyTg=;
 b=Nk42EjLWlBK8wyEAJFQNF95dD3C2WMiTQJ/MaaUxxzBFWHdDBSxRF59PohFZ56eH10oPKlARGi1hlc8JzyT2yA7shDrHUra0tPo4Em8Zbwz0NunGzkv709WXCuHjkXnIfPfe3RfckJdtZ6ZPdROFPfVl6TYJdcpbfBDJNm+FbluDYLvjvrGpq8Dkc8OGRlZ63vtF0L3S5G+VncIyeKK9W4HcPx8r/eCmQYwBRpQTPISBvoyBuFCbNiWVp7CwZxsxSb+kEIPqBJ1V0Ff/Xyflqb+AyniO9j1Ztk2mWEvKQSR3pRCPLOLTy6zAsoBRaurXGV1XjtR+F4rr2FysXH7ngA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJmEU17mYNrzC4Z7KyMm/tYy31Ax5H5XtrzrbogdyTg=;
 b=gvY2JC/2ABNC7kBnmq3FRHQhQ67z7/jGDBL9R7Tx8g/FLVk9wZGzcRgENmMocYUyAzXcqhccx9kH8qWVGuRekL36F/+FSFmI7Bl7snTY7VzbkYO/RlS6tRUTUxkE7c+ZrygCxtcnVssByy/4KWryMxA0b25pCcDnJ9Xc7ucn/FGXruOO/zZZxBvU9uMshHsv7oRAE+MZfzW+D+cOXF/5Da6MOJkwZoF8p1bIwco2t3PiJ18YucI7BZR79STRENo8hIyXHCOxNAg1WkZhj94J/XPBYWz3BaCawxw2Vc4rs+wxyrsMVvgVNXDTm37Imzk9fRDV3F3Mzc5HAjOPzih7iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by DU0P189MB3323.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:59c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 07:39:18 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%4]) with mapi id 15.20.9520.005; Mon, 19 Jan 2026
 07:39:17 +0000
Date: Mon, 19 Jan 2026 08:39:14 +0100 (CET)
From: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>
To: Adrian Hunter <adrian.hunter@intel.com>
cc: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>, 
    alexandre.belloni@bootlin.com, Frank.Li@nxp.com, 
    Wolfram Sang <wsa+renesas@sang-engineering.com>, 
    linux-i3c@lists.infradead.org
Subject: Re: [PATCH 2/3] i3c: mipi-i3c-hci: Add optional System Suspend
 support
In-Reply-To: <3fa52ab5-a1d1-4ca0-ace0-efdb0ed9e32c@intel.com>
Message-ID: <0a77c157-0825-bd8c-2248-a27a964534ed@est.tech>
References: <20260116151237.96721-1-adrian.hunter@intel.com> <20260116151237.96721-3-adrian.hunter@intel.com> <fd311803-94bf-2f24-8941-3285a7358e1c@est.tech> <3fa52ab5-a1d1-4ca0-ace0-efdb0ed9e32c@intel.com>
Content-Type: multipart/mixed; boundary=832332920799933071768808354328258
X-ClientProxiedBy: GV2PEPF00007569.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3e7) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|DU0P189MB3323:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eca007d-3f48-4712-061b-08de572dda21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3ZyazhOdjdlZGNGUVdHM0NRV1FSSUxIeC83TzY2SGw4T1FadFZFcjlRR3dH?=
 =?utf-8?B?bk9NYW9KRGxJcHlrQTN2ZWVUUytUd0Y3cWlVY3hNdzREc0NWTVdiNDdINEcv?=
 =?utf-8?B?dU11STh2Zm1mNnp5UVliaythYlFtZmZFcHc3UWNoZFd6ZlpHQW02bCt6RkFD?=
 =?utf-8?B?QzZjWnpCQmI1M1NKdUVOZVhpYk9LNUpEbEQ1ci9nTEc5SkxXblBYZ081aS9E?=
 =?utf-8?B?aFFxZklSSU96ZmFoeEwzNzcxZWF3OW1PUFZFbWhYRGY3K2g3TmxOT2pvak1l?=
 =?utf-8?B?RjlLOUZjbGVlTXNZVmhMeHBDSVIxZVNwK3NJUnFCNWlnMzRnRTJsb0dOY1NF?=
 =?utf-8?B?NkJoSTR2UndISlhUZys3QWV2MkpNbnR6THAzNDBpcWdyMzFINys1d29sQlRx?=
 =?utf-8?B?dU1hZURmd1N6QkpFUG5kNnpLQWt2SFVaZnpEeVEybGhmQlFySFhSOXhBMU9N?=
 =?utf-8?B?aE1HQTZuZnh4dGZGYzZWRTBnQzhERFZ5YWZudUdtQW1IUFFXazByYVRiYnE0?=
 =?utf-8?B?cU9DSmFLOEU2RE9uS1JiNjZsOUN4TGN4OXQ5aHh1VjRnZ2dKMnJUWWtxUG5M?=
 =?utf-8?B?aWtYMmRscVdGU3hKK2o1dFBjWEo3SEFWbHl0VUJFN1RDeEVZUW1CZXNwWUky?=
 =?utf-8?B?bUVOWDZtUWN1Qmw5Mm5rTXZRTEJKQVFaVWlDaERDbmp0b1ViZXZWdTNHQ2la?=
 =?utf-8?B?M0RPVG1NazZQdi9FaURvK1M0dEdpcFRlRW1IMDBmb0xKZ0h3TTVRSURidHRY?=
 =?utf-8?B?bmUvYVRqS2tpaVdlVnJreFQxNCtGcWhDcnBQRFJGOUx2RTZrS0piMno3ZGY4?=
 =?utf-8?B?ckFHQWZ1Y2RTek03eVF3MDZNeTY3NzBHdWIvQkNyVzFoZ2JEOVNWWHdhUmZp?=
 =?utf-8?B?OWJtZjU4NUMwaXZJSFZwb3VCME5MZXVYMG10RUxjaml4Z3JXNjdCWkw5SWZL?=
 =?utf-8?B?RXFJdHpQZHY5QlJUNzhrR2JYNUt1NlQ2UnNBU0UwSGhVRlV6enJSc3BNZ21D?=
 =?utf-8?B?bnl1WVUwYTJ5NEJJSUpnNHBhVkxQdjN3NjJzVGxEV080UzRPcGZtNDZoMkN5?=
 =?utf-8?B?dnBwL01ZVVJWSXo3T2phSGh6SE9EMmY1ZktiTkNMeTB5aXdEem1adlBTTkxp?=
 =?utf-8?B?d1F6RnVWc2FBcVI4Rk4wNXI5aXNwNlBDL3k4N1RhUHhaWE9vQ0xGcE1vU1pB?=
 =?utf-8?B?Z3NVYXIvamtscnEyZ0FoV0RyRUVweHEveE92aE44TW9ubWtPZ2RsNXdJUU10?=
 =?utf-8?B?ME1rclg3Q1d5TjFGU3VzS25ucTJ4Zjd2d1lGWWRHOFduL1FzTHdHdVBIbE1a?=
 =?utf-8?B?YW4vTWxMU1dMeHNrVGxCeWNKMlRqcE9meEFFUkZ5aXl4ck0rTzM0ZHo4V3hM?=
 =?utf-8?B?eTU4dHlFczdVRmpnaVFiUk5IOXgySWVDbXdRZzFLM21QeTFzWFh4VFZJcTdq?=
 =?utf-8?B?NjdTZ0FvcXhOTWppNzJmWkpaWkdiR29DOUloZEI0MU1lWitjWis0TWJGb1Rj?=
 =?utf-8?B?SU9vUDN4c2N3WkFqaTUyWlN6TDE1Vk1oSjh5d2lCditDUjhoVmFPTXhMUnlw?=
 =?utf-8?B?L21jWDdtd1pqM0pYdjcvV2laSFNhZTgyenlqRXBDaExnMFA4VFFLNGgxTVho?=
 =?utf-8?B?cmlKNTV2YUNmVElBRkc2RUtPbWlRNlBIdzFVUytCeXlRL250eWhpK0h0blhB?=
 =?utf-8?B?ekNFVUl3NmF0T3Q1Zk5SQzRKSDNMM0VQTW8zZlB4KzNFZDUzWC9iVHhLb0pN?=
 =?utf-8?B?N0NVYWV2UExxTjQrZVp6c0tEWGlBdTFnTkZobklaL2NNYkpzSXA3VjZaZGw4?=
 =?utf-8?B?dXQ2bHN0L1BBeHRVSXpVMERDSFQzNWE4RmxUM2pBYkludU9DYTBYc0cyc3RE?=
 =?utf-8?B?SmdOYitpcjlqTVdsa05KMnY2VkttcERWQ01ob2RBL3dtdEliakxHVm1vYTRJ?=
 =?utf-8?B?clhTamZLbnYwYVJhbEMxNmtUK25jVFlGZGVzVVJIWG5oR3FOL1RsbzcweFB6?=
 =?utf-8?B?WUFkZWJaS3NVcVhJTTBPV05idXMvWStEN2RiMStBWDJ4ZHQrVnptSktTU1Nk?=
 =?utf-8?B?S0V4eWdCL1gxREtpVWNha3lKQ1Z2VDBVd3pYRmJscmh3RFNJTW1SeGNFZlFp?=
 =?utf-8?Q?wrqM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXJDU2hlYkNTdk11QUFUSGpRRHJWaVRSWUpWN1NyblpNa052R3NGdlBIWmR1?=
 =?utf-8?B?R1FUQmJNNzhYOWhGZ1VLRDgwZVJCbWJBalZSRmM1alRWZzNiZC9SNk82Y2hB?=
 =?utf-8?B?VW1YY1dMVUpjTjlMekV0WktzWFNndFpDWFpvNlNjei85dzd6anVtM2xsU0pi?=
 =?utf-8?B?Wkd5REVlYkY1SHRTZDBQYUd1bE5qMk5OR21SZTZuK0pmMkEvdk5lNzZ1elY2?=
 =?utf-8?B?SVRBTTJvYi9OajhTZkp5R3F6ZVhZbmZzZnF5aHhGT0wrVWt4Zm5rQTJCVWxK?=
 =?utf-8?B?YXBHd0FzN2x5ZmJPd3dsRTZrQUFldWNzY0x5OFlnVHorLzFmcUM2RXVSNXQ5?=
 =?utf-8?B?Y1l5cjVjdjNaNTBjRHE2L3kxWTh5TjErZFQvd00yV1laTmJaUWhwRzhkYldB?=
 =?utf-8?B?OUFQTi9kbHFiZk1UZlZTRmt2NWRRQWRzNTA3K0lYei9HRmxpa0k3K2pqWEd4?=
 =?utf-8?B?dURsUUZKcUgzZy9kQVB0QWdsQndmc1VSMlpBeisxS04zd3RRL054ZVFGSk1K?=
 =?utf-8?B?cHl2VHpxS3RHdHg3bFpPdFN3SWd2czM2bXhQMmM2OGxCSDVMeU5sWHl2UjBp?=
 =?utf-8?B?Z0ZDcmtWZ0Y5WnhZZyt1dGVtbEFHbjVobjZJaFVMR3A2RzZHUUtCbG9RdGpE?=
 =?utf-8?B?STJ2WFZWYUoxVFI2NGVkZXQ5a0dYczA0V1JKNitZZEtMSU14cWlyZmZ2cU9G?=
 =?utf-8?B?SkpuRTh5TVRieU1BTVJ0S0E3SXcwSGNTR1VUUXgzaFNWbzdKWE1nL2o1bjky?=
 =?utf-8?B?VTA4bEhQM3ZuaHZsTnRvdTI3NlBqZ09yTHlVcnNiK2FhN3VYMDRUck1QWVRV?=
 =?utf-8?B?eEVuaVJXeVNrTjlkSWNaWGtyWHhES1RpZmVFTlRJNHUwd1NVSTV2WmZwcHN4?=
 =?utf-8?B?MU5tS2NkSkVyZkJhbjRmV1hnM0JHaGg5TlpXRWJkQzYwY0k2SUwxQnR5QmJk?=
 =?utf-8?B?WjgvKzE5cTVZOXg2N1ZlYTcrWUd5T0wvK2RPZzlsQ2lOWW9kL05HUzI5Mitk?=
 =?utf-8?B?VWxSSzJTSEw5YTdjZkhTRTlJb1o5UmszS2xMWkhLbnlKUGg2OWVkNm4yaWkw?=
 =?utf-8?B?cnVRVGlwMjVvN2ZXTG9hNyt0UDZwZGZwdFFvM2xaOFNTSFZVQUUxUllObGgr?=
 =?utf-8?B?eW1tREFPSTBJcXY1MVZTd0sreUprWDdMb04xWDVNU2dXcWlERUFxaGJQMjEz?=
 =?utf-8?B?ZmxYdkw0NDBaVDJ2d0h6dHdxNFdwMExCbDR4bHBRbERaWEgxT2FnV3ZrNUhp?=
 =?utf-8?B?d0YvTi9aYTVoSm1WUGg4MXBmN1ptZ2JPVVBrMVBES0tSQjlzSjRxSkcvU3Zw?=
 =?utf-8?B?WlRnNGFwcWgrRkFNNE9wcG5wbVhhWEZ6MXhUczMwSmNEcHE3bVc4WnB6M1JY?=
 =?utf-8?B?MGJwRU1qUkg5K2RzaVFocnFjRkdNTHJFNWJ5QWhxY2h5OWN1NkpONHZ3ZkJJ?=
 =?utf-8?B?b3RyZjB5NlRQdm5NOWdJT2Excmt4cVNGQmRjRGlOTXoweWhPTXpVRmxvRzRu?=
 =?utf-8?B?VzFoRmFzRUpuSWE1Q1ZJckFxUWUwVlRrNFVwaGhrRXNtaHhGOHpYU2dlZk4y?=
 =?utf-8?B?eEppSWlQZDVmOVJXL3hFRXg0RUJVRWxtMDVQWUZSU2M4VnJFQjFJUTk1aXlu?=
 =?utf-8?B?dDdsamVTNkRsay8xd3o4MkdLOUJNZTdWeUtvQi8xbUljcXRQTGZ1Y1dvc2hy?=
 =?utf-8?B?MUpJSHQwSGxwOFI3aUl6bTd6dml4T0FtU0V0VDhpRlFhNkxKWmdoMDFuL2hM?=
 =?utf-8?B?NmJTSXl3SVgzeVZtR2hVeThDMHZkeWdjbU9CN0ZYWXY3ZFkxR3hYYVNHbTZj?=
 =?utf-8?B?L01qS0pRaEhEaXY2aE0xWk1LdFFWTnVaZDhIUGY2bVdlUmJuYjNRUU1xakRM?=
 =?utf-8?B?amNleDYzY3BIQUYzMDBxZlptdi9ZWXJXVXBkNllGaWRGQnZjMlRiT3JPUGtO?=
 =?utf-8?B?V21UdVRvOUJGTHdMeXpFZ2dubVRMSGF4aUN2KzJCSllTY3FBZmpsRzB5V3Rz?=
 =?utf-8?B?bktVLzVqTTZOaWQ1TFdieklKV2pmOUlMaDBBaGFyN2Z4U1pScWFUQUQ1cGQ4?=
 =?utf-8?B?S0kzSjhnQXlLRU5DWHZZN1NXc29qSkk1VmhLeEtQNGVmbEhCbnI5ZDVtV2k4?=
 =?utf-8?B?ZEo0R25IcGdFVDBJZ0QyRkVpNHNqS3B5ZmZvZG5FNzZBd3VWbkVla2dQTW9U?=
 =?utf-8?B?VXVqa3psRTNiTFRWc3RZTFdDYWxJU08rL1RYUTRmSzA2YUtXK2tpWWZ1UCt6?=
 =?utf-8?B?Y09GRk5uQzFsbnNIc3E5SFk0Zk5YZElUblVSY3YzS2dGTHB3SE9JQ2NhVmJW?=
 =?utf-8?B?YklOTTZWZ0pvOVBXMjhWOW9vOVhVS0txbG4xOVVxWm52bzFxS3ZuZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eca007d-3f48-4712-061b-08de572dda21
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 07:39:17.8762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMT7x+p/Q7H8wRHrsRaVZ3UXPIe+sdjpvBHf7bnxYJg6pz4xlYVossYZ+jdW3dlvBXBf0qDio+vu/6iAHgrU5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3323
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_233936_012481_EF929C60 
X-CRM114-Status: GOOD (  15.22  )
X-Mailman-Approved-At: Wed, 11 Mar 2026 15:01:57 -0700
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
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

--832332920799933071768808354328258
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE



On Mon, 19 Jan 2026, Adrian Hunter wrote:

> On 19/01/2026 08:31, David Nystr=C3=B6m wrote:
>>
>>
>> On Fri, 16 Jan 2026, Adrian Hunter wrote:
>>
>>> Add system suspend callbacks.=C2=A0 Implement them by forcing runtime P=
M.
>>> Consequently bail out if Runtime PM is not allowed.
>>>
>>> On resume from System Suspend (suspend to RAM), rerun Dynamic Address
>>> Assignment to restore addresses for devices that may have lost power.
>>>
>>> On resume from System Hibernation (suspend to disk), use the new
>>> i3c_master_restore_daa() helper which additionally handles the case whe=
re
>>> devices are assigned different dynamic addresses after a hibernation bo=
ot.
>>
>> Why do you make this distinction ?
>> RSTDAA+DAA during boot is motivated by that uboot might have assigned ad=
dresses.
>> Why would we need to behave differently in suspend and suspend-to-disk?
>
> Because, in the case of suspend-to-disk, there is a complete
> boot process in between.
>
>> Its fair to assume that I3C devices might have been powered off in suspe=
nd too, right ?
>
> Hibernation is quite different.  Briefly:
>
> Entry
> 	ops->freeze
> 	create image
> 	ops->thaw
> 	write image
> 	ops->poweroff
>
> Exit
> 	boot			<- address assignment not guaranteed to be the same as previous b=
oot
> 	ops->freeze
> 	restore image
> 	ops->restore		<- deal with I3C devices that may have different addresses

OK, so bootloader might have messed things up for us again.
Thanks for elaborating.

>>
>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>> ---
>>> drivers/i3c/master/mipi-i3c-hci/core.c | 53 ++++++++++++++++++++++++++
>>> 1 file changed, 53 insertions(+)
>>>
>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/maste=
r/mipi-i3c-hci/core.c
>>> index 02c5a133e329..b972d8bc81e6 100644
>>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>>> @@ -769,6 +769,53 @@ static int i3c_hci_runtime_resume(struct device *d=
ev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0return 0;
>>> }
>>>
>>> +static int i3c_hci_suspend(struct device *dev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct i3c_hci *hci =3D dev_get_drvdata(dev);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!(hci->quirks & HCI_QUIRK_RPM_ALLOWED))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return pm_runtime_force_suspend(dev);
>>> +}
>>> +
>>> +static int i3c_hci_resume_common(struct device *dev, bool restore)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct i3c_hci *hci =3D dev_get_drvdata(dev);
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!(hci->quirks & HCI_QUIRK_RPM_ALLOWED))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D pm_runtime_force_resume(dev);
>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (restore)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D i3c_master_restore_=
daa(&hci->master);
>>> +=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D i3c_master_do_daa(&=
hci->master);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Dynamic Addre=
ss Assignment failed on resume, error %d\n", ret);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * I3C devices may have retained their dynamic=
 address anyway. Do not
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * fail the resume because of DAA error.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>> +static int i3c_hci_resume(struct device *dev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return i3c_hci_resume_common(dev, false);
>>> +}
>>> +
>>> +static int i3c_hci_restore(struct device *dev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return i3c_hci_resume_common(dev, true);
>>> +}
>>> +
>>> #define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
>>>
>>> static void i3c_hci_rpm_enable(struct device *dev)
>>> @@ -945,6 +992,12 @@ static const struct platform_device_id i3c_hci_dri=
ver_ids[] =3D {
>>> MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
>>>
>>> static const struct dev_pm_ops i3c_hci_pm_ops =3D {
>>> +=C2=A0=C2=A0=C2=A0 .suspend=C2=A0 =3D pm_sleep_ptr(i3c_hci_suspend),
>>> +=C2=A0=C2=A0=C2=A0 .resume=C2=A0=C2=A0 =3D pm_sleep_ptr(i3c_hci_resume=
),
>>> +=C2=A0=C2=A0=C2=A0 .freeze=C2=A0=C2=A0 =3D pm_sleep_ptr(i3c_hci_suspen=
d),
>>> +=C2=A0=C2=A0=C2=A0 .thaw=C2=A0=C2=A0=C2=A0=C2=A0 =3D pm_sleep_ptr(i3c_=
hci_resume),
>>> +=C2=A0=C2=A0=C2=A0 .poweroff =3D pm_sleep_ptr(i3c_hci_suspend),
>>> +=C2=A0=C2=A0=C2=A0 .restore=C2=A0 =3D pm_sleep_ptr(i3c_hci_restore),
>>> =C2=A0=C2=A0=C2=A0=C2=A0RUNTIME_PM_OPS(i3c_hci_runtime_suspend, i3c_hci=
_runtime_resume, NULL)
>>> };
>>>
>>> --=C2=A0
>>> 2.51.0
>>>
>>>
>>> --=C2=A0
>>> linux-i3c mailing list
>>> linux-i3c@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
>>>
>
>
> --=20
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
>=

--832332920799933071768808354328258
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--832332920799933071768808354328258--

