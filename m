Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6429CCA472
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Sep 2025 19:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WOZTJj3fr5fdR3fP3NcvGtgzJz92brOfnR0gFxzX2iI=; b=otUyrc0vTmL84fDc874Lrul+rs
	ZlxbHjXEcjn/9xha84c9oLC6hxiVX5wopXooPM8VxsxdlpIWI6ouEV3lOhh2zbguKdSWc6IsYnc2B
	Ry9DyonQsQG+FDGUQj2VTqQsqKGGAHoGWBxPOpybxno+pVl/pnjIFnbcT6T+EuM8WkeU/U7vxp0I7
	dRp+dPTnrY7Xh6yLWKwDmW2n6E7PGb0U7rHsZogbZyxFyhTS0d2FgjYDiNP8xrDICfAcakjXLJJzC
	devwYAueGwkqcLGbgg0SVVRYKiKmPh4XNDGOne6lHAo/ObnM54fEs5+qh24IZ+idtmf7ZdJP6quP2
	U74FMkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3g7q-000000065FM-25SB;
	Tue, 30 Sep 2025 19:35:02 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3g7o-000000065Bx-2xPi
	for linux-i3c@lists.infradead.org;
	Tue, 30 Sep 2025 19:35:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9JxPuaxsMe858ToXM8lfKTS6yCp6ra3dOgOX1QQb8c7Y2eAIMwT2VewgiOcAMtH37D4XTe64Z70lUUsbdi33qlJ8O9wxvk9udDpntDNO2ZJPdqal7ha4O8CKZn+VinzmEoLb3QWJbw0QxrPqFkzF44cjnny15axQwFK+fOuYw2DK0aR+1qer8H26Q+/dhC+9MpaxC8vI1dJbkghXGDfeNUs+TY06BIDvcne68WBX8MYO4xralon4LA2dweDWe9U9NnMoCBjUjTM9ovJj6u94Do3z9XFcv1vOoldfNef9URjzXTu8D+C0uVQcH9GspCp2K4sAsY89SQgLWs8UblOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTm35wJWxfE/WuxTJ6c4Nb3jDUh3qajo5MQvh+ik9+I=;
 b=X9JlegkiBi9/9jtVqb0NLoly2mVRH8mf6mixAFmtR7JTXxBzisjiC0gKkb3uMHM1WuUvCayPHPOFZcCXkBS/g0I5JDRBobfMoPbyv2DHsyNwNRdcQO77A96ezgZHR3TSTUfercDPV6D+84lQRdz4rcLrX2X9qUcDWRW+lSrPlkHLj0xs43tcSqZLHhjn1umNhE2FoIc9K5xyK1GURTmYpkkbYmjSuw7mC1Rr3coXWNANjQabCta+RaSzqX+jS4SdbpLCO2aaUj+0ljmjAf3KyezXrvTBv4LnjwhszgtfQ5FNUbDckq8yoc91QeVChzGr2rknHNuX2d+gdm6+wNwIiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTm35wJWxfE/WuxTJ6c4Nb3jDUh3qajo5MQvh+ik9+I=;
 b=XLm4F96XXvZmw9NlRR2Tro3quGv9ixsaB/0ZHF+DoHBMTrdOmEZlqL7dfi90pWJBy6yLporEBFeKrWnDvnvryTCTzK+LA5799hQ8DUbAS9JuHSWWk2UL90vDCnVBVKeu4x5WSlBci/PzHHrNeid5npMhnTAOHMYH44mmnRbsLVC3+TNpYl53aN4Kt8FJ8Lp+aEpPJV+kLJc9n16V9dRbRa110MegUIbmzjIG64I/Rf09hkBzVfdLZr12/1C5DePQX9sreL6197x6hZgf669PeVXPPjAhgVr3ecRX0P3zKz4kEP9uUz7quYgDZF03qX6E9OLmpdU1d9u+Ffwa/eFGYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI0PR04MB10926.eurprd04.prod.outlook.com (2603:10a6:800:259::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 19:34:52 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 19:34:52 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 30 Sep 2025 15:34:21 -0400
Subject: [PATCH v3 2/5] i3c: master: svc: Replace bool rnw with union for
 HDR support
Message-Id: <20250930-i3c_ddr-v3-2-b627dc2ef172@nxp.com>
References: <20250930-i3c_ddr-v3-0-b627dc2ef172@nxp.com>
In-Reply-To: <20250930-i3c_ddr-v3-0-b627dc2ef172@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-iio@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759260882; l=2992;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GjLXL+gm1jWYNKCEbJdOq+74VWMbv2IY9wXQMF6gNPI=;
 b=6tfg/eUD7YdyYWWdGQnPXYJEBn/XYimllkvIqsvpAcWLCGCLnDQnB0eMoDFG6/piP7epAy2jk
 ExXsm8o2mcDCJDX+aayIRYjrmjwPZ5DaqmE3EloCCb+oYFh/Yjx4pU2
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY1P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::11) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI0PR04MB10926:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc40d67-4203-446f-cf5b-08de00586d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3FtT0d3U3FzOXgyZktsdCtWMUl3TUNuL2dEa3FMcmdzQjhsT0g0YTlXYVpu?=
 =?utf-8?B?QmYvS1pYeDNGRjFBa3JncFlENCtNWUVEN3QwSWJySDQ3bTQvY1RsRUtJTnpv?=
 =?utf-8?B?cGtETk5rQkQ4YmRwd0FneWxZVHd1M01GOUhrL1FTT1ZYdFBrYVQxMWNQYktk?=
 =?utf-8?B?aHVsRGNFZklJVjh1MGJaVHd5ZHlZNlBPYjBJSTlJZ2JKVlRkY3Y5bWt0UmFj?=
 =?utf-8?B?Ym1tQlJITXNGb0hFUm5INWcxTklrQ2xZVnp4UGJzTzVBbGpkWUdFK01GZGdj?=
 =?utf-8?B?TGpzWDlaaTNGcHc4Skw5bmNJR0dPZldkQ0tZMURDbmovNGRPMTM3NkpDM0hJ?=
 =?utf-8?B?YmFMU05ZMkZPOUh3UkR0YzRmQ1dwelMvcDFsM0tqNmlFMUhIdEJwdHcvZTRq?=
 =?utf-8?B?VnFWVnNIejUreThuQldqbWY3YWxJS3JIeVp2L2daUE1KZmhvbGVxc090NDlN?=
 =?utf-8?B?RGUvbDQ5VkNVKzVCRFVMYUtPaEt5M0U3bkJwWXdubGdNTk9JbVFSMjBXRi9J?=
 =?utf-8?B?anJBdkpZSDY3UmtiV3dOSmRmR3VhUmhBNjVkT05pVzFhb21pRjlaRWpKRmZQ?=
 =?utf-8?B?ampOTGV6QTZtNXNWbXc5dkJxZjN4eFR3RVZGanpSR0VxZDdHU3ZNUUYrcjE2?=
 =?utf-8?B?cDZLa2MrSmhnRGp2L2pFeEtCb2pwVjl2dEh6QVZuRGdkeTQyV0lzSHdoS3By?=
 =?utf-8?B?UFI0eG1KbERFNzZMUFVuZit6L2cyMDJob2N2R1pTVko4THVFRDJYaThqYjI2?=
 =?utf-8?B?eWJPUVJMUEtQb3UxUEovMk14b2M2NS9KVEJ5bXRGQ3FTdEI1RHFUdGkrbXlh?=
 =?utf-8?B?Q0ZueVd0OHF1NmpLVTdmTzEvdHpOU215N3I5NllPVXQ3eFhoUHJ4U1BuQWZB?=
 =?utf-8?B?Tk9kbnlmL0lnWHdlNW5Zc0s4YUZ2UFdta1JqUitsbmxzM1hCY3ZtTDFkd2Ur?=
 =?utf-8?B?QnlleEo1RE1aOG9pS3RORzBtVkRuNHFESFdWYXZiSnRPOEZ3QmtzS3V0bjZQ?=
 =?utf-8?B?RmI1cGtIdGJnVG1DaWZpMnNrRmV3OVhPM1RVUUNGaHFNcU9pQzQ3K1FVZVl5?=
 =?utf-8?B?Um1scEhFbFlJaDZ4cFVZUXdDZ3E1K2dmaDlNekJuSnlTSC9zS3M3S3lGSXkx?=
 =?utf-8?B?bWhuS0J2ZE15NDVBYlZ5S0hteUdPSXRBU1MwWTJjQlRibjNwNHJzK2pTTmdK?=
 =?utf-8?B?K3N1UFplZGpwRDdPQXR0NGZxS1Jzd01Sdlh5cDA3QWxkRDVxdlJBUmljdEQ0?=
 =?utf-8?B?eitMZFFubjBSR3VCQ2ptU3ZUV1dVbkR4UXVkb29RdDB3N1ZIR0VLc3FqQkE0?=
 =?utf-8?B?bHZHMGdZbGRZbGxoSHpKNFhPb0wwSHp0MUlmM25qUHdCY0g3L21CeHkxODdG?=
 =?utf-8?B?cTgrYU5NSVhyNmZERkdBMEg5QXhrT2tSdzZsRVl3dWkzZGZnQ0hBWHZkMGp3?=
 =?utf-8?B?TWlXZlUwck1pcU1vMWE0QWViMWYvOWduK3U5QVFyMzlPR0MyR1lQcUlXdTlY?=
 =?utf-8?B?UlVmekZMdm5IdmRkb3FFcVNFb3ZNMVcwKzlmcFJHZ2hKdjZseFBQOVEzMGJp?=
 =?utf-8?B?NnZVTzI1b2hqYzlJV2lqWlcrREY1OUtlUXpFM0dxeXZKTkxlUzYydDBMZStT?=
 =?utf-8?B?YUlQUUwrV3VJSm0wMFlQK3FkQ2N0VUxsbXV3QlhGNnZvN3cwc2ZXK2ZJZWN5?=
 =?utf-8?B?c2cvMDRwdkxSc1FBdEJuMitpSnlVaEh4RHE4Z1FrSUl3UDVBejQ0YlhBVzVJ?=
 =?utf-8?B?Tmx4R0xlQUdiT05yVzBveEpNTlBaNzMranlleCtUeWZ5MG00eVd3V3d0QXlS?=
 =?utf-8?B?K1Bob0dBOFMzYmY5WkQyZDZYVHFGZUM5bE1rUm55UXZCa1ZUaENzdzg0b21O?=
 =?utf-8?B?enlIRWdQcE52OXI4WmZYaDFVUEVPYVlaT3Q4WWlJQnR6bVlrcWhtVFNhYjNy?=
 =?utf-8?B?dXU5bndtanlZOTRiWWhRVzVpZzZBZVFkd1lIMVMwRE1VTzAxVjgwWHAzMVFo?=
 =?utf-8?B?eEd3clBLWFBISnVQbUptNldMMkhjRTNNYlZvMEw4cjNaRWxiYzZhaGFSbzJw?=
 =?utf-8?Q?B+0wNJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFpKTlVSQVpyZHIzbFBiUHZTbE5YYXJRa1VxYWszWndXMDA4UVBYRjhMTzdi?=
 =?utf-8?B?WEFZeVd1U0p0bXB3VFFyWHdoa2hCN0k4Qm9hR0FKYU55bzhEQjdRblEwODMy?=
 =?utf-8?B?TkY5dGViZEFtclRyWitJTE1wMlBqaVpMeTk3aU1CeVdFdFZHWUZuT25hWW1l?=
 =?utf-8?B?aUdjZ2RtMWFUd2pVdThpODNsZlJqS0NOMmpMSldsaW8yWUNkY01heTh6R1BC?=
 =?utf-8?B?UmEyYUxmNkpOU0RObHUrZmhQckdZTWk4ckZYNUQ5citUTmoydnZXMG5DZTJL?=
 =?utf-8?B?dFBTRzVIUE8rRjZIN0xWSStFT3QyRGQzRnVFRTF0YzdUKzhnbTZaNDNKVWlJ?=
 =?utf-8?B?bGF1U2RrNDkzTGMvcFNPWWdwV0VxcHJlYkhwZFUzUVpjR3BiRXR5Q21sYWVL?=
 =?utf-8?B?dXRvNHI4ZE83dHp1ZTgydXU5WGRMYm5PVVBGS2NNRVZYRXIycGVDRnRnSVha?=
 =?utf-8?B?YzlJTlJ0WWNVZDJGK3dkbmZ3SkRKN3cxVzRocGx6dk1yMTJTYU5DNzNYS09m?=
 =?utf-8?B?MUhOTGt6Uy8xNU5HZXVkQ05KSnJhV2cxb2N4RTBGdWZ3MU5RbXdDa0dsTmg4?=
 =?utf-8?B?OXNqUDB4N0tJTWllR1V1V1BFY1N2S3RJNmxlWGtTR0hpSENicTk4eVVlQlYy?=
 =?utf-8?B?Z1A4a2hEL0dKTEV3RDdYS3NjQ1h1YUI2emh5cHVqZlByUVBsa2hJQlpKaDRw?=
 =?utf-8?B?RG42TkpueEYwaVdyZ2JiQXNHU0Y5UmlNS2VjaHcwcEIzdTl1ZlBURjNMWUdK?=
 =?utf-8?B?UmdmQ3R6RmIrZ3MwVk4yWXhvaGNIZGFBMm5PQWUzSE9hMytaMWtETzJWUkwy?=
 =?utf-8?B?VHJhOWszZFl3SzlEZU10c2ZtSHovMUFBeEpzQmZrS2c2K1ZBY3BTUktJNVJw?=
 =?utf-8?B?clFBL09ralZnRVc1VjJuL29neFJSWkF6Y3NPQ3U3dytqRnVweStVQ2VzYVlL?=
 =?utf-8?B?RXNnQjJTUzYxdEcxSjRTVktQN3A5TDdLbzExVmhsMVZxOU9KOGZpdzJCL2JZ?=
 =?utf-8?B?QTdCb1pPS2tLS3VXa1JGcTQxbmxWbWRyNWZSQWpGWnNiVjNwdldxR2owckVJ?=
 =?utf-8?B?QVd6UG5HRGxCa29nYk1nYXQyRGFEenFtTldrbkhMZnJqcXFiQ3FRbkFHbXVz?=
 =?utf-8?B?d0NYSnlRSCtyNzBGTHB5NWVWOU9JcEFLOGt5WHdscDk5bFBKTW03aEp2SWdP?=
 =?utf-8?B?NTF2RjBMVEdTUVQ0R3kwc2N0TjBKWHA5RmNtMVU1LzJqdElScnJYWWdaV3dO?=
 =?utf-8?B?Q0dGM2g4dDBpWk1ja0dnUVo1akdvZFRrL2t2S3BOOEhPK0dkWk9YVi9aNzJM?=
 =?utf-8?B?TnVhUDg0R1ZITjB0L2FnVU5pdzFxbHcycmd5K3k1QmhWd21IMHFOSlMwdGRL?=
 =?utf-8?B?TEVkVkVSb2ppWXNLdDMvWW9PbHhmR003TG1XTTVlaXdjMWsrbTBHcEF5WnFR?=
 =?utf-8?B?aEVqUk1YZ1FteHBnOERvWE5DSG9EVHU2MXZFMnltc0VJemg1N1I5Kzh5YXAx?=
 =?utf-8?B?Y2dNRVBQNWM3QjlTbmJuV3RKaWRwOXJvTWhmQXliNmYrYkJRSldaRmlFbUNC?=
 =?utf-8?B?Q1g2N2hLYm85QWtWbFlkWWxEd29tQ0ZQTHl3RkUzaXJhcFh5aHZCOThtcktF?=
 =?utf-8?B?SkVRaDlwYXZnZVhtaVJMeGtLSnI1ZVN1UlFjem45cjVVbVh1SWhmWG5FOEJQ?=
 =?utf-8?B?WmxqdjZoUFlFQnJQZTBwR29OaWE4OUFSQ3o2NGxwV1RCdFphSStEUTBOYWtx?=
 =?utf-8?B?bngyOVNRZW0xc2FXd0JPdzFJbGUrYnVlUWhxSUc5MzVLRHRHMHNKMy9sVk54?=
 =?utf-8?B?bGlZUk83aFhMQWJCcVBKcWxHK0xyYmxSNmwrRnIyR0pyWE9vWTZ5TDlURUNH?=
 =?utf-8?B?aVNjOTIxTWhMODdwSUt1WmpacHZhQkR2QktUK1dRSjlvanFlZk9hNlRaWDF0?=
 =?utf-8?B?WlV1cG9NUW9qSGZnbHQxZ2YrTExMQlllTnZsanRDbUdxaTA3Mmdsd1I0RDJS?=
 =?utf-8?B?RDBPRDNHa0J2TVYvU09kSVdNWDl1bFdEb09vWGtTQjlXQnVla0svNHVwMVQx?=
 =?utf-8?B?d0RBVjZMWnRnTlhxOHU4dUM2U2FvV2NpMk1kaUVvM1ZBRHNjRnQ0b0RKUE1W?=
 =?utf-8?Q?Tas0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc40d67-4203-446f-cf5b-08de00586d0a
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 19:34:52.1822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVn5sDkGEd61QhdxAqYAmYZV490a+t78Hncd++gySxCPu70Kr4YtR1E9IpwsGNDx3oI9EHUghqfeVJsVkxJNfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_123500_760340_65C12368 
X-CRM114-Status: GOOD (  13.13  )
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
