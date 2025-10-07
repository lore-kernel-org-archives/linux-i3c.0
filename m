Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A8ECCA470
	for <linux-i3c@archiver.kernel.org>; Tue,  7 Oct 2025 15:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WOZTJj3fr5fdR3fP3NcvGtgzJz92brOfnR0gFxzX2iI=; b=yx94PLPKB7znX4JBGA587eRUw5
	8CKamw5nwW6rmdsDi/RF4ut3VAtBCn0wUbNYL+BVwQXdWXGCaieRArRcUVB4glrxmAzTqJyMCIED1
	UxEZVtVoSY1dA9Xd/ZzLsHvgdeNpYP4CY3AqT7+bPENM8Jx32MMetPmja18MDwLm7HQquVvF4Hz7T
	cpk9asgiUgJYxPGzCqADz+ke+hM7ST2J9le5XOzGVF6dCq7JMIlEZZeKnPg+yjXtl/ZocqmX9ZP03
	UapaneWcRTr/T9Y8ckODYA8mu7x0JtRonQ5SjxAHriTDGF530rhDqEBxG3BSftZqU+PA6WaUH15tg
	13hSdIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v69Wl-00000002HLm-3iQO;
	Tue, 07 Oct 2025 15:22:59 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v69Wk-00000002HGc-01fb
	for linux-i3c@lists.infradead.org;
	Tue, 07 Oct 2025 15:22:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcN7/3NRNpPszNfNvR9rtwNzA/MEyPcbRr/yy14AdyeFV/cLykEMcb9o37k/hQwmyujtLbIl96lYhX2CA6AAw2eS1oDU3zQOdj3SXwIi0uFtb+vYwfy/GIkBiYLv8bQq9XN3k/KXRVz/3mvBqM5cM2KMbVTQ/7/rHnCrbq/q5SmQEKxyhRsYmQqy+jC35d2WPR6lWO6Udih6lMvT0qk4NRH3Z6+I7WQpHrBPNaRzydc2PJscQOjhD32Be7QFZ9VnStP4rPQqNKu7I4V/O/rerw6SfaDwkCfARr31zecl3shh8LYh+e6sf+Udle/LEdUPLrGoPH5HjfEZyapaWdbFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTm35wJWxfE/WuxTJ6c4Nb3jDUh3qajo5MQvh+ik9+I=;
 b=vmhCYHbx8xaXnJzcE4jsKry/e2Clv1orDrDL5tL9dyl3EdGyxcqR8G6fzs2CiUhWU3OseUz9lPLe+UG1Xtn5jlOvNwgQugsHrUgft/TxINWMosgsSBbsHPDFI645G1z+OG7HzJUZxuxFPtyJUrIKoIj/aEaUfcThcUTIM3S2uZucfyME73reaMVI5LDep6Riw1pXfdrZ0UzkobhkQef1Zo8aS7XkQLMsso9uwKnM0QJVa3PDbFFVA6hU+k9l+kiNrqS5LZQ7PO3eiDmRoDjs/kpG36LKteA2SFz7b/8ooqzgh055I208cVHoa23nrfWK56VUyBP4CFLsBzGqZ/cp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTm35wJWxfE/WuxTJ6c4Nb3jDUh3qajo5MQvh+ik9+I=;
 b=Ckcz1NSo8JPN3hxK9tulWY8A4bEtrTaWpeE6QsmHmWg1oNlXRI95MW+nSLnaL/NUeKUIPme3FvhM6hVMbTb6ryqHq77XAy0mqhi04KoqFni0LTf4zmFBnfLXFx1xo/IuEbBurYUKbhFyceXxFUE5OJTF2VptJE3V6rOpc3d20Jf5p8a+9mMIrCf4vFE2NXC0mPnXdMejlZIg5zWoWyDnAjugVeHw+pBQA2iMTcDHog0MWYgq2NJ0/XN0YzpSK2A9qNiCEYFBzMCqCpPjca3B8LcpAmEZHoqVvUTg+7+3kRf6jRCeMprgGplJeDJl3wi83n4SYW6P+hP95LJC6qA9iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAXPR04MB8573.eurprd04.prod.outlook.com (2603:10a6:102:214::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 15:22:50 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9182.015; Tue, 7 Oct 2025
 15:22:49 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 07 Oct 2025 11:22:16 -0400
Subject: [PATCH v4 2/5] i3c: master: svc: Replace bool rnw with union for
 HDR support
Message-Id: <20251007-i3c_ddr-v4-2-3afea5105775@nxp.com>
References: <20251007-i3c_ddr-v4-0-3afea5105775@nxp.com>
In-Reply-To: <20251007-i3c_ddr-v4-0-3afea5105775@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-iio@vger.kernel.org, 
 joshua.yeong@starfivetech.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759850558; l=2992;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GjLXL+gm1jWYNKCEbJdOq+74VWMbv2IY9wXQMF6gNPI=;
 b=Moyd1NyY0fzIuLhlxmMqucutEmTG6yYCE3yIcxPVIJpAX0RG+a6EpwQROCglSa3OCJDLjz1vJ
 ar1iwxCqhW6DLQrNEdxO++Cwgopao/+u5xhm0LQCALlMxDbM2VQ5QAU
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::16) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAXPR04MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a49c80-7b47-4383-7097-08de05b5603b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|19092799006|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjBDUlhmemlPYk0wMFV0Q1IwQUNNQTVYSVN0Tm9Qc2RUVld5cHNQdkppSUR2?=
 =?utf-8?B?RE1NbnNlY3V1eUNhYUg1L1Q1ZDZrZ040cGtXWGk3bzhxUGFKU0IyTzBaazkr?=
 =?utf-8?B?SURId1o5NUFpbE92UlpSVllrWTA2bVYrejRhaWErL3FWWTZPNGVzOGJIUFJ4?=
 =?utf-8?B?K3BBVDNyQmd6cVBGQ25WNGhPblNpY090dXdJT0p6WmFWRTJpbXU1ekowNnNj?=
 =?utf-8?B?Z3doemlhOEFyYVVQVm1Bd2RhaUNCdFc2OTBYR2QrNFk3YjlLd2YzS3VVM2xK?=
 =?utf-8?B?aTNEWGtYekJsYnRoMmV0RDZ3MUpMekZjRDFoYVNtYXIzelVvZkZDR21wWXBN?=
 =?utf-8?B?TmMxUnVGRXlhdG1rcCsySGhRenFKWVI3anZYTC9KSTRKSXpFZEhEYzA1L1Zp?=
 =?utf-8?B?WUtwc1V4NVY5cFVUdEN4a1RsdXZNb2Jmbmp6VGJ2bjZCanV0eGIwQkxDeWlR?=
 =?utf-8?B?R08wQWwzM2Z3TDhLVnlEMGo4cHQySDVXVTRkTDhoYW5zcitUTGVRMVF2SGhE?=
 =?utf-8?B?ell4OXZnQzBoVHFZbnZjTUp1QmVWcTA5RUNrZG9JSTRIQ0xreWRjK21ZWk10?=
 =?utf-8?B?a0JGTGVYM29kNTAxZm5qWnpDNitDNG95V0NFTHh5bmZmaGoxQUh0eFlVVDZ3?=
 =?utf-8?B?T2tTNFJaVzU5dVFZcFZ3QlkzOHNxYjV1OTh5SU5EUnlLalVPbldqUWcxWDBn?=
 =?utf-8?B?eTVIVHJ1Z09lakxoeWU5bldjYzVuWXd2bzk5V21SSjJxS3pQVGRMUDdvazNO?=
 =?utf-8?B?UTNtOUJjaE1ibmlCZXJhcFdkVnMyZ04wRDVZYTRHRzlOc093L1Fwczl3a1Vl?=
 =?utf-8?B?NkMzWUtXcjZ4bTZBT011NDJNQnpOQkxjNzRTUzlFeFkzRG0vUS9UVENPZGgr?=
 =?utf-8?B?Tml2d2k1Q2JRMDZHQ2VZUzVnYUppZkM1ZE1lTVZJSjVvNFkrOVVZalRWRWZJ?=
 =?utf-8?B?UitNRkxIZTg5Rm1IQ1FReVNHQ2JYWmVzMGZ5MVJ1ZkFja0dTd2kxYWR6ZGN6?=
 =?utf-8?B?WUlUakUwSE16Z2dBUTVFUStKUEdQYklrbzBqMkMyeUtLamE4dnEwWmJGSWJ1?=
 =?utf-8?B?UFZWN1BQNStBRldTSGpnZjVySDRFUDdDYWtRUlVtTGd0eXN5WHdRR0hWdjIz?=
 =?utf-8?B?N21RbCticnR2aFgyeXJBdnhUMWExaW9YcEc2cnZ4R0lTOEFiM3lyVGxQS0Rx?=
 =?utf-8?B?Q2UybTNFRU5TY1FOUm8wRWhlMFRucWpOcG1pODhmRDRCbUtPcmRkYmlZY2ZZ?=
 =?utf-8?B?SUNTNkE0cFFYRzNTRlYyY0ovaFBBZloySlBHRUVMVXZtaUVqVXN0NHJDd0U3?=
 =?utf-8?B?bThYNWxWbEF6Q0RuQjFGbDVDcUUybllwME1aTE9UdU1mRHAxZWhibFViYWI2?=
 =?utf-8?B?bUN6Y2dWd1RFT0V5N2FTZEN0ZkdBRzdQVk1TbHFjRU5Wa093ZUdKd3UyYWZu?=
 =?utf-8?B?aUFtNGVSUGNVSTBuTW9CdFdERzJoeUFwSVhoTm5IRlpEc1hPRy9veC85WVpw?=
 =?utf-8?B?N0NnOGEzYmZxQlZ1OHVtK3l3VEtIeHdoVVBkc1NIQVlvYmNKSitHRnJaZzEy?=
 =?utf-8?B?UE0ySVhiMmNYQ2NJVVR3Qng5dWxCTkludnZia3hUTm0vZS9aT3VWemNJeW1i?=
 =?utf-8?B?S09xUTVnK1VGdUFYM0QyNEh3TDJIV0ZmY2ovallKYjhBb2lOa2lpaUR4Z083?=
 =?utf-8?B?OVVyOTJGUXdsKzNNV0dsa0tUL1p5STNRelFiaEpPOG5RWUdrN0haTU9sUGs4?=
 =?utf-8?B?ZGdHWkpzR3JDeGdITWxGWEd2NmUvMTdnaHZRajZVVDB0V3gxUkNpOVVhNXRS?=
 =?utf-8?B?VU81YmcvSFZPMTIyNGd0blFhdjVPWjNEc0dHMkQ3cjVtMmFwQm5MZXR4ZTJy?=
 =?utf-8?B?b2ROZ2xzS1k1cUlJNDRhQjBpZDdaRHpOYjM0MkJTQVVnQTRYZnBYV1ZRRTJU?=
 =?utf-8?B?VmxjVkRJWE0xMTlwWlJqNVBBTGF2Wk80TzcrSEFPbldVVWdBb2pYVERPeVk1?=
 =?utf-8?B?Qm14TXU2SkpoNG5weEpvbWYrdjFiSGhpc3BCSTZjTDVySFE4ZEcwelYxa0hx?=
 =?utf-8?Q?SBYC2O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXd4OEFYalVpMDQvUEFlTWpnTmgvc1RkbzhBYnNJL3ZRVkNTbHRJQ09acm5a?=
 =?utf-8?B?RXIyaGhzdmJUdCtCU1dncHFML3cxN2l4cXQ0YnlCbVlNN2lYK3AzUzl3UzRH?=
 =?utf-8?B?VU9lQTBNbVhRT2N0dHVtL3RDUUtKaE4vbEJVakxOa3ltcktTaHBNUkx2QnVi?=
 =?utf-8?B?QlF2eEt6czhLWnZxeWdCd1Y3UldoTDQ4MDZwMHRnclpLbXVXYjI2bkdEY3BV?=
 =?utf-8?B?NngyS3FjcjdKQU1LWSsvL1NIY1pIZjhZTnBhUkM0YjRaaW9ZVnZNSlJ5bGlK?=
 =?utf-8?B?U1NYanc2ZVBabDVFZDdObndpRWdUQVB3NDRMaWk1WFR4c2dpaXQ5bFRjM01Z?=
 =?utf-8?B?STFmWWlCUFBaSWIxUFB5TEdmc2VQRWpYbXk4b0lQWWlDSWVIY3JGVXdMdGEw?=
 =?utf-8?B?Uys3eFByTVIvc0lrd0pKUGgwcFMrNUZjVHJMVDhubjNWclBKNW1NQlZLSWJO?=
 =?utf-8?B?U1I3bGQvMXJwVjczNytCcjdJMm5VRWlhOFJzTUQ2TVBoZXc0a3lURkNYTnRz?=
 =?utf-8?B?TnlLZ0Z0WjFzS1R0OHJva2JYMFhYZzd0enByNlpxU1dOZDBSc3NQd3ZZT1R4?=
 =?utf-8?B?bjNFVnA1dDhXQ3FWWlJsVUMrZ3BVM2YwdjNSVWw4WFpTNUdWbXlrWWNlQnhp?=
 =?utf-8?B?OWhCUFNMZkk0SzBzTWtmaS8wQlhvNEtaOFYwanZKc2NMVHIwZm1JUi9EUWZJ?=
 =?utf-8?B?NGRGalVEMG81aEhDMDlQejNaUE5MZmtud0FHOFpzZkxGOUFVYXJiRDJRd0ZQ?=
 =?utf-8?B?VnhFcUM2Q29nRGdqWjdsUDNPK0RMWTg1d0VoMTBxeGRNOVFJSGNRNDVndGdm?=
 =?utf-8?B?UlRsS1JIa1VUQ0dvSll1S0xRcGwwL2dVU052QmZyN3RiQXVJUkExS2dxNjZK?=
 =?utf-8?B?Wmt6U3ErMHBIWGxzUXl5cmE2RlZ5b0I1aUk3Tk9rR05vREVXZXp2RGFIS2lW?=
 =?utf-8?B?U2hUenM4OVArUFRiODNRNGNKTTd5NkhSN2Q3WlRqdTJPRDhlSG1CWXJGaGFs?=
 =?utf-8?B?NDhZVkRWQmdhZTBTY1EwSWxVcE1udHdUTG9GeDRIRS96VnI5NGt1dHV2cDlw?=
 =?utf-8?B?bmFnVmNUeHdIcGlDT2lMMlJCeTYrcGNHY2lPWGdQSUR3MXpWcC9SY2Z4VzJW?=
 =?utf-8?B?U09tQlN1b2FrMmxWdld1aXJDZVJSa0FBcTY2R29sdm81VnhQSklzbm5nak9G?=
 =?utf-8?B?M1BnL3FFY0liVFlnZHkycnJvSXVNMEpMYWZic1Fjc3ZnSmgzcjVzYjBvR3Vv?=
 =?utf-8?B?dVQ0cDY1STZnTndPYTFaZ284WGM0Rmcrd056UnJFVUNCbU00eUxUUG5nZmhY?=
 =?utf-8?B?VUpJMEZrYUw0Q1Z1aUNTUEphWDVLWkptMmswT3RXL21Ta2E5ZS9jS1BGY0x4?=
 =?utf-8?B?YXRhRE5vZFVzb0tqaEx1REJnb1ZOS3dvMHJiLzgzbENCTmRvRkJKZ2VxQktt?=
 =?utf-8?B?YmEvUDhYaXNIV0kvTWgyYm5EdDFnUVZuNE4yaUg3NnROTjQvT2Iycit0ZEE3?=
 =?utf-8?B?ZjZkcGRvQW9Cdi9lempRbTlOamhNZFhWdmk4Nytvem5uRFFwRXBhMlJlOW52?=
 =?utf-8?B?VklkWW1rZjZXT1NyOTg5dXpkVDdOY3o0R1VzNGRjRm51Tm91cmpVYTJqT2kr?=
 =?utf-8?B?TG1kb0tDNGF4OVgrVmRYem10MUFoU21ncDkrUnJCZDRneERGOFppVFpnOEMy?=
 =?utf-8?B?eC9MSHRzdmc0Q1JSZlBFWWJvb2NDQzYyTzZNR0tSTUhjOVY4cUZLQW1wdUFy?=
 =?utf-8?B?NWs5dGVtaWoyMGNqTmtMb3E5WDNHTFBMSTR4c2ZoRlNSVmlRVHlabHdua29G?=
 =?utf-8?B?OGJaYTdlenE1UVFUS0E3RStIU2MzZDFDTE4zQXBoNHBnVk5yajgwZ3NQVnpS?=
 =?utf-8?B?ZFZZOHJOUStsOVdiRTV2ZmtMY3RKOFZBdVVzbGlxUEQ0Y21WRzJxR2ZqektS?=
 =?utf-8?B?WTdibFVHeUFXSUdCaXlBWWx6S2FqZFJRbTlvTjhjWDZqb3gzNFR0QXF1T1NT?=
 =?utf-8?B?eVVkYzd3b1hNMit2Ymc4M3p5dFNDYzJod2g1VU1iQTI4WFpsYjlFSFJBYkpI?=
 =?utf-8?B?cC8zbHJ0OGx2bG1na2xZREdvTnMxZlRRVGhxTnhlRXBuM0V6U2JmRVg0Q2Jz?=
 =?utf-8?Q?+rtaGN8RDn2DMtXYpUHcCedWM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a49c80-7b47-4383-7097-08de05b5603b
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:22:49.9117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2afT+hrfhCaJUTCVyzckQnlEx5ENFLaYu3YKm9QgKqIwMcGuR/rc+lYgLBRjtHFLB3aZuPxTqdJlA2VtvlTSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_082258_051946_0FDEE449 
X-CRM114-Status: GOOD (  12.82  )
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

Replace the bool rnw field with a union in preparation for adding HDR
support. HDR uses a cmd field instead of the rnw bit to indicate read or
write direction.

Add helper function svc_cmd_is_read() to check transfer direction.

Add a local variable 'rnw' in svc_i3c_master_priv_xfers() to avoid
repeatedly accessing xfers[i].rnw.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/svc-i3c-master.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 701ae165b25b7991360f3a862b34cc1870a9a2ba..956172dc9d5f1f54d76b4c2917f2d9cf3bd21a85 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -165,7 +165,11 @@
 
 struct svc_i3c_cmd {
 	u8 addr;
-	bool rnw;
+	union {
+		bool rnw;
+		u8 cmd;
+		u32 rnw_cmd;
+	};
 	u8 *in;
 	const void *out;
 	unsigned int len;
@@ -383,6 +387,11 @@ svc_i3c_master_dev_from_addr(struct svc_i3c_master *master,
 	return master->descs[i];
 }
 
+static bool svc_cmd_is_read(u32 rnw_cmd, u32 type)
+{
+	return rnw_cmd;
+}
+
 static void svc_i3c_master_emit_stop(struct svc_i3c_master *master)
 {
 	writel(SVC_I3C_MCTRL_REQUEST_STOP, master->regs + SVC_I3C_MCTRL);
@@ -1272,10 +1281,11 @@ static int svc_i3c_master_write(struct svc_i3c_master *master,
 }
 
 static int svc_i3c_master_xfer(struct svc_i3c_master *master,
-			       bool rnw, unsigned int xfer_type, u8 addr,
+			       u32 rnw_cmd, unsigned int xfer_type, u8 addr,
 			       u8 *in, const u8 *out, unsigned int xfer_len,
 			       unsigned int *actual_len, bool continued, bool repeat_start)
 {
+	bool rnw = svc_cmd_is_read(rnw_cmd, xfer_type);
 	int retry = repeat_start ? 1 : 2;
 	u32 reg;
 	int ret;
@@ -1463,7 +1473,7 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 	for (i = 0; i < xfer->ncmds; i++) {
 		struct svc_i3c_cmd *cmd = &xfer->cmds[i];
 
-		ret = svc_i3c_master_xfer(master, cmd->rnw, xfer->type,
+		ret = svc_i3c_master_xfer(master, cmd->rnw_cmd, xfer->type,
 					  cmd->addr, cmd->in, cmd->out,
 					  cmd->len, &cmd->actual_len,
 					  cmd->continued, i > 0);
@@ -1656,14 +1666,15 @@ static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 
 	for (i = 0; i < nxfers; i++) {
 		struct svc_i3c_cmd *cmd = &xfer->cmds[i];
+		bool rnw = xfers[i].rnw;
 
 		cmd->xfer = &xfers[i];
 		cmd->addr = master->addrs[data->index];
-		cmd->rnw = xfers[i].rnw;
-		cmd->in = xfers[i].rnw ? xfers[i].data.in : NULL;
-		cmd->out = xfers[i].rnw ? NULL : xfers[i].data.out;
+		cmd->rnw = rnw;
+		cmd->in = rnw ? xfers[i].data.in : NULL;
+		cmd->out = rnw ? NULL : xfers[i].data.out;
 		cmd->len = xfers[i].len;
-		cmd->actual_len = xfers[i].rnw ? xfers[i].len : 0;
+		cmd->actual_len = rnw ? xfers[i].len : 0;
 		cmd->continued = (i + 1) < nxfers;
 	}
 

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
