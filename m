Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F94CCF9EB
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Oct 2025 20:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=F/kvCPFj616cN6z7MCvjKLuPaHNzLKDXCswxg9nOwOk=; b=0dRZ71r4/rifDo19YvrAXdDEXE
	P4lPxK/E5LJeIKJDt2dpJ7uENPCO0/qDWnOh54SGru5leEoEIJGiVPbXrLofUMKk8jBuHwgzlW7hh
	NDcsSvzGb+gyVH5vg3bV6vu8zR6tZqkCNSgDhboE/Zlv2pVKfst/uUlNoQEt3UC7jxdphPnImWo9G
	eEZil4sKIm2mVZeWKgiqGtpeuNQDyJ3azcEIgbGoUl8A8COEEa88BDr3K2JApq63S4eP7T2OTagd8
	a/tAky3eZDceB+ToKFXrhvh2NWdEGhs4hczymSdyaq0e2XZhx8zTJQavbIXNxxckO5EwB6+siblqX
	CWx0a3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUI4-0000000ElLK-20Xv;
	Mon, 27 Oct 2025 20:58:08 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUI2-0000000ElIi-0sxf
	for linux-i3c@lists.infradead.org;
	Mon, 27 Oct 2025 20:58:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeEMQZ+puDsg5RYfVoPjFM9dagEzo84gwDONN2N1FlKdqX8PRGZm5eOVyAI1WXRwVnxnHEXGzY1CkV2LKeuxL9Xs845kr8p/lBZfXmdEahe7gGNGnqpkuqm5iVz4vm1ME4HYjR9uutUunkI3I+ibP3AhpiNwWRms9roS3M+kkuYLxh5OsDOo42L8myq7MlhMFA6YzjIVEAGJvbFaCygffLwxSvH8aXcATaz2CF192LEgDNWNcRnTdqDMyNs5qhDCMs/UtXkJzW3OBPXRSwGX8sGiRlzwF6/cthQppt2RGZ/cPDHPyHLizm9KiW/LtMeoi+pmkQSHkKzYh5lXQ/1hmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WPAchqkrtoQa6xlplBhv/qU7MgeMHkbzHisOr3E/j4=;
 b=izu+6Y7AA1rmButLBV+JHr2zoxl0RScBYcdA/r/84cfeYbsGIOmJfPJVy2wyNS174G7DoNSM+1ki2Ytr9oy2WYYnHIzFN2J1HeMpa5vfmSjDOE2ReG6diWkYxWbu9i6b0c2ew6U1m9pUzWyesjBnp+wWETaYF7rw8spi0ypKIW2NWLd2+WZm1jPnD0Wj/cZzhmbTD9P8A3rVDHGUiH7jCN5To1SiZvdDekaCaCXW57ZUARal7gDEEwtwOHohs/Kxb0reea3xL8+fnYiCy+4oldVwRAonK66vzpFN4gijePWyJjNBqdceFk+jPiZYAEcAovtvcpsv7xQD5HQ94CLH4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WPAchqkrtoQa6xlplBhv/qU7MgeMHkbzHisOr3E/j4=;
 b=I5TK+vL5Ndvsm14W/tGcihMgjpJ4ZtgDhKXgM7gSLkdMsjO0i8axVo+BTAapdxb6msPQpEgpxq1zXKuYhAOpPLmGXNBVqe0qwJg+USzzNro6XVAH6fclSknrSx1Ifi3Cz82JIOnei5mbwp1tXWl7vcG8ljD4B4cp28rsP8eZtyvKSuywecBTwTAz+iBYtYCjCBz+Xq8TVe1qiOcn4Wa0VkeTj8j+lF+pUyZtXC/nt9WFseiJwvT+Ur24tuxcRYzt8UGlxhxU7SrcLY3ZTUycC9IziL1ZaPoz2UEsdUkSlnKFjbCLXsBpGPa8qCTqJVaOkhQ1XejUsyiLsNTT+6iH5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8577.eurprd04.prod.outlook.com (2603:10a6:20b:424::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 20:58:01 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 20:58:01 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 27 Oct 2025 16:57:40 -0400
Subject: [PATCH 2/2] i3c: master: cleanup callback .priv_xfers()
Message-Id: <20251027-i3c_xfer_cleanup_master-v1-2-e9bfcb083a38@nxp.com>
References: <20251027-i3c_xfer_cleanup_master-v1-0-e9bfcb083a38@nxp.com>
In-Reply-To: <20251027-i3c_xfer_cleanup_master-v1-0-e9bfcb083a38@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761598674; l=2874;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=urO5GSVwnczQg1wIwgc/1gO4/2Rkk1dX3U9Wnlbses0=;
 b=dxP3n4O/VXRBm8Fsdq5j7QaFZeSe7PleqE1ZeXNZBWTV8N+Tw0jTHmlENB2xdVNx1Pw3f7Mx4
 FSwLicYjXavAlipGk+9p7avERp3N2inCNmso8GpJ22NGUKGOiCflGqM
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::6) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e69e3eb-7194-4c04-6317-08de159b83d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|19092799006|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NU92K0tPbVl4OE5rQ29WTlNnNWtpd2YzS1EvWW5mMFV0OU93WnVwbUp1cFkx?=
 =?utf-8?B?NStjZC9NYXhRNTJYWDZDZ1lRbGNIMW5VRXhiRlk5dmlhcGl2Um02VXo4dnBv?=
 =?utf-8?B?RDVSRTU2cFl2RGFRZnZsNE1jZWlZbVhHblNDRzJ4OW9yWlRYTTRtTFdBQ0gr?=
 =?utf-8?B?VE9rUU82TXVUV0h5eHVKUGU5VUpHdVRUUUVwaElMMm5tMDVlOFVRMWpmeVpS?=
 =?utf-8?B?Si94Sk1sVlNrc2VBc1hHZVpmZGlES3hWUERpRjZuY3k5b1djRkgyei91bld5?=
 =?utf-8?B?eGYvUGN3ZUtVc1JidHc2ME1GbW96Si9vL2VnOUc4VTFnc1o3bHNUaG9udWc4?=
 =?utf-8?B?WHdDUGNnU0RWZmVHMmkzZTE3ZWxSWUJsZm10ZWpGVjRXMEZsQ2tMTE0ySDUv?=
 =?utf-8?B?RGcyQ2t0R2F6ODFxMGsybzlYNG1Pc285aHcvUzc5dWx2OVF5NWxGZ2ZnVFV0?=
 =?utf-8?B?ZFc4UzZnWjYrd0tqV0NKTWZSeGtjV0JQdkJ6ZVNkWTlhUFBOSmlJQjV3aEhn?=
 =?utf-8?B?QkhhcUFpa3J6bnNqRTcvYlFpUlROaGI2N25jSjZObGQ4R0tMMDMxWUU3a3Rp?=
 =?utf-8?B?cnc2M29VUWR2TGR6TzJOWk9ZS0J1cjVpaDcwRDlmYXRZRXB6TG8xNnJsNG9M?=
 =?utf-8?B?SUFOeDNhTC93cmxHM2ZSMjNXM2ViMHJBSWdDeFFGZnNndG1teWcxc2xDbWRE?=
 =?utf-8?B?SEVkOFVxQ0pWWnl4RDQyQzJoaEdlSjZtVytUZWJKYzNzMGlQSEdUMDFTV0Yy?=
 =?utf-8?B?cVBFUFN0VzRaMDZtUFIySGFGREVmckRHUFkwamMrbWpCcWlCTUdJUGhMa29u?=
 =?utf-8?B?OFh3eXNaaUhOU1hUQkxjQmlIbkRrVGhjY05JT3VHVWhRclphM0ZOL3djcSs1?=
 =?utf-8?B?a3RXTzQ5Q0tBcmpxSWxITE9oUVEycWV3Wk1pTWVwVG9ic3VCMTRRYkdLUXNx?=
 =?utf-8?B?dHYxUmU5UXB3NE1iZFhiYjFsRmVwQk5ibEdGblBWZUs4NWwydm1tOW0rOFdZ?=
 =?utf-8?B?VUp2eTFETE9VNlp5cVpnbklVbnF0Q3Vyb0pta2VqVVlna3Z4OUpqMmh0Qngr?=
 =?utf-8?B?MVF6ZUVNWnVvU1lhaStnQzVFTSsrSWt2S1AxNG4yTkZjWUNPSzhRVUJQQ2xU?=
 =?utf-8?B?NFJPSFlPTGU2NXJ6aVQzYUZCandxVVBkQTdCUXY0K0lHcVMzd1RSd3k5ejNs?=
 =?utf-8?B?eTB1VW1YS3R6ajZ2elhYQUdpWHdIUDJDNGpWOVNYdzZiK0xEWHkxYzViM0Zq?=
 =?utf-8?B?elJTQ1F3Y0JSQ0FvMERXOTJpWERzREp4K0dGVU54TXgrcm9IZldwSmlXZ2lm?=
 =?utf-8?B?MTd0TjZLNysyN3I3YUI4c0YwVm1aUUFSd1BxM0JhTVdLQ0Y5cDEzQlJtdFh6?=
 =?utf-8?B?OGQreDRrZElBRDZ4S2FQZXNPbEJUYSsyZDBJcHdIQWV1WXBROWJTaDdtNCt6?=
 =?utf-8?B?aUdPbGpZNXRlNkVMRmhZUmQ5bzlGL2l3b09nTVFRdUdmbmpVc0lsdi9zTytL?=
 =?utf-8?B?aitUNGdJc2dFR09QbnA1dlhDbERDcDZOdE5Ya2ZkQXF2UERnZUxiYi9zNG9S?=
 =?utf-8?B?b0hLYWdjaWhZY0ZERytqQXAxMUNxQlJUYVJWd0xNVFBSTEZleFFIL3VjdnNF?=
 =?utf-8?B?THoyRk9EamQrZ1RMc1VvVGdOdEN1TEtyM0pPZjdpRUt1dzlVTGN3L09PT2VG?=
 =?utf-8?B?SHRudkxIbmlkYkYzYW1RTS9oRVVtSkNLV3p2ZWpPUk5XQUVmWEh2R3VGdXBn?=
 =?utf-8?B?YWFQT2QzRWNwbVBRcVRQS0dSRHlSU0ZtN0FvMTdLYW5nd1NyTjJkNjBsSDJi?=
 =?utf-8?B?RUV1MnQvd3k1bW1YNUg3MGNBc0xEVktkZTUxSzVNZGRrdWgraS9FMk1iNUZQ?=
 =?utf-8?B?NjBJaUhPYW4zNnVXKzlZM2VXS1lrOC9wcG5sVkp5cDArb2tmUDk1S1ZnYUNO?=
 =?utf-8?B?UXVRL1NQczljQzY3YlVBUUVHQ3hDSTZ2SVBvQ3RZQURZZjV3N1phNHBTcEs3?=
 =?utf-8?B?dVlOVnpyQWNGYWc0bTVKbGI3OTc5Rjdwd0FxZnBMQWtvL0dneUE3NU5qTTZL?=
 =?utf-8?Q?z/oWNU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFM2Q2xpdTZXMHFEVEtuTEk4d0JYMmNUZ294OUUyamZPeFJhSkNLR0l2ZlF2?=
 =?utf-8?B?QVhIQkdsYWYrREJRbThzUTAxTFN6WDJOYy8wZGtISHhPNzBIZEZGVDAwZ3ph?=
 =?utf-8?B?N3JRaDhxVmx5NURVaytvUWJXVUFVQU1VVzd3V1k2YnRiVWx0WEF1N3MyM1cy?=
 =?utf-8?B?Z3o5Tk5sbVQxNWU1YzBLZnhCTElQL3oxRnFpNnlOekpZVDh5eUIvaS9lTDBH?=
 =?utf-8?B?WHFlT0tFSy9PUUhyQnFpcE53UVhLN09WWkFnc2hTUkIwNy8yMWFKRjdqZGRE?=
 =?utf-8?B?cEJKUjFkRnNXVjViOXY4TmFvSjRIRG5tdGxBeFIwWHRaUGhMMHROQnhROVFJ?=
 =?utf-8?B?ZU82elZiNUFkQ09aUTdrZHFTOGJoeW9EeVEyaDd6U2NLaVBhYU10anFPK3lJ?=
 =?utf-8?B?YTQzTFBIc0RMbDgrb0V5U1JzSmY4bVNoalQrVks3SXdFZVI5OThWTG9GZWpt?=
 =?utf-8?B?cTNjRE51L1VteEIwbk5PTjRaa0d2ejBnVjZobWc2dWNZM2hvK1BEQVFIT3dw?=
 =?utf-8?B?Ym44dWdBNzltdHJWcGs2MS9sUkJ1dWhYWHBqNjVldkJVMEdIY09abzFraEVo?=
 =?utf-8?B?bDJURTBkUkx0QndnY2VjRnFDM3Z3elA4U1h4WUxBMmxaRDhOYTVYemhqUC82?=
 =?utf-8?B?bzNoaTEvREwzRUpUQUtQMDlwVU1paUFlY3d5STYzWWJtZGc3Z0hKb2JkYno5?=
 =?utf-8?B?a0tSSndDTlZveGtjbGIrdFh4bmxSWFB4eTIzYW1iSHhSR3JCc2UwL05RQVVD?=
 =?utf-8?B?QXlmTVpnYVRQc1pjTXhuOFBOSGViRXhIVm1ReXN4YTNsZWx4MmVIeVVvYTNQ?=
 =?utf-8?B?eE5iYURMWTRMZXgyWjUrWWZJL2JvNG5lMjRTcEJrbXVFak52RjRvYURVZFhJ?=
 =?utf-8?B?SUZrL21raHpGclBiYmhMT3h4SDhxZVRZU2pTc1FCUkE4WVA5MHFXek1lbzha?=
 =?utf-8?B?bVJqYTdkZU1CZTUrY3A1MStkZHBXMlNsOUlTRnBETWtFQzRyYXRodnM0aWZy?=
 =?utf-8?B?akRtZjZmalprOTU2T3BJbno3aWE5d2c2V0w0Ly9mSE02VU5jdjNyQno4M3lL?=
 =?utf-8?B?Q0pmU3YvUVRzK1NpVjIvTTRxZU5BcFRKbUF3ZGNtaTlITnBYK25HeEN6VnBs?=
 =?utf-8?B?L21jRFE3ajZScUkycG95YU5hMDVuUzVTQU4wb3BBOFl4ZGJPdlQ0VW5ycGkw?=
 =?utf-8?B?WWc3cWJlY296QVBiVC9kYmc0TG03MVZHbG5nS2NDQTJGVit6NGdML0hSWTdQ?=
 =?utf-8?B?RWlOWjB0Q2ZhQzRTVDdqRzVFMzdvZzZvVGJJUjU3UVV6YVhoQlRzNTFHZW9P?=
 =?utf-8?B?YXRNT2hjc1pvcGZ6VFZJMWtnakZyRWJJTFltTkRHbnhFcFJsRTZYNjFsRXBI?=
 =?utf-8?B?RlNyclBHUEtkUGRnMTV6dEZwWHdCbXpSMHg5VWo2UEJXbnh6ZHMwQ0FUcXJE?=
 =?utf-8?B?VDJPU2ZjZ3VkYWlWb0trcXkyaUhiMzJ6dDdCZzBuRDdKVldkbUo5bE9DZlE1?=
 =?utf-8?B?SWxLTExNcTh6cDNnU0ZKTk1hT2NBTjdNcWVvZzBPYk13MjFCT3JISkErc0NP?=
 =?utf-8?B?aTVJQlcxYXFydlZidmtxQko5aktGYUR2RFBBUzRuZmUzTy9VWVU1WWtEdHQw?=
 =?utf-8?B?SGpQbThIU1A2UmdVWFR0VnhDRFd5WEZjeldvZGZ5OFNGd3lQVEVvV1VGT2RP?=
 =?utf-8?B?ZithdlR2L3VMWEtVYlV6QUV3ZmRqUkZ0MkpLU0J5Y1pKWXBvTWFUcmVEUmlY?=
 =?utf-8?B?Uk9aOXlqNE1ZRCtBQkJBWU9SQVpBZGdWTU9CcDM3ZTNaeDZGd0EwejhvN0dH?=
 =?utf-8?B?Q3pNbjR4R2xOREVHZDVMYk8ySGx4ditpYkszS2xrYy9TeHo5cGFlc2FMWDdQ?=
 =?utf-8?B?eUlPamNldmdJUWk1SXR1c0IwenNod0hsYXhydDE2UVNLelprWDlSNE9sNnRr?=
 =?utf-8?B?d0FsK1Z6c1lxVnFiRWVaUG9YRFJDdjlPMnBaN0Q1S3pZM0JkY0dINjhIelh1?=
 =?utf-8?B?L3VsQ1hWTzJ6bUMvTWpYZU9aQ3dGREZCanlJVWIvMnJNd0hMaVZRWVA0T2RN?=
 =?utf-8?B?OTRCWnphWVdoNnkzOUwrVzdYT1VxK0dtRTRNblRjelgyS29rdWxvZFJaaldV?=
 =?utf-8?Q?QGgsA00Vgd54h0oVU3v8bjSGA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e69e3eb-7194-4c04-6317-08de159b83d1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 20:58:01.0686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+ZkODTAbDKJQHen0WFK+5nPa3G0aLQnyX7dexcsWllkUm9k3wEu3itDqXduUWp9QFhYhsctzQg9P5A1PBAGZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8577
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_135806_261054_697BA146 
X-CRM114-Status: GOOD (  13.06  )
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

Remove the .priv_xfers() callback from the framework after all master
controller drivers have switched to use the new .i3c_xfers() callback.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master.c       | 17 ++---------------
 include/linux/i3c/master.h |  6 ------
 2 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 16a480865ff4a28857f1ea6df33dbe4a66d1468c..ad9714247161121a7de2c97ecf8302e58f6e7957 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2821,14 +2821,10 @@ EXPORT_SYMBOL_GPL(i3c_generic_ibi_recycle_slot);
 
 static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 {
-	if (!ops || !ops->bus_init ||
+	if (!ops || !ops->bus_init || !ops->i3c_xfers ||
 	    !ops->send_ccc_cmd || !ops->do_daa || !ops->i2c_xfers)
 		return -EINVAL;
 
-	/* Must provide one of priv_xfers (SDR only) or i3c_xfers (all modes) */
-	if (!ops->priv_xfers && !ops->i3c_xfers)
-		return -EINVAL;
-
 	if (ops->request_ibi &&
 	    (!ops->enable_ibi || !ops->disable_ibi || !ops->free_ibi ||
 	     !ops->recycle_ibi_slot))
@@ -3033,16 +3029,7 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
 	if (mode != I3C_SDR && !(master->this->info.hdr_cap & BIT(mode)))
 		return -EOPNOTSUPP;
 
-	if (master->ops->i3c_xfers)
-		return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
-
-	if (!master->ops->priv_xfers)
-		return -EOPNOTSUPP;
-
-	if (mode != I3C_SDR)
-		return -EINVAL;
-
-	return master->ops->priv_xfers(dev, xfers, nxfers);
+	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
 }
 
 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 7e22f9d2a2ca3f4ab808db50f809efd192c795cd..028696abd61abc4bde73a04a1f291db874f2292c 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -417,8 +417,6 @@ struct i3c_bus {
  *		      all CCC commands are supported.
  * @send_ccc_cmd: send a CCC command
  *		  This method is mandatory.
- * @priv_xfers: do one or several private I3C SDR transfers
- *		This method is mandatory.
  * @attach_i2c_dev: called every time an I2C device is attached to the bus.
  *		    This is a good place to attach master controller specific
  *		    data to I2C devices.
@@ -474,10 +472,6 @@ struct i3c_master_controller_ops {
 				 const struct i3c_ccc_cmd *cmd);
 	int (*send_ccc_cmd)(struct i3c_master_controller *master,
 			    struct i3c_ccc_cmd *cmd);
-	/* Depreciated, please use i3c_xfers() */
-	int (*priv_xfers)(struct i3c_dev_desc *dev,
-			  struct i3c_priv_xfer *xfers,
-			  int nxfers);
 	int (*i3c_xfers)(struct i3c_dev_desc *dev,
 			 struct i3c_priv_xfer *xfers,
 			 int nxfers, enum i3c_xfer_mode mode);

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
