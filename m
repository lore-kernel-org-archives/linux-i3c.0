Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24044CD98F2
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jun 2026 19:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5m9NYQZrUTpDVdDY6GhFTSh4TlHO7ygVF3AsQmZuqUE=; b=VqHx8xrTWMh3xG
	1HSI3qZk3csBAveNCBxdgxZbvmoQkG0K8zWnaHxLsege0H+hy66QuZ5cKabP2Wd4A3aF+3KrOR0zP
	hXVYB7Qbh+0bKNw2ee2A2nCPeI6f9vqFTweQCxp8a2QcH6XcNcQukMiP2RUrwOag8h4p0UP/t9Sso
	CHcIWbec6efgObVuQSkSHXbn6fZiKNjEDLBVSDSCAP1VuzG/x5wg1jQ9DFPzRYuQnfdfvT0apeo9J
	M3NrfoEiGWbnL4n7wtdJ/lb8G4OkVv5ikrTfd/7zHPDLqcBI4XgVhjWWsNtgUbnsobF00Rek+C3Bo
	XBje3dPUF14SgTgAzL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waeXw-00000002u86-24QR;
	Fri, 19 Jun 2026 19:06:32 +0000
Received: from mail-swedencentralazon11013070.outbound.protection.outlook.com ([52.101.83.70] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waeXt-00000002u7i-3vMk
	for linux-i3c@lists.infradead.org;
	Fri, 19 Jun 2026 19:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBgfQ3TTv+4czxsUqmPdfBqvsqDh54YGsgJcThdJtLUOFzDO77dOM1Jd23ft4IRJ6lKEOVYIpoecBcAb2tfkCaAKuWSPLWw1vHYd9gTQk2s0/+5CneldRk9xHjiyugwoMrJqpL9ZGejGg3OzxOcXxKktmwqS4Xs2MM2pFNZmDseThRZGJdF7iYhACNt5NH0P27Z9ZdONL08nTB6nZfzc44CoQoNMLctK6LatCXNUtlRBmGBo3drVwm7hzCoHjkkoLqqhsmKLff1SuiqNMJUFohaJisBuQwKL8Mw4QWQehezphehlvhMGX8x7vUZN84IxuH7UejfPc0jKRyoQkBIygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sfwQaHhDellaYo7F25j79XaZzvxTBORj8e1vwrheO0=;
 b=xNc99lLE9dIg5DJTOADZtJiMg14B4PnAY0vKG/8lxhU2Q5tm75MvTFeU0yH5Lib1X4Ll+t650CaYfCGvAdIvFg72xFd5ARSqn+LhXXqFxlmrcKFdpxMDC9dzEqq5AvCRgl1iqhmtLpyX9jSSlvOmvs6E79gpu0vitX9DxJqDfesMWR6VLNbn4s+QOSwc+ASN1nVF7PwuPIofmsOBU+8Cfh2fvjNNSbbXk9imUTFp1I2Kq5rNtxlGFdW3otPuzF8/ohDD4jYDpJxrPz2XliYtmgLBDwRCLfI2i1GpSlZJbkj0hErHzx33m6aiM0oRnuYD8fziIkKlrr2fE8zVb+DrnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sfwQaHhDellaYo7F25j79XaZzvxTBORj8e1vwrheO0=;
 b=DpXY6GmFrNTrZQHKehKPqmfuzQNtxonNcsD7Y1knUZVfXUaS5VOZacMQ/DnAKBCQgqi9DuPDirscpAXf/qySsOp1C+tBYEU35z1oCmZ1ZoNSE6VFu+W1kkDniZOCay2K4OPS55tY0J2ugqTmPyFjOPJqrKSSjEEO62TqMEJyC5TJqI4XLrnnX5UC+YtuPtq1MEibKBPuBSjzGx5VUsdiO7XGhY27iLGMzyXpKv6j4A8QoaGuUWXKimjcF5d701IY558DDXtBvc1OeNwxIegTNBJnuxObfPR1GHArtSc/BGOKjpcg5KCMV6FfQGlCUrzTx7lmeuPqxaGgPBUfoRrnUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB9521.eurprd04.prod.outlook.com (2603:10a6:10:2f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 19:06:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:06:22 +0000
Date: Fri, 19 Jun 2026 15:06:15 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jm =?utf-8?B?TGlhbyjlu5blu7rpipgp?= <Jm_Liao@asmedia.com.tw>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Yd =?utf-8?B?VHNlbmco5pu+6KOV6YGUKQ==?= <Yd_Tseng@asmedia.com.tw>,
	Patrick =?utf-8?B?WWVuKOmWu+aGsuW7tyk=?= <Patrick_Yen@asmedia.com.tw>
Subject: Re: [PATCH 0/4] i3c: mipi-i3c-hci: Add support for ASMT I3C
 controller
Message-ID: <ajWTJz4oIDU5dIiC@lizhi-Precision-Tower-5810>
References: <f43667a6eff54729a06aed3c23877c01@asmedia.com.tw>
Content-Disposition: inline
In-Reply-To: <f43667a6eff54729a06aed3c23877c01@asmedia.com.tw>
X-ClientProxiedBy: PH7PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:510:324::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB9521:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a939132-49c3-452f-ff71-08dece35da66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|23010399003|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ZBa7m0qfZvzz1/EK2gS8uJU6dJ5SUMYhvivnf+zeHU0i8HS/AliRE8ZVLGEbEL3xvz5jRCLwkOKQAdcJlbVVsyEw+oadp9IdppSjyyXRoCsNzGY6dc2Syi6HUXqGzM0Dsz3C/YRSMN7qsU0HefAkpiSUuKQaJ/JY+DKAeS+ypmuF/1yh3Iqtlko3Q0jMuLPbVK5ytQJfhZmoGEZ2J78pPG/8nl4GZyA5ZKXR48KJDb3GGUqrGP83Rjls7tfw4YsjAwFG9COrE65kIItayhHMILKZVt4+ePWeLVR0S4UNPiUQLTaRdrhmX/aAIg7oqPwfG/22JKlpZgArHugEt90rK47o1PVQd0SBNlmtqbDLcJfA1YkHr+apgM+kuMhEk82pVGlgygLfJAFRrgWvh4J1/GrclsGyzwXETdQEp84P+CoA7UKyU31FJ99IW5cMFi5+elJkiMvhhb1ny4nvGL0PyGDIsY+fRjFNuPBLZVK0XnDLSwh+TQvwFArWwp988vw89ey0Zf4rX82KkkW0mWkvuglvz2bgwem08/s5Z7OcKEav3BxEAg76k4//d3zqydO36lT2VPClI6MqaFU6JbZbjVwcNvzMgpP9pAS7iy2Me4PF+9PKEqGbg4g0GYtyjZInOpQzBsSIG2At/oM3RgEVQH/ce9tgMQoA08SNq0SpbuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(23010399003)(366016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFJsbGNEN1VMSGp3TE50aUdYcExyS1Nkb2E4V1YvOUZ4Z1dnMnpyTExCUUlk?=
 =?utf-8?B?T3JFVnNhUzd6OUhLYVArd3UrazhkN3NFVGh0SjUwVXlqUXVMZXQ1Q3FWdVZO?=
 =?utf-8?B?czVxZWQ3MlRaN1pTcDFqdUVEMW9rUWpLZDcrbGw4VzhqZzYzbWREOVlocGZy?=
 =?utf-8?B?Z0pHZ2ZxUTd0R3phMDRuRGlVdnNnVFBUSHhGcDh3cnhXdTVyMFBpT2wvQlM0?=
 =?utf-8?B?dFI3SlBpUWViWXZSbTc2MERNQzVBd1Ftazk5VFIyL2ovK2hodTh0dm02RUNu?=
 =?utf-8?B?UnhteXMrWW9nMG8vbmhUK2NHK2lxaXVxQjB3SExXWWhOdG9vU1J5S0NWSlJa?=
 =?utf-8?B?NUZLRG9pTFR3YS9KbVNPR1c1bkRqNkZoUlhYY0FISmhXVEdGWDNOdHBTTjFy?=
 =?utf-8?B?NCthNEF6SGphMXdCbmVVdEtpTXJFUEtwWkxud0M5OFE0NTNGc0NFTUFDS0Yx?=
 =?utf-8?B?OElXM09wai9pZlp6VnV4MGduRGFWQlBzM01kcW9oYTZHQkphRytUejV0enY4?=
 =?utf-8?B?QmZRWGxpVDU1b1VySUR6endBbkJvOU50K0t1VFNJOGFjZ3V4ZERISTFXenFm?=
 =?utf-8?B?Zm8vWXFVRnFUYWFDeVVXUHRiSEEwVGsvWTFSemlTeTJhK1kvZDVnOVhVcjVN?=
 =?utf-8?B?UnpTZEhuZnZaaHZYN3Z1MFI5Rk1VTVhUVjNzaGM0MUx4UVNhT0IwTTZOMDFy?=
 =?utf-8?B?bTJGVVhBQ2RwQkZob1FlMUJQZXg5TXFXU3UrOVg2UnJRSHcyT2pIaFB4dWx2?=
 =?utf-8?B?WndWK0VuYVBzSDk5TzFxRkhPTVAvNytucDFXS2hLdWQ3RGJmNk1jRnVCa3RG?=
 =?utf-8?B?T1RqaGpZV1hyRTIyd0lUSkdXelhOQVhiM2hSQ0dMUlBzbkkyU25ZQjRmdnVF?=
 =?utf-8?B?Ky9lTk9wLzFwelFKTWVaSThCYlNYbDdnZE9qdmczbzlVTTJYdlgwM0ZPV0Yw?=
 =?utf-8?B?SlF4aWprNkRTaEM4TU5aK3dlb2xmTlpSRHU4elBoc1BTaFJ6eTd3Qmw4UGJu?=
 =?utf-8?B?WUdIZVdFZEN1OHBrdDRZcEZNbi8yd25YSEVLa2Q0UEZxbjMzVzZHemVWWldE?=
 =?utf-8?B?WElKdm9FekRSakh4Sk9TQ3l6dE5mUVkvRlQ2NERYc1JmaGlMTHlNUFowakpT?=
 =?utf-8?B?R0pjUlU1WHd2YTU1TFByck9KRFJlR2pCSTNPeVpmRjR2WE1QSXlhdExxYzF0?=
 =?utf-8?B?VTJLcHZLbEVSb29SR3BrNXZYeHlWdTc4TDdvdGNxRFVsN3Qxb0RDN0ZuSmZY?=
 =?utf-8?B?M3prMW5uZVF5S29IeVR0UExBcFM3R2NKR3JvWDk1TWR1amdUZ2pEMk11eWF2?=
 =?utf-8?B?M2NxVU9GUVpZM1cvcFFvRElCNkI2NHJCQjM1SW9PUGxsMnJoU1lYcXFuREtt?=
 =?utf-8?B?ZDk1U2VQTG41dGVMelJFM05BNmg5ejk2VC9wU1FKV0FyVW4zbnhxL1VQWjJq?=
 =?utf-8?B?cTkzVW5kL3dFbSs2aWYrV09mRG1WcFpHcWM0TFFSSzMrSHZLSjA0L0E1UzZV?=
 =?utf-8?B?OWFQTFo1YkgxTVI5NzhQdFJuOXZsV2haVC9WTXlHTHkyTjgvTVh2WkhKc3R5?=
 =?utf-8?B?S1JMWFR3bTNxOGVTM2lGd3E1Z3A2MXJjV3AxTHZJYXFQY25iNWdVZlFIbEVt?=
 =?utf-8?B?SEJmUG9EVGpIVCtKb2FvVWg1bHo3cnZnQTFVY3RmUk14UWtBSnJ0Q0tYU0lV?=
 =?utf-8?B?TEVVMitkelZ3NDE5ejFqVjNmeVl1YXZGOWZ0MllPV25Ib1lPVjhBOS9uQW02?=
 =?utf-8?B?RFBpTWF2anRURjFvamFCZjlZcWpCckRlQ3BZTlVQZ0wrMGtpZ0g1UVJYZGkw?=
 =?utf-8?B?c2lQanZqb1lBdDBOY1RCVytCb0FZQ0ZyRVVyMlNua2Z0QkZub3FlWWxnbzF6?=
 =?utf-8?B?SDFSS1BpSkRSN1Y4SkdTVS9QaWM5akpkQzlOMHh4WGxGV29pOE1OTHA1Z3Z3?=
 =?utf-8?B?Mi9KMS9iRU9iNnRURGtCajJ6M0R5T2pCYm9TcERRVFFvYWhmZWEzWnBQU3Fq?=
 =?utf-8?B?UmpnL0lkVUNsWmV2Uy9lR1hhM0x3ZTAwYnVjeUd2QlhhM2xnMnN2Z0hTOXo2?=
 =?utf-8?B?QWVER3k0Z0svcmFSeDkrVWQ2M1ZzV1BuT3FWWVVtbWtMOXdQZ2dCMkxpS3Bx?=
 =?utf-8?B?U3cwbzNYMk54U0hRbm1tNytQZXZjM1UwL1A3MEhlTm9oYWdmc0x3bWhxQjlu?=
 =?utf-8?B?QmVIRnpuc1BTVUEyYzArU21GQWUyUG1SWW1Ca21GZkpzK0t3ai9hSXdtMFNo?=
 =?utf-8?B?WFcvbjlOTWJQOHRncDlkOWxiMFRwSmsyTjZxRmdhN0NnOHVsdUhNNHYveFpk?=
 =?utf-8?B?NVVqWCsrUVU5bkRvZ1FZS0pQbU9uVjlqT3B5bW9UUzhMN0h2MDdVem5HeHBu?=
 =?utf-8?Q?M1S086bVxMLg/4lFc1Kd2XmiifGZeI0UBxIz5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a939132-49c3-452f-ff71-08dece35da66
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:06:22.7521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9u9+y7DGiAGi+5Fnb1KZCMBYuFBvP1K2l37uqIy45r7DrXh/gQ806i6ix5Goyp/1eOPHBvdcO4jaz1uEjzrLsnW/QUk5vBg95ASlrKRqJP8Cdl85z2V3AW+4blRVk+8N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9521
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_120629_990890_B822CA86 
X-CRM114-Status: GOOD (  13.09  )
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

T24gVGh1LCBKdW4gMTgsIDIwMjYgYXQgMTA6MDE6MDVBTSArMDAwMCwgSm0gTGlhbyjlu5blu7rp
ipgpIHdyb3RlOgo+IEhpIEFsZXhhbmRyZSwKPgo+IFBsZWFzZSBmaW5kIGF0dGFjaGVkIHRoZSBw
YXRjaCBzZXJpZXMgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBBU01UIEkzQyBjb250cm9sbGVyLgo+
Cj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgQVNNVCBJM0MgY29udHJvbGxlciwg
aW5jbHVkaW5nIFBJTyBxdWV1ZQo+IG1hbmFnZW1lbnQgZm9yIEhDSSB2MS4yIGFuZCBuZWNlc3Nh
cnkgZml4ZXMgZm9yIElCSSBwcm9jZXNzaW5nLgo+Cj4gVGhpcyBzZXJpZXMgaGFzIGJlZW4gdGVz
dGVkIG9uIG91ciBGUEdBIHZhbGlkYXRpb24gcGxhdGZvcm0uCgp3aHkgc2VuZCBwYXRjaCBhcyBh
dHRhY2htZW50PyBQbGVhc2UgcmVhZApodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVu
dGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCBhbmQKZ2l0IHNlbmRlbWFpbAoK
RnJuYWsKPgo+IEJlc3QgcmVnYXJkcywKPiBKaWFuLU1pbmcgTGlhbwo+ID09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IFRoaXMgZW1haWwg
YW5kIGFueSBhdHRhY2htZW50cyB0byBpdCBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlv
biBhbmQgYXJlIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbCB0
byB3aG9tIGl0Cj4gaXMgYWRkcmVzc2VkLklmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNp
cGllbnQgb3IgcmVjZWl2ZSBpdCBhY2NpZGVudGFsbHksIHBsZWFzZSBpbW1lZGlhdGVseSBub3Rp
ZnkgdGhlIHNlbmRlciBieSBlLW1haWwgYW5kIGRlbGV0ZQo+IHRoZSBtZXNzYWdlIGFuZCBhbnkg
YXR0YWNobWVudHMgZnJvbSB5b3VyIGNvbXB1dGVyIHN5c3RlbSwgYW5kIGRlc3Ryb3kgYWxsIGhh
cmQgY29waWVzLiBJZiBhbnksIHBsZWFzZSBiZSBhZHZpc2VkIHRoYXQgYW55IHVuYXV0aG9yaXpl
ZAo+IGRpc2Nsb3N1cmUsIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBvciBhbnkgYWN0aW9uIHRha2Vu
IG9yIG9taXR0ZWQgaW4gcmVsaWFuY2Ugb24gdGhpcywgaXMgaWxsZWdhbCBhbmQgcHJvaGliaXRl
ZC4gRnVydGhlcm1vcmUsIGFueSB2aWV3cwo+IG9yIG9waW5pb25zIGV4cHJlc3NlZCBhcmUgc29s
ZWx5IHRob3NlIG9mIHRoZSBhdXRob3IgYW5kIGRvIG5vdCByZXByZXNlbnQgdGhvc2Ugb2YgQVNN
ZWRpYSBUZWNobm9sb2d5IEluYy4gVGhhbmsgeW91IGZvciB5b3VyIGNvb3BlcmF0aW9uLgo+ID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoK
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
