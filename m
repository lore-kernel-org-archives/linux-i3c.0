Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2E9C83F1A
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Jul 2025 20:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPIR1TTEms/yNCy8CwyzM5l1JB2LyWGlUX2GKmI3ydQ=; b=P5Tr9qfrB4/kdr
	l1E2Q6WL0uXRzp8tcU66OWmcY166cRHFmeQqaDEILXgJ2Sj0TvziugXt63I1LFAAsN1G8A6CY9wAI
	G6T72S/KyWu0UIniiiSHfaagfwAsmt79FbieILTf+suVb/abMTolq19/A6FgSwv0e44Z0ApswBR63
	VkeNl8qGi8HYg9ejn8Szxx4QYGDS5sW24eL/FcT762rBHZAAvS8ay/aFvJcdmSZq1bgCMcHzbeG5R
	O093pJGfuN+TOvGH78gBCPAZKLFbG5gk7EXxDbD+1+8xdPxTsI6d9R+F/guZfYwgwA+eEB8ywylaP
	ifutFUZ4R7Wrmbfl8Izw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxY0-00000000g9i-3Vdi;
	Mon, 21 Jul 2025 20:55:44 +0000
Received: from mail-dm6nam12on20717.outbound.protection.outlook.com ([2a01:111:f403:2417::717] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxLx-00000000ez2-0Wvh;
	Mon, 21 Jul 2025 20:43:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpAbw7JZqVlWBfAUb8DcGZVK+rN8ezCl5DZhhJBppqajDtR2ur2VDoy0NyUc4WhW7Wi3l6SEK78gWSEoyCO3F09nHCVXf/rRLwXTC0vniReqixkt5qeAok0quSts/BlwYFiibi6e0ccxVV50cjti44gu4pBjbtZXPixD2IUG2+UTiSThSIR80fzSX7YLJixqv8a1JWqVUVIaOzg3vDX9FsF3r/zRNiNVLsYWzX9fRcfdJYNt/BzGK+ewUelBH8WHCuCJl2zd247grsO9ij1KDvGm5BYb8d9GnaK3z/XRJfjqnjFAr8f61O7+obi3lxGOR6qxHDk6BV5k5FqqD6svdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RX1xT3UnCvENAlJ0ozopRsTMs3wyVjRWTtKAJlb6MD0=;
 b=r2u2sEze3F561Pu3lYHQ/mj+eiNptwZXI19Vs4iw7OrxcgZ2JnO43QFpVSshKjiipZxgPdijaQTQCA7fCrCH6oHSKDWBSj/PFEkTGJPxIf2GJaBjrn7NCXizrwCKSB44u5jtD3IvuNlOlCpIHItCFtg8vUp+NUlnrhyVvR/IdypuXmU82BdO+FQspAF68g61zmXjpCjRS4CgCMDZodvk1N3LegWkJUaNMiSX0P21yLgj3HNHH4b+hKwD5jEJLgswkSHRvG0Vjz/TVTfZ/LjZ3tnzgIRosyi/zdIK4A7aqmh0+bHk9yAtQhIQT6k8DBfDIcrd1YDHbvq6dltNnxXfdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RX1xT3UnCvENAlJ0ozopRsTMs3wyVjRWTtKAJlb6MD0=;
 b=r4VmKzHdGL9qAk/xEepLACfYRZhUOzGqbCfb8fckmuFlKmJnOtgcEhWhltG1X16W+hTfVhr+0aWGRuNupIDERne9ihEJWqB7MjK3GD1h372Nhk8fKdkDLA4j0ZIDf6l9WkMWBzEJcBPcX8RY37mdthHdBfcOP0FPooWKaonO51R+xVo9hUWXEILOtEDCJNl/yyUW/yfgyQYrQsxKAAJuSpt+EXoLRzWDOLK5K4hOZ9ImYcsxovMNn+h8bRfacjKIREc0nnDWGdO5/VuqCTZsd0F2n0QJWtZ+uMLLA0KbAmYR7hxe6w3cxXsjSuXd2QTrcjjNCa8sUGmGSurxWY8Xjw==
Received: from DM3PPFA3B1D0F56.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::6bd) by CO1PR18MB4747.namprd18.prod.outlook.com
 (2603:10b6:303:ea::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 20:43:05 +0000
Received: from DM3PPFA3B1D0F56.namprd18.prod.outlook.com
 ([fe80::8562:c877:9e70:3493]) by DM3PPFA3B1D0F56.namprd18.prod.outlook.com
 ([fe80::8562:c877:9e70:3493%4]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 20:43:04 +0000
From: Harshit Shah <hshah@axiado.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jan
 Kotas <jank@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>,
	=?utf-8?B?UHJ6ZW15c8WCYXcgR2Fq?= <pgaj@cadence.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	"'bbrezillon@kernel.org'" <bbrezillon@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Thread-Topic: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Thread-Index: AQHb7Ec2EpmYZb1fLEiBSh0CfO/MD7Q3Ee0AgABr+YCAAT0bgIACSq8AgAG6FYCAAGfHgA==
Date: Mon, 21 Jul 2025 20:43:04 +0000
Message-ID: <912dd9f9-34d9-4631-82d3-02eed03a52c9@axiado.com>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
 <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
 <e461e5ed-f512-4d3b-9903-8092dab7f81d@linaro.org>
 <06f00d05-b8ca-41fa-9e5e-9cee3cfcfae1@axiado.com>
 <7ddb77bf-173a-4117-80ac-d0f32bf067ee@linaro.org>
 <4f836d88-80a7-402b-9af0-f0d002e2145d@app.fastmail.com>
In-Reply-To: <4f836d88-80a7-402b-9af0-f0d002e2145d@app.fastmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPFA3B1D0F56:EE_|CO1PR18MB4747:EE_
x-ms-office365-filtering-correlation-id: f5bffed2-979e-41bc-4d2d-08ddc8973136
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d1ZHbS9xcUJjSmRLYlkyZmFZZFVnT2FmTWVhM3ErZlNNcXg2eDVodnNhb0Zr?=
 =?utf-8?B?NlV6djY0YWljdENCa2tyL1B0ZGZHVnp2OFRSSWJIZWhQeDlmN3lPTnBQaERE?=
 =?utf-8?B?YU91U2lDcVQxQk0ySlg0Tmo2OFprVnNhZzZEWXBtR0tmYXZVNVlTaDBadzJP?=
 =?utf-8?B?b0szZ3BWcXpndzJVd3RsbVR6UWJCbTlnSWdtUXNNTDJTWTVyY0Z1ZUZMN1I2?=
 =?utf-8?B?Qm8vSlYvZk1wTHV5Y2NyZUxLYkgrOW1DWmZnK0lKd2R1dDhGb1hwZ284RVRE?=
 =?utf-8?B?M3ZJeTV5T2RZamw5aGFQUVRuUld5elJjU0JpcW53RXAvcUxyT0s3bjR3YkY1?=
 =?utf-8?B?QkUraS8rSHdLdlV0YURzc1RsY1p2RzA1clk1RHllRmQwNUZLMFFlU1VFV3B6?=
 =?utf-8?B?QzdwUHFMSGowanAvN2R0RGRxcE42UEpPSXBIcVd3RStaMllUZHhhYWtIZTVm?=
 =?utf-8?B?OGJhRGJINW9YaXBWRVBiVG5HcVJYdEExUDJDdXY1MGNuRzY1Ym1GNU1JZ2RG?=
 =?utf-8?B?WDZkUkYxQjBUejF3WXIwUnpUMVhlc0hxR3NJRCt6K1h6SERrVDZDanhQWEZU?=
 =?utf-8?B?cG9ZWWdCNWh1RDZ5bFFYdlZVb1JialU0aG5XN1RycklkUjdhUUFLS3ZJSTJ4?=
 =?utf-8?B?OWxKVDVibytTb1lnby81UjVkajIyeEhobGNHL1ZVa0RXZ2FyQ0l3SUNsdkRZ?=
 =?utf-8?B?VHVrbGJpRmc3MFVtSDNibVBEYUJ6bG1wN0ZpWDhIWS9nRkZYSU5OazVmaDlU?=
 =?utf-8?B?TzgvMUlEemZleVl5SmRZREovZWgrdWExTmRlMU0xZVpzaENrRUpqeXVycE50?=
 =?utf-8?B?c2V0OFBoaXo0NzNWdUJ2SWVUeGZNVUJ6NXp3TzJQMVg4QTJwOVRJaTc4SklW?=
 =?utf-8?B?UXdJTkYvaFpucm1QWFNmenFBQmRXQW9jZTFkSk1GenVYdlNPRzJpUUxqMFNG?=
 =?utf-8?B?RFd1OVZ3VWtBeWZKd0FNQkZhZm5HQ0NSWU1uREZaSFZUYklqU0x6MXNGTXhz?=
 =?utf-8?B?Y0h1M0syNEc5K3lDUUdNaU9YWXpyZDNPZFNLb09PU210K1M1ci9PRTBQQWpO?=
 =?utf-8?B?dm8vU1NyaUpGM3lJMFQwSUFFODcwWFdiR3RiRW5MbmdBcVdaWnhaOERTb05q?=
 =?utf-8?B?VjFYbHRkVGdBQmRHMURGbC93UXJncnBPSC9qL1gzMUh6Zlc2YzBwM3djMEhT?=
 =?utf-8?B?MFljRTU2dEJ2NlV1VklTM1MzVFVIcUdRQVl0cmtzb0RheW84eU56TUNSa0FP?=
 =?utf-8?B?S01ibmR5V2xZMlhwL1hXbGtmOVVnM3F5Qi9pNHgvWTJvODdZRHJMYXFGUE1j?=
 =?utf-8?B?dUZMWS9paWlYUkZIRjlGTVpCV2NDcFBkYWNwbVg3MmpaUXJWQk5QT2Z5TXVh?=
 =?utf-8?B?TTVPS3BXUWhicm0rNytnVHloL3hVc3N0RWE1bmxkMnphTUlscUtRa3Y3Y2U2?=
 =?utf-8?B?WWVnUkRtR1l6dWJaYlhlQjdETzFpQ3JjZjBhU1M2dW51RjRYeEUrQVRMNGtG?=
 =?utf-8?B?by82TEllY1A0bGo5MGp6bjV5N1BCNHJ1WTZ0NmtnZVdhMUNnV1dGL1RtOW1Q?=
 =?utf-8?B?ejRuaE4vbVNGTW5Cd3hEMllsd0J2SmlaRlJ6NmlzZDRIdmtFYWZZaWVnN3lR?=
 =?utf-8?B?elp1UjVHWUlmVnJEQndUczIyVW0vSXFWcHcvTXpJbklxVFdhWDl4K3B2b0NL?=
 =?utf-8?B?dXc2RU0xWm05SHpLTTAzV0JKaDlHTE1ic0dpNXFzQ2NoMkdmSk5mSmlUTFB6?=
 =?utf-8?B?ZExKUjBJNkQwb0xkL2FBRWdOMXZkWTBYV0x4dUZlSFRBaFB3RkpFdjR1Qklw?=
 =?utf-8?B?UTlVVHNnUXlsbmJBdmwrRXQ0NzI2ekZ5RnNJd2o4bTQvYnkwcWd6MHFVZGV2?=
 =?utf-8?B?QStvcW40Rit3bEJuSVY2RkMxbnN1b1ZBeitRVFhuRmcxOE0vYU1nZklycjQ5?=
 =?utf-8?B?V3hCVVRwd1VxU3NYQnBCL2M1MjRrV3RyRzlnSzBucnIvcWxLa3FYSUtWQ1Jy?=
 =?utf-8?Q?rjR6H8WG41d5U4v89Lrse5YO20HWd8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPFA3B1D0F56.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NElJSXBQNjFHT2JNeEhQM002QlhLNUpPK0cxaGxhTEZIdGM4SEFZb0VHTlVV?=
 =?utf-8?B?NlhWRDAyYXNLNC9vVkRuSXltYWE4bmI1TTlPV2VNcXBydzVKcTRXMnFINFp0?=
 =?utf-8?B?RG5tTU9GbzNrK3NiVjJLVFpSZ0x1Szg2Rm56TDZKdjh4MFNsQjIxQ3g0SkVr?=
 =?utf-8?B?NzcvK0NUaS95THBwaUVONGJGWTBZV2dRSFlBSUw2ZUF4Y1V1UktBQWhTa3o3?=
 =?utf-8?B?ZmhIeUdKYlRKbEVVcGplMnVBSStxRTV5L0JKbWMzbmx1ZWdCekM0WThyeFpO?=
 =?utf-8?B?eFRlRjNNeUhOdEE4TUFmbW1MUFRPbktqZzNKUVZwd01wcStVK1JRbVFNNDZW?=
 =?utf-8?B?YzZETzFYTTZnOWVIZ2hTMmJpOVFOWG1XeEdxL0pFUzhQTnJhaFZTTStDY1JC?=
 =?utf-8?B?a2RyN1MyQ0F3Qk1LV1FieTBUMDF1U0VRM21INkYxcGFja2p3UzdxNEV3TXg4?=
 =?utf-8?B?ZUNXZW1TVnMxc05rOGhWTmh1a3Zmci9CNWtxa05DSTZoQVd3REVjTHZvbzMz?=
 =?utf-8?B?VFI0cks0bGlVT0NlcWxqeDRtTHdIS0w0bFFkU1JkejFJYmlZWVBjODN1eFNy?=
 =?utf-8?B?cklrdVBRSzh6ZEF6NUNNWEU2U2g2SlNyU3V4cnozMk1CZGtNcXZvMVRDMitE?=
 =?utf-8?B?RE5JeDUxNnlYNm9lMi9weC9PL283SlFETzArWk1JQzhYNWdtWkgyT05YMG1z?=
 =?utf-8?B?eFZZMmFaNWZLQ0l2emJkSVBwUEVOcktMQjUwbkcyNE9wS3liMC9pSXlqRGtB?=
 =?utf-8?B?Rlp5dkRoR204TkpQMyt2QWlrYlFzWVZBdVZzRFhXeDRYcENOTlNPYWVWSzdK?=
 =?utf-8?B?a2lBMUZueDUvdHc3V1ptQlFTS1Z5U1cvdDFkeG9HNXQ1eDdlZ2M5bE5pRDRO?=
 =?utf-8?B?SUZ3UTZSMm4yeVc1QU8wUTZZNkM3NnppMUlRRTJueEpCK3JWM21nWUNjcGlW?=
 =?utf-8?B?UEhDaTBXWXVXZmthVEFoaUlPWXZGekl3TzVkWG1hMnRsNTVmcGZoWDRzT1BE?=
 =?utf-8?B?eFJpY1Uwd2NQKzU0M2w2bkVUNnhCb2UzRlMzQ0hlakxEVEVMS1FKcEFNSjVI?=
 =?utf-8?B?RU90T3pOUCtLdm5BQlJTaEppbGJlcEVDcXIwUzlCUUZNTTVIZVFoVk1zWlRh?=
 =?utf-8?B?MmhMcnllbExUdDFaalJ4VTRXaVFRZVcwWGFsSkdFMWNEUGtaeDBGd0duOUV1?=
 =?utf-8?B?bVJWbEZQREhER3l4Y3ExbTcvTFE1MzhseE40Ly9La0Y3ZThvdCs2R29nc1ZD?=
 =?utf-8?B?aUl1Ym1HemdCa3BCaG5DOE5nZ2VvTXVyRjFZbnlGRlJadEZXUVF1d1gyZnJj?=
 =?utf-8?B?UC9zU1dMczR4VTQycThUN0RzVExldGYxR3A2TGtTNmkzWlpRSHl1NllXejQx?=
 =?utf-8?B?SHYrbVJjaXgyRE1hdWxGS1czMjVXWldaaWk5QmhsTFBHS0l4WUVBV1ZiazRM?=
 =?utf-8?B?UWxZbFA0VDh4RTRBa211NGVJakliTDRydlBwcExvSDNRSlRDYi96R0FzSDZL?=
 =?utf-8?B?M1BYNjlKazlBbENjVWc3eVVkL3Z3RWxyeDdWL1M3eDYrRFFZeHVMT0cvZnR3?=
 =?utf-8?B?Ynd3UzVGeEdsNGUveTI2SmdVSzVCRStnMVVTcnp6SnJuZDNxcDJoTTg5Q3JC?=
 =?utf-8?B?VGk5RXA3ZXR6R0Z6OVlDNC9YQzF5VGMybUVvRGJPNXpxQWN6YnA0VWh2cnNm?=
 =?utf-8?B?aUZLQ2NqcXFsblN5aTc5VEpMRWllMTVsUkowVVZxaE9veXZZbzJCMTFmUmNn?=
 =?utf-8?B?RHAvU09DUGVpVlhiMGhzUHhrb0Y4Sy9wcGpCMFNZdmQvcDdCNDc4YUlETzN1?=
 =?utf-8?B?NkxyNjZqdVI1eVpBTjVrOWloeG9BRmIraGRxcG9XZnV3bjdseWJCRGg4cFdU?=
 =?utf-8?B?bWY3Z3RmRm44bDZZSkdSbGR5MXFOcFNSd1FYakx5Um5ia3dkVkZwZWdrbHJJ?=
 =?utf-8?B?RXhFNDRCcHpzU2dMMzRVcWtDM09zNndRM29sRE9oOVpQMlVkTERmb0ZqQTRW?=
 =?utf-8?B?QTZXbHI3S0w5YmVPSTdyejBKWmFid2p4cXp1UUI4V1ZEUklBUkJqSlB5Sk9S?=
 =?utf-8?B?UjFSR3lrbFJGSng1T21xeVlzTVdGeGVpWVAxaEJuVDdmTDljVmMxZ1MzUzh3?=
 =?utf-8?Q?NYiU=3D?=
Content-ID: <2BFA62623BC20C438B41C6941CE60E12@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPFA3B1D0F56.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bffed2-979e-41bc-4d2d-08ddc8973136
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 20:43:04.7173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQORp/JWq8lqgcPZJ2Fm4bWKh73mpb0F6SMf+Qn9I3ZlEEKvfImKcadtIl5hCJfOym/FXz/0lwSn9N/G+Tcizw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR18MB4747
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_134317_182575_61AB9154 
X-CRM114-Status: UNSURE (   9.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 7/21/2025 7:31 AM, Arnd Bergmann wrote:
>> Separate patches (1) tend to work better for the first contribution
>> from a new maintainer, since there is less to know in advance.
>>
Thank you very much Krzysztof and Arnd.

I will submit the patches to soc@kernel.org.


Regards,

Harshit.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
