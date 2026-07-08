Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D0AC44503
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Jul 2026 07:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3D6yVvm0YHHuWIgw0yd3U+WCQsMIzlVNmrRT2gsplgw=; b=uMMejBjJMQDf1G
	ztKOfGeyAkP7GFWNSDiOLUjQnRUTyaSi6XdUlB9lZFU4XsFaBobXl3c4YZRW8FMOasr18rXxQsnSu
	8p5qEC5QrG/H/2POGEsKg22I1A5k/wofb0Owzb2P4ohb/+JkRWw+jBSOxYbZ2iINpPeGaa4LE+AQC
	fm6RxS9PSpca/6RtAI2LY+YjsFUVFQaXJ5SFAQF6f/RHZCZsjGBDiEoKQdBH9IR2yFqKT11eCXSjg
	GUHeQ8BAfxgzGaWN5shgObSB567UaqiP1QVjVEM5jDyih8tC/vsFK3XvyLNoUMjXvA0CRHS58OXWo
	u3inhmWk/FoM8igF3Sow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMXo-0000000GTvY-25A3;
	Wed, 08 Jul 2026 07:18:08 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMXj-0000000GTqF-1x28
	for linux-i3c@lists.infradead.org;
	Wed, 08 Jul 2026 07:18:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jV9Kf07HrdLa/2V/v/nasQtjzf0AztFJBxflsQS3DSfQqXbfIZtHYuvHboVxJvTMPGnd2waU/Z4CQSbauSuKpBEjf1hIJk4QvwKUt3iM34XtWBSChV7kRQd6P3FhwJbYrq7J+X0UFey+y5A4m7tn5X31YTix7ruAYxIQ73vXtAREbtBtj0KK+UupIoGPokTRhhcLhzOOBMu+JgkDjFCH203dlzVvAzIE3OC1r20xw+e3lgH96GYmfGEjBxSZ9A8qFY3OK6OboR/ML4L8+lQAYJfP1oQzeYaElCcQEZpdq2jR/WboXdwgNI6eI9TQFrxieOBQla50hchmtb7rARR21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieLPdAh140e1Kh6GGuXqlUdtGay08oKb+ADvbyI1jDs=;
 b=bLySLX5m/orwcsljuTJk65akzVQE69D8OVftKqIUZlDRsnE7Rw5r4qo+2bTOktKrIbIBozkUZbX9eDFgh6nwsixlmD4vU+zrwWd8G2maa6zhvsiOuuAEzuDmGmd8aK17a+liWCExZyBFzYHC1iUqCn8+P9J/nBVNtXVwxrbg9cDBQIXL2JOBwuEyaM7hkQwhoqOdKOiYMxLodI+wFxwX2ErHsqvP+zGqed2sTyir2O2fRDRoAd/j8Y1O0iln1LQGjkslbA0gomuibUNgdAFj+nLtnl1SRbBmrAXcwvZ5UXzQUhcid2w8omyRC9Z4IwUziNMx2S+H+AaGErWYkozzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieLPdAh140e1Kh6GGuXqlUdtGay08oKb+ADvbyI1jDs=;
 b=ADljaeBdPqpJldqHrB283HfqY9lhclP1ApgFIySyLF4sZ628udeY44sauSpUaqs5n+869mZNS9Cp4xHQanoMhU+K/bTOHE+Gc1avZBtKzkgxdzweVOtUtQv/D1Wf7PBOsOG9zI1radkXG532jZDZ6JogB3mUXXX5z4VMkQpeLWm79gCVg/HjGhanNTzdHGAGlQCbeJFxZu2UvPnkZkjLFDY9b7W7gdyMcZ+EEyputPPMnJ7Js4W/arC+C74+Bhy9F1vYwmn1b6/PYSpyO9iLwBJ45GS4qXMJtdxFq6zAPPYk4TYWakfE5poRqTlsSQH80dr2/I/QE+m+BBIW7dyx2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY5PR03MB5061.namprd03.prod.outlook.com (2603:10b6:a03:1f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 07:17:51 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 07:17:51 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	imx@lists.linux.dev
Subject: [PATCH v6 4/5] i3c: master: Validate GET CCC payload length and retry Direct GET once
Date: Wed,  8 Jul 2026 00:17:40 -0700
Message-ID: <b467f01edfaaa0710f30e719ce7f2753b06c1a3f.1783493868.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1783493867.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|BY5PR03MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 6209d39f-1531-421a-3db8-08dedcc1054f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|23010399003|366016|376014|921020|22082099003|18002099003|3023799007|56012099006|55112099003|11063799006;
X-Microsoft-Antispam-Message-Info: gke4swU7bEEo9gacQT84GUC5wxXIuLBD3eQIJti+zw+CfuV1vhdiIS22VEwOlzfPMkT5TEwUEos/qBR0ej004mGyB2juHrnOlII04kPS37J+G8p/dbgwOrpbcJ0NFS4zVuHtJkONa9XqqSDAZRwAe48J8sa2kHT8M+yA4vHhPrCxFPiQVj8vUqB7W4dMcBC2QlAJV5QQhkqW80sFBFZm5Uwjr5FGdNoLtJCjQsHCnPOJDXv34DJwYlzOLvUuBu6N1WUdJfI0GhPtvBsdQgc9Dfe9U1ZERNZ/otopeNyvtWCwzjBdbraLVUXBc3yqIrBTy+MqK/SuFTCW5htXcSp6a2QhvIa3sHisaLWdE1OUm1E9gMFbeOQr96MaBhqpzF4MEngG4AEEuHzjmCRJTHn77I8THYfdVGoso022RGMfY7PtEH3wrSGcIuCwmJZsynCAyeJWNog1QFCWP0dLO4hoOTqrKfh23At5nEz1NjBXEl2NUX7fJMnwAG9Ag28vzzwajHBrV4iGlXdeNI1CTwfpTGuDL96Y/9tfCT9mirn4+xcD6lthzfuRsAGPrXKzp394KQONSTDUyG1h7OLUQ7R/m0gTrPHrZZorX7ZbLb5MJP7yC71WYzX+HR86Llq1zehsyujDD4GYcTYr0Wi0ZmhOTypCWTuKmGK55kOTL6qmfx3OGcTYxcbQ9jrsIX0H0R36t9rfLLDnDvLRiiJmiWUorg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(366016)(376014)(921020)(22082099003)(18002099003)(3023799007)(56012099006)(55112099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW9wMm9CV1hJNTFHa0xuWVoyUTllOENQelIxSW5pbXUzQ1A5UnhmWFhNYzhI?=
 =?utf-8?B?aU02bXNVTklCQ3BhS2JvK3JCOW5VNDgrakxYZG5ucVBoOTNkVHk3aFdNazJ0?=
 =?utf-8?B?MFBlVzF4TzdMUG9RNVZwN0x5VUdSMWxyWlBJUkJENXVIWkJTaFJCUnRKOUVL?=
 =?utf-8?B?T3NsS2RaeENWcmZtc0h3TVFhd0UxVVQ2RGtpVXZiVWJXend1QUE5VWRGMWJu?=
 =?utf-8?B?UzJ4UVpsWUFDbWRZNGkrTkkvNzVROG5SWjlsTVFUNXFLMlEvUHJTcno2QU84?=
 =?utf-8?B?QXI0WWh6WDZRZldIUldoWWJDMEx3dUsxUmMzUWVsWmMzckFxRGVuRFNKQndn?=
 =?utf-8?B?Q1JyOWQzK1JncFFiVHhZY2xIUFd0R2VZa2Z4SUl6bnRIUWF1Q3MxcHhoUFZ0?=
 =?utf-8?B?UWlWeEpRVFlRNzA1YlhZSWlZVWJUV0VJTlphWDNIMUZRUmdKbzJzMjFVNkRr?=
 =?utf-8?B?MDIxL2k3eUNxRk1jcHd3WDZoa29RQ0xzVEZVdkphdlhzRldHb1gzN2d4SFRx?=
 =?utf-8?B?VFN5VEh5S2p2cml4MkhEVVlFRGZqKzBJYXNoZXg3Y3h3UU5pQytUL2RkdzE4?=
 =?utf-8?B?V1lENlNVVXhXTHNGWUNCZU1hWWtBZnlJblR6aHkxRSt6TGtkbzljWUZheFNV?=
 =?utf-8?B?d2FiSnZVRHo3RERjbHBSOFA1Y2dtMnFQQW8rNGtLeTd4ZjlNcHowOXIwWHZx?=
 =?utf-8?B?cVp3T2YwYTZwR2N2bkxBVVZ6VFdDSHBlRFFsbzhqbHpoKzZmZ1pSMXhKY0Q3?=
 =?utf-8?B?RmxkZVgwR0FTd1pqcVNpa1pseFB2WkxJcnBRZHM5MEZiZXptSTNWOFc0R2N5?=
 =?utf-8?B?SzVzVWYzZkRKelI3T0RockZnRHFUYVJZSzVpR3o4eGNVVHAycjd1cmZ3clBn?=
 =?utf-8?B?SjdYT1dlYzVvQ1dkMVFEVWxOOUtnZGkrRC85QmJvRDBiaUZSdkprWEROSEhL?=
 =?utf-8?B?NWdQc0VmdjJiTjZrMjNKL1VUQkZOdC94bTBjVkFqL29FZm8rYlVwNFRhQ1Jz?=
 =?utf-8?B?VnVNNFl1a2J0eDRBN2VZWCtMMi9hT3EzSlQvbVVmTGlvZ1lrd2VLV1RrNm1h?=
 =?utf-8?B?KzM3OVFDbXRFdkhTYkEzMGkwTS9FcGg3MUpCeVppam5WV3h5bWxjbndzVmRO?=
 =?utf-8?B?cHhsM2pPMkFGUDFWUWVLa0R2TndyUEpIQ1QvVHdzYkFMZ3phYlFWWGZud2Rx?=
 =?utf-8?B?eHhqR1U0d1lNZmIxMWQ5clgySGF3Z1NYcmVQL0FEcS81b2MxajZFY1hZUVN1?=
 =?utf-8?B?M1hxeEd1SmVxSVBSc3NxbkdsWG1OaGdTaUlZcis0OUY3aG9Danp0bWROc3Z2?=
 =?utf-8?B?Nmp3TDZOVDR0dkR0cVlLc1N4RVhhaytyVjlMODRmWnE3NGJDWlBjM29OUDRP?=
 =?utf-8?B?ME8wR0IxMzlEOEhhMzM5Sy8weTAwRitiR0lkSjgycHNnemIvMHR5Y2ZpYlBp?=
 =?utf-8?B?WnhYQjlWZVJQM0RmN1p4dU1BMUFMRkd4am41NFBCekorQ2RZeTN1bUl0eFV1?=
 =?utf-8?B?TGpWSnhwMFNBcSttREdIdngvVHNXMEIrZCsvd1Z4dGtMdjc1dTlBNUo5bVox?=
 =?utf-8?B?c2I2VTZPb1l5NkVwd2ZOcWk1TnlUd3lMZ0QyWlZvRm1OeGtyRmJHdUtSN2lq?=
 =?utf-8?B?QnB5QTNPWHBlUHJFU0w3Z0NXMVlkQTNHbWN5NHVpM3lORVovczNadmV0Zkpx?=
 =?utf-8?B?QldreTFGRU9rTURQR0hjRFlUUE9WeXdYcGY1MzlXaDI3dmMrZnhkRXlhVW12?=
 =?utf-8?B?MWo5U1RXS1FtN3FFY05KVnVzMmxQWngzREZNMGR2NkYyem5XVXhEKzFjRFNp?=
 =?utf-8?B?bkZObzV1SFNud3F0MXFLaTJIb1RCclIzMnpLTUpiOU00NGRjZ0VIRlRhUitL?=
 =?utf-8?B?cnFaZTlDSkxNZkxRQmpqZk1PMWdKVWFnc1Vla0djaTA2WWZncFhuaEE3OENW?=
 =?utf-8?B?MWN3V3JRdEVWYUdBL1doKzRMSi9LaXpxOXhHc3hjc1p2YkhyN3dUVWMrdGs3?=
 =?utf-8?B?dmV3dVVsS0VYNCtHeEw0OGdLbW9TVkRETmpTdzh1WlJsbEZXQy9UdVZNN3dt?=
 =?utf-8?B?cGNxVmtCMDI3Mk9mT3F2SktmdnN3bTQ0eFduVFA2RkhtNm9VLy8yZUdFWm52?=
 =?utf-8?B?c3Z4dkxIVVQrUEswa0xlcFRQcGVMR29CK3cyQ2ZkR2FMRVliTnc2Mmx2UEJH?=
 =?utf-8?B?QWNNeEhtdUJOSWNxd1hReUxFNnhHbmdjYm9YbkhHbVpMYndIdWZPYmFoSkww?=
 =?utf-8?B?SStYVk1kaU5ndzJsSWMwd0VBaGVjbmw2QWs0MnRmdGhycGlCMjhWb3pXek9i?=
 =?utf-8?B?eUNJYTFmbUZOdk1TaUdRUWFGN2x3Zi84MVFFTXp6QUVtOUM4WlZuQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6209d39f-1531-421a-3db8-08dedcc1054f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:17:51.2578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHHdQZBmWfdEUnUldW78mgDsEHa3GtCAME8t622ODRQNz6S5uyWhpblVgkOxqd8Ds+e1upou/FuIo5scKF0+AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_001803_512805_D4F0F785 
X-CRM114-Status: GOOD (  18.48  )
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

RnJvbTogQWRyaWFuIE5nIEhvIFlpbiA8YWRyaWFuLmhvLnlpbi5uZ0BhbHRlcmEuY29tPgoKQWRk
IHJldHJpZXMgdG8gc3RydWN0IGkzY19jY2NfY21kLiBWYWxpZGF0ZSBHRVQgcGF5bG9hZCBsZW5n
dGggaW4KaTNjX21hc3Rlcl9zZW5kX2NjY19jbWRfbG9ja2VkKCkgYWZ0ZXIgYSBzdWNjZXNzZnVs
IHRyYW5zZmVyLgoKUmV0cnkgZmFpbGVkIERpcmVjdCBHRVQgQ0NDcyB1cCB0byBjbWQtPnJldHJp
ZXMgdGltZXMgd2hlbiB0aGUgZHJpdmVyCnJlcG9ydHMgZmFpbHVyZSBvciBhbiBJM0MgZXJyb3I7
IHZhbGlkYXRpb24gZmFpbHVyZXMgYXJlIG5vdCByZXRyaWVkLgpTRVQgQ0NDcyBhcmUgbm90IHJl
dHJpZWQgYnkgZGVmYXVsdC4KClNpZ25lZC1vZmYtYnk6IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlh
bi5oby55aW4ubmdAYWx0ZXJhLmNvbT4KU2lnbmVkLW9mZi1ieTogVHplIFllZSBOZyA8dHplLnll
ZS5uZ0BhbHRlcmEuY29tPgotLS0KQ2hhbmdlcyBpbiB2NToKLSBTcGxpdCBmcm9tIHY0IHBhdGNo
IDMvMzogcmV0cnkgYW5kIHN0cmljdCB2YWxpZGF0aW9uIG9ubHk7IG9wdGlvbmFsX2J5dGVzCiAg
bW92ZWQgdG8gcGF0Y2ggNS81LgotIFZhbGlkYXRlIEdFVCBwYXlsb2FkIGxlbmd0aCBhZnRlciBh
IHN1Y2Nlc3NmdWwgdHJhbnNmZXIuCi0gUmV0cnkgZmFpbGVkIERpcmVjdCBHRVQgQ0NDcyB3aGVu
IHRoZSBkcml2ZXIgcmVwb3J0cyBmYWlsdXJlIG9yIGFuIEkzQwogIGVycm9yOyB2YWxpZGF0aW9u
IGZhaWx1cmVzIGFyZSBub3QgcmV0cmllZC4KCkNoYW5nZXMgaW4gdjQ6Ci0gQWRkIG9wdGlvbmFs
X2J5dGVzIHRvIHN0cnVjdCBpM2NfY2NjX2NtZF9wYXlsb2FkIGFuZCByZXRyaWVzIHRvCiAgc3Ry
dWN0IGkzY19jY2NfY21kIChkZWZhdWx0IEkzQ19DQ0NfUkVUUklFUyBmb3IgR0VULCAwIGZvciBT
RVQpLgotIFJlcGxhY2UgQ0NDLUlELXNwZWNpZmljIHBheWxvYWQgY2hlY2tzIHdpdGggZ2VuZXJp
YyB2YWxpZGF0aW9uIHVzaW5nCiAgYWN0dWFsX2xlbiwgbGVuLCBhbmQgb3B0aW9uYWxfYnl0ZXMu
Ci0gR0VUTVJMIGFuZCBHRVRNWERTIHNldCBvcHRpb25hbF9ieXRlcyBhdCB0aGUgY2FsbCBzaXRl
IGluc3RlYWQgb2YKICBoYXJkY29kaW5nIGxlbmd0aHMgaW4gdGhlIGNvcmUuCi0gUmV0cnkgZmFp
bGVkIERpcmVjdCBHRVQgQ0NDcyBvbiBhbnkgZXJyb3IgdXAgdG8gY21kLT5yZXRyaWVzIHRpbWVz
LAogIHBlciBJM0Mgc3BlYyBEaXJlY3QgR0VUIHNpbmdsZS1yZXRyeSBtb2RlbCAowqc1LjEuOS4y
LjMpOyBkcm9wIE0wL00yLQogIGdhdGVkIHJldHJ5IGxvZ2ljLgotIERyb3AgcmVxX2xlbnMgc2F2
ZS9yZXN0b3JlIGFuZCB0aGUgc3RhY2sva21hbGxvYyBib29ra2VlcGluZyBmb3IKICBwYXlsb2Fk
Lmxlbi4KLSBVcGRhdGUgSTNDIG1hc3RlciBkcml2ZXJzIChTVkMsIENhZGVuY2UsIEFESSwgUmVu
ZXNhcywgTUlQSSBIQ0kpIHRvCiAgcG9wdWxhdGUgYWN0dWFsX2xlbiBvbiBzdWNjZXNzZnVsIEdF
VCB0cmFuc2ZlcnMuCi0gVXNlIGFjdHVhbF9sZW4gaW4gZ2V0bXJsX2xvY2tlZCgpLCBnZXRtd2xf
bG9ja2VkKCksIGdldG14ZHNfbG9ja2VkKCksCiAgYW5kIGdldGhkcmNhcF9sb2NrZWQoKS4KLS0t
CiBkcml2ZXJzL2kzYy9tYXN0ZXIuYyAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tCiBpbmNsdWRlL2xpbnV4L2kzYy9jY2MuaCB8ICA1ICsrKysKIDIgZmls
ZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCmluZGV4IDAzN2Iz
Yjk4MDcxNy4uM2I2ZDNlY2Q5ZDEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwor
KysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwpAQCAtOTE1LDE3ICs5MTUsNDYgQEAgc3RhdGljIHZv
aWQgaTNjX2NjY19jbWRfZGVzdF9jbGVhbnVwKHN0cnVjdCBpM2NfY2NjX2NtZF9kZXN0ICpkZXN0
KQogCWtmcmVlKGRlc3QtPnBheWxvYWQuZGF0YSk7CiB9CiAKLXN0YXRpYyB2b2lkIGkzY19jY2Nf
Y21kX2luaXQoc3RydWN0IGkzY19jY2NfY21kICpjbWQsIGJvb2wgcm53LCB1OCBpZCwKLQkJCSAg
ICAgc3RydWN0IGkzY19jY2NfY21kX2Rlc3QgKmRlc3RzLAotCQkJICAgICB1bnNpZ25lZCBpbnQg
bmRlc3RzKQorc3RhdGljIHZvaWQgaTNjX2NjY19jbWRfaW5pdF9yZXRyaWVzKHN0cnVjdCBpM2Nf
Y2NjX2NtZCAqY21kLCBib29sIHJudywgdTggaWQsCisJCQkJICAgICBzdHJ1Y3QgaTNjX2NjY19j
bWRfZGVzdCAqZGVzdHMsCisJCQkJICAgICB1bnNpZ25lZCBpbnQgbmRlc3RzLCB1bnNpZ25lZCBp
bnQgcmV0cmllcykKIHsKIAljbWQtPnJudyA9IHJudyA/IDEgOiAwOwogCWNtZC0+aWQgPSBpZDsK
IAljbWQtPmRlc3RzID0gZGVzdHM7CiAJY21kLT5uZGVzdHMgPSBuZGVzdHM7CisJY21kLT5yZXRy
aWVzID0gcmV0cmllczsKIAljbWQtPmVyciA9IEkzQ19FUlJPUl9VTktOT1dOOwogfQogCitzdGF0
aWMgdm9pZCBpM2NfY2NjX2NtZF9pbml0KHN0cnVjdCBpM2NfY2NjX2NtZCAqY21kLCBib29sIHJu
dywgdTggaWQsCisJCQkgICAgIHN0cnVjdCBpM2NfY2NjX2NtZF9kZXN0ICpkZXN0cywKKwkJCSAg
ICAgdW5zaWduZWQgaW50IG5kZXN0cykKK3sKKwlpM2NfY2NjX2NtZF9pbml0X3JldHJpZXMoY21k
LCBybncsIGlkLCBkZXN0cywgbmRlc3RzLAorCQkJCSBybncgPyBJM0NfQ0NDX1JFVFJJRVMgOiAw
KTsKK30KKworc3RhdGljIGludCBpM2NfY2NjX3ZhbGlkYXRlX3BheWxvYWRfbGVuKHN0cnVjdCBp
M2NfY2NjX2NtZCAqY21kKQoreworCXVuc2lnbmVkIGludCBpOworCisJaWYgKCFjbWQtPnJudykK
KwkJcmV0dXJuIDA7CisKKwlmb3IgKGkgPSAwOyBpIDwgY21kLT5uZGVzdHM7IGkrKykgeworCQlz
dHJ1Y3QgaTNjX2NjY19jbWRfcGF5bG9hZCAqcCA9ICZjbWQtPmRlc3RzW2ldLnBheWxvYWQ7CisK
KwkJaWYgKHAtPmFjdHVhbF9sZW4gPiBwLT5sZW4pCisJCQlyZXR1cm4gLUVJTzsKKworCQlpZiAo
cC0+bGVuICYmIHAtPmFjdHVhbF9sZW4gIT0gcC0+bGVuKQorCQkJcmV0dXJuIC1FSU87CisJfQor
CisJcmV0dXJuIDA7Cit9CisKIC8qKgogICogaTNjX21hc3Rlcl9zZW5kX2NjY19jbWRfbG9ja2Vk
KCkgLSBzZW5kIGEgQ0NDIChDb21tb24gQ29tbWFuZCBDb2RlcykKICAqIEBtYXN0ZXI6IG1hc3Rl
ciB1c2VkIHRvIHNlbmQgZnJhbWVzIG9uIHRoZSBidXMKQEAgLTkzNyw2ICs5NjYsOSBAQCBzdGF0
aWMgdm9pZCBpM2NfY2NjX2NtZF9pbml0KHN0cnVjdCBpM2NfY2NjX2NtZCAqY21kLCBib29sIHJu
dywgdTggaWQsCiBzdGF0aWMgaW50IGkzY19tYXN0ZXJfc2VuZF9jY2NfY21kX2xvY2tlZChzdHJ1
Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIsCiAJCQkJCSAgc3RydWN0IGkzY19jY2Nf
Y21kICpjbWQpCiB7CisJdW5zaWduZWQgaW50IGF0dGVtcHQsIG1heF9hdHRlbXB0czsKKwlpbnQg
cmV0OworCiAJaWYgKCFjbWQgfHwgIW1hc3RlcikKIAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAgLTk1
NCw3ICs5ODYsMjUgQEAgc3RhdGljIGludCBpM2NfbWFzdGVyX3NlbmRfY2NjX2NtZF9sb2NrZWQo
c3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLAogCSAgICAhbWFzdGVyLT5vcHMt
PnN1cHBvcnRzX2NjY19jbWQobWFzdGVyLCBjbWQpKQogCQlyZXR1cm4gLUVPUE5PVFNVUFA7CiAK
LQlyZXR1cm4gbWFzdGVyLT5vcHMtPnNlbmRfY2NjX2NtZChtYXN0ZXIsIGNtZCk7CisJbWF4X2F0
dGVtcHRzID0gY21kLT5yZXRyaWVzICsgMTsKKwlyZXQgPSAtRUlPOworCWZvciAoYXR0ZW1wdCA9
IDA7IGF0dGVtcHQgPCBtYXhfYXR0ZW1wdHM7IGF0dGVtcHQrKykgeworCQl1bnNpZ25lZCBpbnQg
aTsKKworCQlpZiAoY21kLT5ybncpCisJCQlmb3IgKGkgPSAwOyBpIDwgY21kLT5uZGVzdHM7IGkr
KykKKwkJCQljbWQtPmRlc3RzW2ldLnBheWxvYWQuYWN0dWFsX2xlbiA9IDA7CisKKwkJY21kLT5l
cnIgPSBJM0NfRVJST1JfVU5LTk9XTjsKKwkJcmV0ID0gbWFzdGVyLT5vcHMtPnNlbmRfY2NjX2Nt
ZChtYXN0ZXIsIGNtZCk7CisJCWlmICghcmV0ICYmIGNtZC0+ZXJyID09IEkzQ19FUlJPUl9VTktO
T1dOKQorCQkJYnJlYWs7CisJfQorCisJaWYgKCFyZXQpCisJCXJldCA9IGkzY19jY2NfdmFsaWRh
dGVfcGF5bG9hZF9sZW4oY21kKTsKKworCXJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyBzdHJ1Y3Qg
aTJjX2Rldl9kZXNjICoKQEAgLTEzNzIsNiArMTQyMiw3IEBAIHN0YXRpYyBpbnQgaTNjX21hc3Rl
cl9nZXRteGRzX2xvY2tlZChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIsCiAJ
CSAqIHdoaWxlIGV4cGVjdGluZyBzaG9ydGVyIGxlbmd0aCBmcm9tIHRoaXMgQ0NDIGNvbW1hbmQu
CiAJCSAqLwogCQlkZXN0LnBheWxvYWQubGVuIC09IDM7CisJCWkzY19jY2NfY21kX2luaXQoJmNt
ZCwgdHJ1ZSwgSTNDX0NDQ19HRVRNWERTLCAmZGVzdCwgMSk7CiAJCXJldCA9IGkzY19tYXN0ZXJf
c2VuZF9jY2NfY21kX2xvY2tlZChtYXN0ZXIsICZjbWQpOwogCQlpZiAocmV0KQogCQkJZ290byBv
dXQ7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2kzYy9jY2MuaCBiL2luY2x1ZGUvbGludXgv
aTNjL2NjYy5oCmluZGV4IGQ4MDUyOTQ5ZTU3ZS4uMjUwNmQ4M2I4MjU1IDEwMDY0NAotLS0gYS9p
bmNsdWRlL2xpbnV4L2kzYy9jY2MuaAorKysgYi9pbmNsdWRlL2xpbnV4L2kzYy9jY2MuaApAQCAt
MTIsNiArMTIsOCBAQAogI2luY2x1ZGUgPGxpbnV4L2kzYy9kZXZpY2UuaD4KIAogLyogSTNDIEND
QyAoQ29tbW9uIENvbW1hbmQgQ29kZXMpIHJlbGF0ZWQgZGVmaW5pdGlvbnMgKi8KKyNkZWZpbmUg
STNDX0NDQ19SRVRSSUVTCTEKKwogI2RlZmluZSBJM0NfQ0NDX0RJUkVDVAkJCUJJVCg3KQogCiAj
ZGVmaW5lIEkzQ19DQ0NfSUQoaWQsIGJyb2FkY2FzdCkJXApAQCAtMzc0LDEyICszNzYsMTUgQEAg
c3RydWN0IGkzY19jY2NfY21kX2Rlc3QgewogICogQG5kZXN0czogbnVtYmVyIG9mIGRlc3RpbmF0
aW9ucy4gU2hvdWxkIGFsd2F5cyBiZSBvbmUgZm9yIGJyb2FkY2FzdCBjb21tYW5kcwogICogQGRl
c3RzOiBhcnJheSBvZiBkZXN0aW5hdGlvbnMgYW5kIGFzc29jaWF0ZWQgcGF5bG9hZCBmb3IgdGhp
cyBDQ0MuIE1vc3Qgb2YKICAqCSAgIHRoZSB0aW1lLCBvbmx5IG9uZSBkZXN0aW5hdGlvbiBpcyBw
cm92aWRlZAorICogQHJldHJpZXM6IG51bWJlciBvZiB0aW1lcyB0byByZXRyeSBhIGZhaWxlZCBE
aXJlY3QgR0VUIENDQyAoc2VlCisgKgkgICAgICZJM0NfQ0NDX1JFVFJJRVMpCiAgKiBAZXJyOiBJ
M0MgZXJyb3IgY29kZQogICovCiBzdHJ1Y3QgaTNjX2NjY19jbWQgewogCXU4IHJudzsKIAl1OCBp
ZDsKIAl1bnNpZ25lZCBpbnQgbmRlc3RzOworCXVuc2lnbmVkIGludCByZXRyaWVzOwogCXN0cnVj
dCBpM2NfY2NjX2NtZF9kZXN0ICpkZXN0czsKIAllbnVtIGkzY19lcnJvcl9jb2RlIGVycjsKIH07
Ci0tIAoyLjQzLjcKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
