Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B1ECEACF1
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Oct 2024 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f4FoHKwnCmck0w1N8kKgoYs7qFP32ED00FwiAros2kw=; b=RSWuxc6oFHl7Qp
	GbkkEnSMm1q6oZRQL9H5xxzG95m8Z8LHgbr/AXqSMZPNA7uIuSbc54L+yQuP/mqhp5yLN5pI3Jsai
	wiRcnmNhwzLG34CbAiUqKpuB4WFsDigVVWkkkEW3fjuSFBOyl7sx6kXcMcvHVSH1Y6G61Qdq9PqzQ
	xOE2SO9Y6nkHhzHjgX95nWWYqUCtrDMOfhNXTgThgnZNwIOjvZTVK/heahcEVqQ1TRamABryRTrFs
	ZXoEj9YXsmlvmd/l5x/hIPO1LnwqDzwbxBVBtZt4iFW66vzvmccFw3f5Meduv7B00i1P6J1SjgCJ2
	wu/zYGefzGR4HtKk1qHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svgiv-00000003fHN-2a4V;
	Tue, 01 Oct 2024 17:31:45 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfZz-00000003Us2-1KmP
	for linux-i3c@lists.infradead.org;
	Tue, 01 Oct 2024 16:18:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rr/JenvCBZei6fdb7r6n3NHcnfJO5DT2KvHXUBPFC6uA6roNYG1TBGxVblQ8Io8VaJNjb872LZuTgmb4Ph/NkiXgZEjE9hQlWMrMwu5zJfnvTvLANsmxeK27cfU5OmtVkKNnNXgkZUjqxAm1v8dDYledmEphAlECYjFmn4E8sBBKOwcXvOWk7jqCdeogJdXtrDxe+sdXbJJcGhnb/KHkCxN+nOx26Jr9PKRzL6tr1MY3QqlOSb4z7C1lg1nyTqM/Fyd5c+OLSY1OGR5rPdxTsip3+6HJW79+nDnD5jL0dBu5LflIfzmkNfGDlgANWDzzJ88AS8Qz50TCuVqL5s6CtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7csOdTlPABbux1sT29PbmMTe7/81sXGNwUnWOPIM3d0=;
 b=Z9E1lbC4yNjMb+KLHPjKFhkF+JO24E9GKeEwf0xqVr4tQNui5czPnj042G+//vNjWUbhIUxRI4WHmqiPYD4Jri28TyL6Xl5oZhERAgL+MYRMVtoFrCKvZnA4kW4ImM+i+U8N7ljs4dOr7RMllplA+D9aBAkIki5zGOTKwqay1SNeR29Mz6DFAEKoOS1JF6eyAZLM1G3Ptx6D3tU9ximvtjaFbI/D+ztcv6f3+fwjggiM2D2/IUg1+8+HO+jZERt7KmrN3/3z6mw3Ms5mZ2xudtKuSdnCpshkW2nwq87l3UXtRlGozd1mCT/XN/qO7b2Af3EHCxcQDYBCSKtbyZpPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7csOdTlPABbux1sT29PbmMTe7/81sXGNwUnWOPIM3d0=;
 b=XBkEGIABqT5Q8jlHFmP0P2PNCfjU7IcQ4Dd1lR/d7Y+iz4Di8WuS2hrKnR937ZTY7umortC0Kpzk8ZIRuy3XwxfrLKv/WXW0SwlgzDqJW130hknv3FvIWNjPyYxMarokMPlodYwzNsxoqoGQDPEZLJ4/mUMFGM1Zbexy6vzK+dVRwLBI2Fbs+tFbXGFi98hqV3htrOsPwJ6SsDJTK0Yca1kg8ZC3IUX27nXCX3cxJkxsio06IsJXlLRMcERX1PGWeaIGZTDNaUHSKmiSQ6yckTiKt0zkaM8L5PY4RwgJG4J7yHqosAJ8kkf1nz10mrOBIhvfLMw+gTUfISs3FoyvxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7879.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 16:03:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 16:03:38 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 0/6] I3C: master: svc: collect all patches to improve
 hotjoin stability
Date: Tue, 01 Oct 2024 12:02:49 -0400
Message-Id: <20241001-svc-i3c-hj-v5-0-480ab8aed849@nxp.com>
X-B4-Tracking: v=1; b=H4sIACkd/GYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwND3eKyZN1M42TdjCzdpKTEpEQzi+Q0w9REJaCGgqLUtMwKsGHRsbW
 1ABkxU+9cAAAA
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Culhane <conor.culhane@silvaco.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, stable@kernel.org
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727798616; l=1268;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=XB6tbTYcSb/KrBY6OzX8Biv1p+7xsISlJpb4CG6h5aE=;
 b=pMq/ft4GW4SG7p/S37j8boaCwrf0RvXxZ3cclpFCpp6misFSXpdMLcf7kSPO0bZFkX9zuk99Q
 Dd83M+YzUMjBOMduxkOjcWIQb2Yz3D5SJbkxy32DcUXQEdFrFKKqFh5
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0045.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: a85a658f-9190-4497-26f2-08dce2329c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWlaTTBDVHdndTl2UGgra3IrNkJEb0NPeC8vNWpHU0p2SnZqemR4TXlzZlQy?=
 =?utf-8?B?bGFCQmMvUEJseGliQU96NWJPOW9oaVAySVFpU0dLeTJSdlZVUnpKOEdlUmkw?=
 =?utf-8?B?WWNIcjllaWVSQWhaOWZPUTNQRGZxZjl1bjNrcnk4SUl6L2pGT2JjbHowL2tU?=
 =?utf-8?B?enRVYnFkd3RYTUx1NTNRblZBRVhKeFdjUzhqOFZycnpNZG13clpTTHQwZTlP?=
 =?utf-8?B?dFRZU2h6NndFQmNzbnlTZDRWN3J3bUZrQnBCcVBXa0c5WHBuYXprZE9JclUz?=
 =?utf-8?B?OXFneVk0RU1MQ0pCMTJMeDJWb1NUNmtMbFU5RU5BREpVYm9Sb3FtbEFhOVF3?=
 =?utf-8?B?QUVHUHExdVlObnFlbDZUN1p2VWt6a0NDdVZ3QkdQdkpmVktHVDlLN2NRQ1hI?=
 =?utf-8?B?blQ3TjY1OTFPcDdwMS9JZ2pDU1BVSWtCYllpWjJIZnVUcGhuTVd0R0tkUEw4?=
 =?utf-8?B?RDRsc2ZrcmpVYjBIOXByZis4MUZFTVMvdE52UTIzVEZ5bHdzY1h3bEFGK0t4?=
 =?utf-8?B?RXM4aGN6V2dtRU1PbmNub0ljdHdGZno2Yml0TlBKMXpvekVzZWdYNHVnQlE3?=
 =?utf-8?B?RHRmaHZCMnV6ZExNRE14b2kvWnl0LzRXWHBRYkRldHJuejkvbGcySGxOdE1X?=
 =?utf-8?B?cHlsZWdKa3BUQXFNZTNyUGRyS3lNT3FIRXBTS004NWZwUHNZQzV4UHNDTmVF?=
 =?utf-8?B?TDBhdVVYNjJ5ekJMc3dFTldLTDZiYTZZNHIrL3c1ZXUrQTcwWGlYaGxFQm42?=
 =?utf-8?B?aTRvbFVxcDUycEdkVFNWaEFmdzNnL2laSHVqVzdqTHdFWWhwcklsSlRiRWpn?=
 =?utf-8?B?VlU1WnZqRGVHQlFOV2JxbG1YQ3VURDg2ZEp6d1IyUzlqY2JuQWoyWFVtVzhv?=
 =?utf-8?B?dlJWU0tUcC8rUDRDbVpRd0taZ3JYNllZVjdpaDFGakVSckQ5ZUtwUGpSUXA4?=
 =?utf-8?B?Nm16UmE5RDF5RGlPY1dFaU5SMUJPaWJMd0Vnd3pVUHlrNDBHK3B5Q081aHRE?=
 =?utf-8?B?YmVmMzJuZ0VUL0xEaS94SW5sYUp6TlB6aDNjWTNvOGVZVitGenVIcDgwdzlY?=
 =?utf-8?B?Q05CMC9yQmpuZG44Z3d5ZWdtWW1GQWVYZm80ekFwMFlBRTFnZnJ0Y05vdEtm?=
 =?utf-8?B?emV2U2VvMWExZ2hRWFh2N0d5YmJvNWpwL2krVTR5THh6dC9reTZTNTNlRmxk?=
 =?utf-8?B?WWNoZXQvSWpxaEVnZThiUzZONm0rQjBuTlphMzZTTm9WTC9hNDBzUVpuMnFI?=
 =?utf-8?B?Z0Z5S1Nhc3k5V1QzalhkWXhWUEdjTzFkYW85ZE01TVNpNUFzSFUxMnNTYy9N?=
 =?utf-8?B?MWVUVlEyc0tvcmpoaVFkckUrMis3VWJLNjdlN0JDbDFOa2FTU3hyQkQzbWtm?=
 =?utf-8?B?dTBzVDc3VGIxZ09yd0NTbmxnKzQ3c3JnRFFMUDdoRDdxR2FGS3JHdkxIUmZw?=
 =?utf-8?B?aXhNYVhGdGQ4RGkrcXM3b1NqYjdFVDloVkNBVTBIcjlCTnNQak5wT21JakJi?=
 =?utf-8?B?a2VGMXhxdlBqM3NXT0J6Y2JjWTJBNkpaT1NKcThlUHRMbUFFeTZlRTJkYm5x?=
 =?utf-8?B?ZGJXcisycVVzTFBFKzVDZGFDbU1MbWFYR3p1OE1NNzA4M0JsUnU4ckplNmxt?=
 =?utf-8?B?YW5RRlNuTzJUdXRCc0dBditjMS92aHVLb1pydXMyTUlTTUFtVkFMcjBGQy9H?=
 =?utf-8?B?UUlBMXVlTXR0Umh1RTdhZ3VmOE9CM1pYQm96bS9ZRDlYZnV3dmxsZkNHdUVE?=
 =?utf-8?B?cnM0MzhtZjlvRDRPaURzaXFmaTdSNDZFS3dwSWYyczBOZVMxVmZEYmJXNVV2?=
 =?utf-8?B?UFpIbUlIVTBQTUc0MDdLQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDlyZGxEWUl4bDRNbWMyNzd1REE5V3pxZGsxRFkzdEVBRkFUbHd2S1RiQWJw?=
 =?utf-8?B?Uml6ams4anVkNS85RThSN3hzdDk1dVF2RzVjM3AwWlRFbTZMUnBGYmppMXYw?=
 =?utf-8?B?K01KbHYrV2dieVNLNXYzcGUyd3JiTGlRejJ4QmtTaVB5aGxCbko4aHJOYzVX?=
 =?utf-8?B?b3FqbnN0SWlET04yekhuSzllcG0va1lHS1Y5NEhJZjN2ODhGaGs0RmE0U3lZ?=
 =?utf-8?B?clNKa0ZnTnN2RFNFcWp3aVB5dE1UV3VrMnVhODArSTZpcHJNZzdmYzAydXZn?=
 =?utf-8?B?amRBZHY2UlR6QitnK292NUlxUFkyWE5QT1ZBSzZpRGdnaERielFiYjRvMFhO?=
 =?utf-8?B?aDdDcEZnM3Vzc2E1Zi9acEQvUUJha1hqQm8rUGwxVHdNcCtyT1orM09iSms0?=
 =?utf-8?B?VDUxSE9iQVIxTVFuWnFYZDREMUc3a1ViVlNJS2V4ZVluaTlHRTJ0MXJNMWth?=
 =?utf-8?B?djRBZGN5ZnBWK3cwTnVGeGRMQkp4WCtkVHRieWJxdXdrMk8zZ2FTQmZ0Wmhh?=
 =?utf-8?B?U0VsczdrVDdVTmdJZVp5UElMMlhXeGxzRGU4N01QK1BoSm9FT3FseDBzWE0w?=
 =?utf-8?B?Y2dqSExqTUlZckxYekFPeGFoY2hJTmFVTlUxMXJ0VzE1alZndTBlVE1Md3NO?=
 =?utf-8?B?WUdpbDZMNEV4cTB4ajgza1VlbEhjb0ZoRzNldXJHZ2FzWTQxUHN0Zks3SU9p?=
 =?utf-8?B?MTNjMFZZRGlZeHR3NzJIUnd5YS94YnFTZjVpQWF5cWU3NlVjNnVyMjVsY0tJ?=
 =?utf-8?B?UnNNU0NhMDJZUU9MelRmbDJOT010OVVXdzBpaHJzaGpZcTVwUnhKSEwxZXJZ?=
 =?utf-8?B?cWxFbjZEVEJTSFVvUUpFR2hnR2ZFc0ZVeFNNWk1OYlFaMUhNeit0RVd4b0pW?=
 =?utf-8?B?ZFc5QzU2ZDgyeEkyaWJ5Y3lmSXA1OWM0eEErRXNjQm9nc0h0SmlqNlpjS3U3?=
 =?utf-8?B?SkhGRG5FZGtBYUVTclMzU05mUEt2SXNhb0krNm9qQ1RzWUJkZEJoZ3ZMSHoz?=
 =?utf-8?B?TVlobE5DVHRoS2s2QTVVdGR2ckVLdTBSd1p6NElmaTZKMlp5WWRCeTNSdzRj?=
 =?utf-8?B?c1JsUlhVYXhsaXdvWWE2ZHVQSUNJRThqdm1sZTRObVFXczAwQ3BnSXM5djkv?=
 =?utf-8?B?dXdRZk9OY2R6TVFqOHRjc2kzRUxpeENKNmUzYlZhblVPN1pPR2l1YkJRQjQy?=
 =?utf-8?B?d1BhWFNodEo2SjZ2WWhEUHZQM0ZCSzZVWlFYbEo3ZXBSWDJmaGN2czVMWEcr?=
 =?utf-8?B?S29DK1VyRzFXRk9ZQzM2d0tsMmpCZ2pVeXY1eXJhaFk0SUZ6UW9yME5HUkdO?=
 =?utf-8?B?VnRFaWtxMjd2SUNpUzc5cjVUOEVHUTNVUTdXR0VhaGVscG8xcEUwbHhEMkg1?=
 =?utf-8?B?bDBKeWdwTytWWmZsam9Td1FBWU9STytMMzVObmZKUnRWQWI4cWw5QitqclM0?=
 =?utf-8?B?ajJTVWpBL1RsTUZSQ1BySTkzSHQyM2hrQWVFRXFrT1Q4cWMwQmhKQjY2Sng5?=
 =?utf-8?B?Sk5kbC9iNks0aDRrbTk1MzZDVEhuWVlZbTNVMUJXWi9lRnhxVFREUEVBWDY3?=
 =?utf-8?B?UTM4cjZEbEpqMjFMekNqVTVFWmJna1lPczZxMFNES3M1YjJhenRscEJQQjli?=
 =?utf-8?B?dDNjY1dXVUY3dXB4TlgyMS9FKzhlcHJIQTdCNk0ranJHMldEZDR2d1hQcThz?=
 =?utf-8?B?dC9nN2FTT2l1WUdUcUpwMkpxR3ZieTQzODgxY3FibUx4dUUxTDQ0QXo3VVdj?=
 =?utf-8?B?WWM2MVJrb1RvSkEyTUlNVVZrWk1PSFVmWWJvNXVqZngwUmdGVHhtY3BFOEhJ?=
 =?utf-8?B?Nk13QTVBSzF6ekNQWDJvZ1pSbUVXall4S09XUksreThBZExpdzMrcEhHVmFM?=
 =?utf-8?B?TEliekxMQ2dQbEY0SUJEMVJMQ3c1UVpoNVdkTlV1NXdHd1YrczVuVkg2ZlRk?=
 =?utf-8?B?cXNXNjhQMCtsRG5qWVRzcjNYaUNvK25KRzJmWU9kS0F0dTcxbEdrd0ljZWsr?=
 =?utf-8?B?YTY0M0JYRmJJTVB3Q3Iwa1d1Z2JPMFhYcnloZHlNYlo3M0NlMmc3bDVWVHBu?=
 =?utf-8?B?Njlzb3g2UFVTU1NuWEtLZHBSR3JaT2FGZXQ2VDFSdk5YS0RMWUNybzAxNUFS?=
 =?utf-8?Q?Oyis=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85a658f-9190-4497-26f2-08dce2329c78
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 16:03:38.1955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnFTKzf3mbf1lZxP7j+2oI02d76aevZxFDCZknsr+2NCOV5aFAdjIUf76k7zk84j7ntdFY2G8JyY7b1XlTZAJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_091827_441430_9CE46680 
X-CRM114-Status: UNSURE (   6.05  )
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

This patches is splited from
https://lore.kernel.org/linux-i3c/ZvrAuOBLgi+HtrPD@lizhi-Precision-Tower-5810/T/#t

It needs more discussion about dt assign address issue about i3c framework.

This series is svc driver improvement and bug fixes for hotjoin. It fixes
all kinds hotjoin problem when 2 devices random hotjoin and A normal data
transfer is on going.

This patch version start from v5, which exact the same as old series's v4.

See each patches for detail issue.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (6):
      i3c: master: svc: use repeat start when IBI WIN happens
      i3c: master: svc: manually emit NACK/ACK for hotjoin
      i3c: master: svc: need check IBIWON for dynamtica address assign
      i3c: master: svc: use spin_lock_irqsave at svc_i3c_master_ibi_work()
      i3c: master: svc: wait for Manual ACK/NACK Done before next step
      i3c: master: svc: fix possible assignment of the same address to two devices

 drivers/i3c/master/svc-i3c-master.c | 122 +++++++++++++++++++++++++++---------
 1 file changed, 93 insertions(+), 29 deletions(-)
---
base-commit: 77df9e4bb2224d8ffbddec04c333a9d7965dad6c
change-id: 20241001-svc-i3c-hj-bbaba68cf1ea

Best regards,
---
Frank Li <Frank.Li@nxp.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
