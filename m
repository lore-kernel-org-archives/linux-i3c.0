Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18343C52D7B
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Aug 2024 15:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1k4yxfb2w/Oo8ZGiwBqOByWgv6MLTE2xAD1uQfgJF6s=; b=fLWk9thcQGyhx9n896uYbFZhG1
	L7kCYypAH7yz9JPKO+CQ1gz09wdQJalcieFtHGVJFlsAVZyOpCH/+vG3ruzpid23yNzB7sRrmzesa
	5G/Ljbit6zYspEH9ZHpcidSaXDPo99s7ChAYaYG/GwNR/Q+2zh7+3ST+HEwOSDzGeVey2qbZBj698
	EynHmqVxi9CBDHWYj6uimbNxZe+BjSiFiCiyA5I66g4bG5KwA0hoRijBtBe8t/f35+rvc0XMVmFXM
	xsgJjIZ9gX1PwqsWmhpxsDgXmW2JVirXvc7SN++LrCigJjvgcVgE5s3AcQTstKu1qYAnYk8ZvqV4H
	Dvb/uXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdtFa-00000004AtM-302h;
	Tue, 13 Aug 2024 15:15:54 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdtFX-00000004AqM-3d4q
	for linux-i3c@lists.infradead.org;
	Tue, 13 Aug 2024 15:15:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFQtB3Dz2KiNzwqWcdQ3Rk9CyIR0FXVeuQs6WWTMN/U1XvIMTZqPhwYxdSHLDWwc9bV955snJr0aGvySn7bYerCONxDe31LuKEawdQW5jX6auKaajBiW1byH5bHJo14/XuGF6cwRZYtzqDbbSIs3Z4jgwfotBijp2udtsDQb3tmp2MTaPgj5hf/rxITlMOZEPMcjna7qVIRUFwEJeR/QnW0m3hyt3y95yCrU+9iMibfoZBhXI5OI0cs8AHiBSPUdinh6We1v0udcLI7BXN36Zy6QoYTtw7iK5C1xcGC0bxnIyYlLjoDzWOtOExbmXJVMz9ospV2NDcr5ybPo41c+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2ZAcKNPuQ4Cy7AYm+SAGciuweTjZACn9ZhCaMcypok=;
 b=m7UgVRutpj9uCbFcNL4HBiWCV4zxAvmbMQ5NJuL0okHar7BkEcKUIC6P1OLdd/HcR17Jf4xL8kKfxYsvuiIx6qJDfS2JUjBam4cW+yf0sbJ4N3sD1L2DleHQO4mkjUyVv4B6MkqehxD+I36R9Rk9KoLxbr7LshFUKGisSlGFOzH6G1W1cT+rnXqnbqZkITK8cnO34G/ZyG/jN+d/fb2zbI+sWyVatkly1Nvu6SItK1WsrGJ/2facJSKDfeWLWsir5h1ngSXZSZGawi12KRVZCaPJDECZ+xF8oMG3+k54y41UTe18bRoNqqqKmgY4L/Fkzg3ve7gLlplhysGQOQ55YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2ZAcKNPuQ4Cy7AYm+SAGciuweTjZACn9ZhCaMcypok=;
 b=LwTvsyxQF96aHqNLG/xGKqyDbskce7/tKB8/zGBjbhMLxIiJAbuLyDix0xoO8SWURabRyF02SXKCMjgGfZbKaaoAojVytRq18d/RvoByY+pmFWp/kht3vvmFCT/KAglVkuT8yV/VtdXhD9w8CeKXItkbsG+tiKlrPVvJm/jXGeCRbfLQhw/IPOfPeV7vNqpSA7sFw5ohf7ENwAoKCafhbTp1jlcR7eW3aVfIYg5uFmsuf2SLnoNtXdoIJR3IMi6WSJeEq7f5VfkF7p+Y4rf/N7Cf0/H3h5IHeUxUtJ6+gVzqm0wdBYormlHctoXsSxwG2wqE8+MJEzPoGO8lAS4Rrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8404.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 15:15:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 15:15:49 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 13 Aug 2024 11:15:07 -0400
Subject: [PATCH v2 09/11] i3c: master: svc: use spinlock_saveirq at
 svc_i3c_master_ibi_work()
Message-Id: <20240813-i3c_fix-v2-9-68fe4a050188@nxp.com>
References: <20240813-i3c_fix-v2-0-68fe4a050188@nxp.com>
In-Reply-To: <20240813-i3c_fix-v2-0-68fe4a050188@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Parshuram Thombare <pthombar@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Culhane <conor.culhane@silvaco.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723562115; l=2350;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=eh2E0Be8sY7V85u59um2EkSafUz25sxM0/X2fX2jZpI=;
 b=KVffYwONNtB61AwYdgCAIBUQG1jaeTJPQMAjzDh+ru/mTbBsHvs3e4+U4uKHDbeXf7nmCEPTy
 PrFWUKWmKjvAYr+aBMxsiAnghPVV1kBpdFri7AfsAvWaIElrrx137nI
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0125.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c5e51f-8aa2-4ed9-8168-08dcbbaad05c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WldHWjFlNDIwOWZUUnRRbXRURk1kTlloaUhyRmkzaUlOY1ZZSnRFREw4TkRr?=
 =?utf-8?B?NWFLM0oyWGJ4WkYva0JWRGpTbllsVy9hMTdEK1Y2VjNaU0ZUeW56b0RMaysw?=
 =?utf-8?B?by9UbDR0WkdVZDRCQm9BcmlHMUI5dVhyZWU5dnpQc0VVQlF5TGIvdkd2OVhX?=
 =?utf-8?B?K21PbXBLUFd3NUNZeHlHQTBGU3hJNmNMdjdVL2FCaXNiem5Qamo2blViVlA5?=
 =?utf-8?B?QlhUSEVGUzZGczQ3OGhWcWN5d1lUcHl5NEc1Q3puWld1K2c1UlU1NHpoWXd0?=
 =?utf-8?B?WHZ4dk9xR29KUTVsOG9LTFRuMDFMSjczVnhpd2tNdkMyM3dTdDE3U2tNQ05l?=
 =?utf-8?B?Y05VclRuTGNRWitxaFFPQWk1RUpQTnFRU2ZUQllkTmlOdE5VVDJlUEVrS0do?=
 =?utf-8?B?Y1hWTUR6Ykl5RjVmOTVCcTZWOWhFamdVcy9SZ0kxMHdhWTEzQk5Gd01xTzh1?=
 =?utf-8?B?OElLaWtGVWJ6MVdtREc1VnlxN3RyYTdnVUMvbERoQXJ6T0c0azNSbHZQaFlS?=
 =?utf-8?B?OHcwWDR6OWhPTXB4MzVkNEQzYWNzTGFpcjJTOXdGclZLdUx4dW1ERjlZTnVS?=
 =?utf-8?B?d3pvNGo3OFdSY25sKzhDUER6aGw2SnRiMVZxVFdTcUdrTjUwY3ZzbHhEbUlS?=
 =?utf-8?B?OWdrcm14cWI5eHNFMFdQb3dHeFlmbElLbWhrS2E3Q3lGNG5vOGhsVUlDZlpz?=
 =?utf-8?B?ak9vNElJSW9aTEZLRDNuRXRtbmFTVFhTSDMxYzZ2V1cxWVg2c1lDbDVBTHky?=
 =?utf-8?B?U0dmVmdSY3gyNFc1ZFR5eTJ0dEZPN25pSi9weHgxUHI1dlZxTFBYWHpXYjlX?=
 =?utf-8?B?bkhMSXNabEh6eml1eFllYjhGM216Kzk1cnZrMm90Yk04WS80Y2prQm1kZEJP?=
 =?utf-8?B?VHZrN0RacWFaYWRVS0piTkRVNUpDNnYvZHFWQUc3K3NjNWVJNUpUaGl2dXF6?=
 =?utf-8?B?dkZKaHAveGk3cGpibDBXWkk1dDEyQUxVU05WUjlTNFpmRG1CazRuQ0o2K0tZ?=
 =?utf-8?B?aENPR25TZjlPT0xPY1NxQUJ3VzFaR0o2cXBpdWVwUUpqNUErdWRvWmlwTkwr?=
 =?utf-8?B?V1hMM0pCa0wxV1k4L01DN1FvTHdvZTNNQmpHV0xqL1RPcEhsVmdFNWtCMncw?=
 =?utf-8?B?bGRPbVg4ZW9xWTBWUXIweE9rYkFtSjVmRmFkdjF3T0tnUkJ6bjlkb0Z3VXJR?=
 =?utf-8?B?ZGxoL0d4WEk2SHRkMUY2TjRtV201bmpyV3QzM0ozSlBHWjhXUHhxSm5Qb09h?=
 =?utf-8?B?akNGdVJvUUNNUS9HaTlIK2N4VXZsWHpZbzUvTytBblY1c29XM0Y4Y1RsLzZI?=
 =?utf-8?B?anZGamxDbjhCc0diZnZRY2RYODJxajFhck1BMmJsSXMxTWVNeVdjVzZmMDhL?=
 =?utf-8?B?amhVTC9BQVRScThKY0gzSHgzbjc3ZTBPeGhCc3BkU09lenAra09jbnpkb2pj?=
 =?utf-8?B?VU9sKzBSQ05pMzFscDRGNWJHbkdoVUlJcXR1N2JCQ2hlcGxCL3lTankyeExh?=
 =?utf-8?B?MDNBb2Q1RDlTVCtHaGtRL2FyOVNtUGlPa29GODJWZ0pmdVFkaG1jN0hybU5q?=
 =?utf-8?B?Um55N2RKQzlIdWw1UUMvMWR5SjFMUklpaTFwK1hBVitJUHlVVUlHMzlJQ3Jy?=
 =?utf-8?B?VXYxRWUxM1NaVTZRbzgyNVg1TFFjOHFYSzFFQ0ZScDlWSVhTZDVHODcwSXNq?=
 =?utf-8?B?UTlkTWJrM29xSDJFK3Nhb3hmaVo3Y2lBaitIdi9RYkcrcEZHWjFyV1ByS3BK?=
 =?utf-8?B?dlpLbk84TDIxeVRvcUV4MGw1bWRaRGl2NzNHM3pvaWlsb0hWdTFiczUzSytV?=
 =?utf-8?B?dUEzM0tLS21PQ1RxdnYremkzZVBYcDZRb2hFYVVXMm1QbGxqeXdSU3h0aEp2?=
 =?utf-8?B?Nko3b1FtWmJXVE5JSjVFTnVLYTVDL3kxc2h4bm5WKzB5ZUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2xUSlB2MTB1b0dLQkd5UVRMOERMakhYRll6OUhZZmVoR1M1Zlh1SXhFZXVr?=
 =?utf-8?B?U0NZVEdCcFVkQmR5WW1UZHI0LzAvMWh6WU9IM0JJeExHRUcxV2dmT1U5WWhn?=
 =?utf-8?B?OHJIRFNyU3B0Rk1ISlI4RGlzL2tNWVpMdWc0WFNLV2ZGc1U4U2hDRGRKV3ZJ?=
 =?utf-8?B?UHY5R3piOW9EVUhpUVFpMmRITlRuMHBpMnovZkY1ank1eDduY0NlMjlSSzlU?=
 =?utf-8?B?bzlZZjdQcEUxdGZrelFacDYrNllqMERaOG1YeWZyUVRobVliMDdLWXkrZ0c2?=
 =?utf-8?B?bEdxNFU4UXVLWThUT0RwL2QvK1ExUzQxaU1LdHBhUFBlWVoyaVZ5cW1aY2dI?=
 =?utf-8?B?R3Q0Y21WVCt5T2daNzZXd3Q2WEtSL3VrV2padUV6RytleWQ2UUc4VnRjSnEz?=
 =?utf-8?B?MXg4d3FJT1puKzE0aTM3U1k5WEFrcGxCRnZYNW1GazJocC9wRzNRaCs1MVRL?=
 =?utf-8?B?Nm1DZkMwaTJ4VC9PSFlhb1RNRkpGOVVTczVNQUUxU0h3QmJDZ2ZaRExyNkgw?=
 =?utf-8?B?RDlqaE05MUsrWk9lU3F1L0xSb1JhOUk2cFlWUU5KTGlFR01CVGkzZzRLVUpX?=
 =?utf-8?B?QU9uRnk2MHFWYzRaSzBaN2lRc1JUUXpXdTRTZGpPbk5oTER0RnVPSlRYMGtV?=
 =?utf-8?B?aE1qWFRmR204SWFSWitxY2g2d2RqdE9zWDBpUjZ0MHBFZDJyV0FSVDF3dWQ4?=
 =?utf-8?B?Qm5yd0RjK0dBUjJhWmhWTU1tQjlyMTR6ZHgvQjFFUnpEenl0Sy82S3BSUkg1?=
 =?utf-8?B?Qk5KRFRPM3Y4ZW1sUlQ3RFZ4SlFCVDFncVI3SUtsOU85aHZkeW1JVE11cTVr?=
 =?utf-8?B?WXRVcGVnRkFZQXd2cHJ0NzAySlVXZ2lUem05YTNMV3RrVDVoYnMxVTN6bzZF?=
 =?utf-8?B?WFQ1Z1lmOXB0eGpCVHByY1lwR01aUGxPOFhmZnZ0VGpDSmw4UERmeE9SVk5U?=
 =?utf-8?B?STd5S2ZDTXJGS09CeXdWNWhNWUMrcWdMVGxwY3pPTXNjc1piOWFFb04vY2Jw?=
 =?utf-8?B?TDBYODdZUWY3SW1CY3NKaXdqaVJ4N05wYjB2b0MzOUpzU1JlZXJDcDh5M2t4?=
 =?utf-8?B?OEh1N2F5Zm1rR0JieVBYYkdld01vT0lMRXhaREY1YXo3dGFsRVNQQ3REV0tU?=
 =?utf-8?B?WWl4RlhHSS9HUGlYZEpIUk0yQXl1L1dnQUhJM0FXdjdsc0lFZGE1M3l1UTc2?=
 =?utf-8?B?UjJRdDhXOU1PaEVyQkJtRUkxS29pdm1KM3VKTllsSGU0aGdjdFRtL085Z0xP?=
 =?utf-8?B?NldmVnFwazlMWXR5L0JvclZuUjV5cjlkN3AxWjNWdi83Tk1CRW8xQ2VBQitU?=
 =?utf-8?B?VVlwWUNvZnlhZ3dLSVhscnBsa3RCZjBxTnNBV0RaaVJQcmZFS2xNMDFEdjBC?=
 =?utf-8?B?VU1SMmd6YWRxaXhVV2V1eGVUZGFkVVJZaGFNb1JwZVJVYVVyekNTR3VLNHRJ?=
 =?utf-8?B?TzM2Wi93QVlQZmYySlFnWXdQZlAveU8yQ3RBdEZGbW4vd1IwSjduTWdVMDZo?=
 =?utf-8?B?a0wydGplNTl1U2RwUDlvME94VzU1ZWtCOGUzUGFBQ3NGQWUzalcyeFUzR1Rl?=
 =?utf-8?B?L0VpU0toV3ZwSW1CaERqbSttQVNrSWQyMkVsMFV4QTF6NzM4Szc4K0MrZmdo?=
 =?utf-8?B?YUlMbVdERi80bER2dEVYQnNoUGo5S3FxZzB0dXJ5MkhHcXJJZnpGcW1HaVB0?=
 =?utf-8?B?UXRmMTBtUW1CeExwOXAwS2liT0Z5OXRnMWNvaUhrZStZaUUvem43aTRDaGJL?=
 =?utf-8?B?dkJBcWpyUTJLeFZYNEkwa3ozL05QQ3Y0dHh2YnZCdUVHK1BaY2VvVG1CNlh1?=
 =?utf-8?B?aXBCY0RoTm5WUDdOeFl4cERlYkwwODZOQ3FFUnpMRi9VNTZsRDYzQUl4bG0v?=
 =?utf-8?B?MllUV1R2dGhIWkNzdlMzNDhvUUsxcTA4L1ZJdkticy8xZHdkeVAweWkwR2M2?=
 =?utf-8?B?WS9GU21zOExDNlJRdUk2WnlveW9KdXZIWjlOTlcvRjFwNzBjeHR2Q1FxamF3?=
 =?utf-8?B?dDBDUzdCVW8zOUJ2L3hLbUUzQm1kbGFTTFVDOUVTZmEwWitnWWdONnZCSGd0?=
 =?utf-8?B?VUwwTGlRZC9ZSDZhSWp1Qi92Q29Pa1BMNjBlY2doSDJ3T2R1dFpDNjh0V1hB?=
 =?utf-8?Q?5Xsw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c5e51f-8aa2-4ed9-8168-08dcbbaad05c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 15:15:49.5226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Tq/qbQdZboThQLEV6Xiw70pkISKpE4TsFpyQHL2F0olXVwBpEAV15uIJf7yc9aMYz9vaaLxrgq5y9+iAdN09w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8404
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_081551_955501_313EBE79 
X-CRM114-Status: GOOD (  11.55  )
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

According to I3C spec ver 1.1, 09-Jun-2021, section 5.1.2.5:

The I3C Controller shall hold SCL Low while the Bus is in I3C/I2C Transfer,
ACK/NACK Phase. But maximum stall time is 100us. We have to disable irq and
schedule during whole I3C transaction, otherwise, I3C bus timeout will
happen if any irq or schedule happen during transaction.

Replace mutex with spinlock_saveirq() to make sure finish whole i3c
transaction without stall SCL more than 100us.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/svc-i3c-master.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 161ccd824443b..fbb6cef405577 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -432,7 +432,16 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 	u32 status, val;
 	int ret;
 
-	mutex_lock(&master->lock);
+	/*
+	 * According to I3C spec ver 1.1, 09-Jun-2021, section 5.1.2.5:
+	 *
+	 * The I3C Controller shall hold SCL Low while the Bus is in I3C/I2C Transfer, ACK/NACK
+	 * Phase. But maximum stall time is 100us. We have to disable irq and schedule during whole
+	 * I3C transaction, otherwise, I3C bus timeout will happen if any irq or schedule happen
+	 * between transaction..
+	 */
+	guard(spinlock_irqsave)(&master->xferqueue.lock);
+
 	/*
 	 * IBIWON may be set before SVC_I3C_MCTRL_REQUEST_AUTO_IBI, causing
 	 * readl_relaxed_poll_timeout() to return immediately. Consequently,
@@ -452,7 +461,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 	       master->regs + SVC_I3C_MCTRL);
 
 	/* Wait for IBIWON, should take approximately 100us */
-	ret = readl_relaxed_poll_timeout(master->regs + SVC_I3C_MSTATUS, val,
+	ret = readl_relaxed_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS, val,
 					 SVC_I3C_MSTATUS_IBIWON(val), 0, 1000);
 	if (ret) {
 		dev_err(master->dev, "Timeout when polling for IBIWON\n");
@@ -525,7 +534,6 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 
 reenable_ibis:
 	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
-	mutex_unlock(&master->lock);
 }
 
 static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
