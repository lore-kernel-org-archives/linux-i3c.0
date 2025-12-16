Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70999D609D5
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 17:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qoMZjc4qHlZT42mBAeKeE1aLfp11JuKi+sPkJoS9v4s=; b=yedS8cZHodqmMB
	DEeUCo4bHlyp5UzezhNmQg4RO3OPIXAhv/0UFKuhgsi9I4vfNvrWpfPTzo8KEgU84EpGfUeyMC89P
	estwMsNz9Joc6fLJL5qqNVe7JILgnohacQt0InnnAXJvIuO6onAfVvGb5RTQrmv/18HmNEMu9elt7
	AuuSd4qYZq/mkfjqLstHA6VJLV9ddSFXZDLzE+e6TALlAYyNMZq22LuSURT2/JLEEipghVDpsemd8
	RiHQ9TMW8Za/knnyXRjKJpBGnWSdq5P8NHnXeIgDxJ6sU0B0fzYNOGrdXxj1uSOVfT/jIfVTZKbIv
	mZkpW3KLWPbzFNjMXWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYgn-00000005bMR-3tUI;
	Tue, 16 Dec 2025 17:18:24 +0000
Received: from mail-norwayeastazon11013019.outbound.protection.outlook.com ([40.107.159.19] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYgk-00000005bLI-3r9q
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 17:18:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKENJRzN9vtCHczhSu3w1SkAiuSFF5T8YL/GjLfyiChx7JWlH0fwav3QQGK0q1XPIxWT3PUsbgIA4IGw5YE6viweFsexaWnIqXyHDLPmYATT0N+x8YPSGdBCH6yIPU3wztciWEWwP5dcZdwBe+V6HUH7eSbfUaP64DVegE3H7RXJ+BV1VlJjMfnm9i6rc8rcn7cvEJ5trjJtiGmEoGo+iBx5zvUQxAucXtn/eNbJttHcIAslj99EJQ4MSd4w0G48z6M4BT+Qku2A1anLKFT+zDk8T3h3m4gpJZEl+7mnr0ktGaOCy9UTokyOQaflB3kFwCmUFyLRnGoU0rI7oxPN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lj8ZC3r1/6JcmXBL/dszEXESmmJR2GXHioK93wNeHfM=;
 b=IRitmhlftnel9knchBgS4rFoOhECaHutIqCANBHifYqSnA6PZkFiX5gGR1QFHU0Wk/iDTC9/JOhNBf1fnNqNkSnAS5PPDZO6I+84y8O1J8EffCSJLqAek4/vb8oJirwbRHFbCReFMXThbwFMu1DfIRUtaxn5Pzca+9EbZuSuICGAGZ3VDkECe2bTb9XmEBgzAFonNflZ9BibWFjSahx0XQguPwuI3SLFwkEES3asMd39tSnt1nuriwhxPQagixfOYhTqRw6UeG9CogRzVN9BOpFREXZu5X0krwN9MfWICP5OTzmaU8Ym5SWil+RRCn0B5saTMYwHY4Z/kdlvJZKirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lj8ZC3r1/6JcmXBL/dszEXESmmJR2GXHioK93wNeHfM=;
 b=TlrZwH1ZvgW7hgxaQQr5w8fY9nyld/oscf+/KX+YRLMamGJywJKuuuiTK53+BQTVu3uzgHgZWFEKHIXVSSihPt6tYBGeKRSF3RknaCXzYkwwn40wkPJgi/y2a476cnl754EziNA8sVIRJCWkMF94xSU0SbPkf9N3I5VKqtIJ+qj0sarJ/tI8UCYpZIbESlrcCIMgwwmKKV83r0wRZxcmlFMHyfk0xwvy17h+X5dsKrluiIzOAMkovD8zhF+z6FaRfbBNIUqvo2GxbSGvVWar9UTbL7gGcC/HxfWst11TDeMqAkygNpAV7Xr1gUO1QKLPz1+9aof/0NQ0tTHj41UsWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB11055.eurprd04.prod.outlook.com (2603:10a6:10:58f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 17:18:15 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 17:18:15 +0000
Date: Tue, 16 Dec 2025 12:18:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 11/11] i3c: mipi-i3c-hci-pci: Define Multi-Bus
 instances for supported controllers
Message-ID: <aUGUUKFjSCXUTs9E@lizhi-Precision-Tower-5810>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
 <20251216165642.164583-12-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251216165642.164583-12-adrian.hunter@intel.com>
X-ClientProxiedBy: BY5PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:180::21) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB11055:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a96518f-4f64-4681-fd49-08de3cc71907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVpHQ0d0eGQ4K3FvYmp5cGRodVNGTlp3Qmpwa1l6MnNLdUdLeXVLU1BtenAz?=
 =?utf-8?B?dlBYdTlxYzZYNkQ5RG9aeGV6UTI4ZXJZWDlmejBYVHJQenI1RHd6RU42b2h6?=
 =?utf-8?B?a0dFMklQZ1JBVGkwU2pTWTVwdkZXSEtoSGtWVGR5bFM1a1ZidDRCdEVKOEls?=
 =?utf-8?B?OXpTV2cvN3huNmFGaU5GbkE0WEhqTHYrODdpZUdyYlpsTjlIa1ROdnBhRkZm?=
 =?utf-8?B?Y0pKcGJqNTNJSCt5d1ZjWWZPQjdUT1J6TWZFRjFFZFh6OGhHbTlWckRRbXhj?=
 =?utf-8?B?N0d2SEhWVCtpOGtYUVBJb2ZTR1hTUFprMzNaVUd3R0hkNjY2a0lRSkM5VlE2?=
 =?utf-8?B?VnQwVFp2S2llU2RBMXRxL1RJbW1qdUFYbk9XL294MlBRWEhDSUxic2U2eVdh?=
 =?utf-8?B?VnRiR1VMTjFzbElYbWVoR2pqQyt2NFRhVWxCR05pS0hYS2hWVHV6SGlNMzBz?=
 =?utf-8?B?L1JjckgydFk2QW1DYm5Ebmx6cnJwYWFubXJvNVpzYk03RS94Rk5tbm5KamQy?=
 =?utf-8?B?eEU2U2xKb1JjM0ZuajFpT0xRSm0zWXBKdkpRVmhlVDB6MXI3WndUb0dNSlA2?=
 =?utf-8?B?S1RZQmJpMzIxMEZQMUROTlFWTWI5VjBrUmFLcHhVUW9EaDUwc1E2enh3eG92?=
 =?utf-8?B?SzFTcytrN01LQ0lkU01hSm5vNGt3UkEyVlczRytHWkdHd0FROTNzcmtPTzI1?=
 =?utf-8?B?QmJQYW5wa3ZlNEVxMWxwMUVicnJZS3BQYnAvQUtUSVFkVWFtTlhzWGNycklI?=
 =?utf-8?B?VldMaXNKTHRzd052U1lkSlZCVUx3dnNmalFXaURGUVk2RnQyNEh2TU9rVjNJ?=
 =?utf-8?B?dkRNVFRxaG5CWUVMR2pranlHbmdpQnRIWVB4VGJGUVh0bDk0ODNyNUpEMjRH?=
 =?utf-8?B?T3FKNU0xV2tuSHpBa1dnRyt3aWxuL0dvMitaV2dlSkhkN0QyOHpsL21TYzlL?=
 =?utf-8?B?RWN4cnUvSWdrNEJiUU5SMjVjUGQrT1ZjVjkvcTJRK3lRQWdhdUVYSE55cm5L?=
 =?utf-8?B?TVJJNExXdHJjRFBVbTNlTVF5NWw0WGtMSkE5aUlyT0cvQ2tCVE9mUDN1OXJi?=
 =?utf-8?B?bERsNEIzZ3NweGQ5NHhZVVBZaHF2dWM1UlFCcFZFN0QwcXZNdVZjdnN5Mm0x?=
 =?utf-8?B?b1VQYzFZRDJsVDNiTnVjRWd0U0JFTWkyNHlUaEpmM2l2T0c5enlkMjMxN1Vt?=
 =?utf-8?B?WXJUdmJtaVY3NHFBd3hhdWwzN2lSbEgwNHlUeERFbm1TaFpwbTlxaWFsNlUz?=
 =?utf-8?B?V0d4UU9YMFUyMk1vcitzM2xqN21IUXZ0aWZCWnZXeDFmNVdFT1Y0RkRVNG9X?=
 =?utf-8?B?dmk5VTAxTEtubGRKWlpBeFZVQ0VEQVdBUG40K0VodjcrR2dXanVtZ1REKzBC?=
 =?utf-8?B?aUhKNmxHL0xyOXY1VkxSWlhzKytpRTg4OW5xeTZRdnVJOGs3a0NrRWg0SitS?=
 =?utf-8?B?cExhV3dOVlZzcERxNWhKTkx2U3Y2enRvVzZLdjA2cllWVDhOYndKSnNsOFRu?=
 =?utf-8?B?QUNqMmNscWVQL1ppdVNoL0l5VXFTVXdpUHBVSU56d2Rzbm9wT05idkhjem5l?=
 =?utf-8?B?TnIxS3lhWFB6M1piOGZTQ1ZsZ1cyeDRlU3FmdWxtNWlyd29QYzhJTjZBeUp0?=
 =?utf-8?B?azhWUDE4R0VmMDBWdFdMSjY5a0xKNktIbjN4SGMxeGJaWFN1ODNrQkZndVJG?=
 =?utf-8?B?SnczVk9OZ0wwTFJUcno2T2MwMFBWby9tWlNDN2J6OUlwMFJUZDZRSTBEWWRj?=
 =?utf-8?B?L29idTVWV1FPdDYrdndQY0QzY2x6ZVkvY3pyWGRGVDBncWNwYnZnR1BaSm9s?=
 =?utf-8?B?QXVhZEJFTEhaNHZSeXNCczE0SXMyZFN0dUlMSHZ2V2ljWEMySjdFanJZVWlw?=
 =?utf-8?B?bEhSTDBvc1Z6alZ3RkZCbEJSSFArbDloNldDUWlkWjhReWRiUEUydzEyZzRU?=
 =?utf-8?B?YkZuT0NHUW9VR056V09nSkVEZ000R05EUGsrU1Z0N0xkOExiUUFLdXhoRzJQ?=
 =?utf-8?B?SElOeHVBSVJrclg0emNqV2FwcXljTkUrOG01MkwvRGcreDVOVkRScFBJcVNh?=
 =?utf-8?Q?v8yvz2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWV1TndORjBldm13V1p2amJid0d2SDA4eHQyd3FwSGVUOTUvbW9KUEowZWQy?=
 =?utf-8?B?K3JMYzJoZDN0MW5McXpRVFhWclVhVGZpakRQdmhDc0FMQ085OER2UG9oOGZB?=
 =?utf-8?B?aGNKcS9nTHVrTHVVcy9Mb0UyK2ovc1JpSzNVNHEwTjNGeno3M2N2MkhLNzJU?=
 =?utf-8?B?ZnJVZzN1Y1dtclZFWmVCczVJN0V6bGMvNDh5WmhVM09NSVpEU1IrYk1DNmhj?=
 =?utf-8?B?MUxuL2RYMmNVejZJNVNHM2RkTThSV1poa25TWXRCay9pd2VpbVZMbTVtVEh0?=
 =?utf-8?B?aytNRnQ2MzhqTmlIdGxxMHRpVEIzd2NmVnBlTExqR0xVeUljUHY1QkFwNjNY?=
 =?utf-8?B?Q24zTWlqUmFnVWxEWmQ4cTBDR2NoS1p1RE96MzBHZHZUbExmMTkrNVc2czNh?=
 =?utf-8?B?NW0xT1RlcVNaeG9NWGNEdzNnT2xaYWRvVm5GVzJ0RFFkWk9pWW03RHp0MWJX?=
 =?utf-8?B?T1drM1V4em1FcG1vSEZ3b0taRDYxSGw0TDFFMFNPRVZ0Q3dkaloybHRuZnQw?=
 =?utf-8?B?aFpKRTIyT2UzaHdpdlhXdE96Ui94ZzFZblRLTW9LYlE1T3prNXVUKytwMWZu?=
 =?utf-8?B?Yy9aRFBKajM2MGpNRHhsSWlINDJRTG9RSzZ5K2dJcWFDNjlrN01sdVRHSGJU?=
 =?utf-8?B?c2krdy8rTGRMOFNDN01JK0l6bENEeUhicTV5ZU5GallvT2pwVjkvSlBCbGUz?=
 =?utf-8?B?Y1VRWU9IY3BaTnpaWDJmeDVMdmY2UUhjVU1zM1RhQTdITkxNRXUyTVNRdHJB?=
 =?utf-8?B?RWRiaW14bTVXdkdNUmpMRXdGS3VmOWRxcktIVXVaa1RvaDFGd2paTEI1Wmoy?=
 =?utf-8?B?cGNLQy9hWGVxRk96TU9WalNjNyszeHcvQ2FLQWdleWVLVmhnTHd6QjRJMmg5?=
 =?utf-8?B?Z05KemxzcXR5cVFleGdWbXd1ekFDNEtWS2FnTjczS1VpcTd5MHhYdjA3TGtu?=
 =?utf-8?B?eFgzc3BJYUJzVU84VmlOSno2bmdOWVdicndtWVJQLzFPRzkzSWJmQkFidWNi?=
 =?utf-8?B?Q1plZmRrcTAvSk5OZldpandadFFrUC9XRi9JRXlNNEw0MVhCb25rdmdYWjNo?=
 =?utf-8?B?TE5SM2NoaGJ2bmJMMjMvSklMR1hyWHZYcGhWdEc4RFRZR2tCMzZYK2JicVY2?=
 =?utf-8?B?Ujdkd0Q5dUkvNUdZN2F0QloySFBUNG1hMU83aklHcllXWU5NaG1DaGtSdFNO?=
 =?utf-8?B?Nk9OVyszWEF3RzdYRUJhd1NPR3VIL2ZjTnBFVGYvR0tTeGs0SE4rcVFZbkR5?=
 =?utf-8?B?N01oaUk5TU1pYTVUQVlYTUZ1RkJkZUk0SVkxc1hJRTRiZUZRMEJZRytUNkpm?=
 =?utf-8?B?eGRvN2lYb3NwZGU2MkwzTzlBY0x2RDlQZTNBMXkrU3c3STMzcTVwWDU4dHpN?=
 =?utf-8?B?K2dYWHc2MWZPemo0YzdQQ1E4VDVDSjVoa2Mrb21MNHIrS0VvTHQrejZJaTQx?=
 =?utf-8?B?OUNMbTJlMEhUOUxFVDViZit0TkZCZ0w0ZjdOZGNTaTEwNGtTbDFuUVZqZ2Rk?=
 =?utf-8?B?N1g2b0VEQ3NIbTVxbGE2eEFESmUrckp3N21EVTh4dEtvUS9BNldFWnJ1QTRD?=
 =?utf-8?B?QUtubVNJNlFtZEVDSWV3aysveGYwMHJyZnVQeWdvbE54OWc0OVZ3aHp5Mk84?=
 =?utf-8?B?WW95VDgvbW1XbFBCZW9yV1dNZU92QzdBUm1oUjRNZlJROVMzWHNiZ0dLTVJS?=
 =?utf-8?B?YXlSbVN5THVicFBkV21wUUs1MFkzWjk1Tmhvb2RpT0JSSW5lNE8zRXVUdFBv?=
 =?utf-8?B?RWJLSTljZnUxak1kbXc5KzdDai90TGtmTkVycCtscEJ5bWlDV00rT0M2K01X?=
 =?utf-8?B?NWlKM0w4RWplTzFteGVhYVlNOVduM25tckhlalpub1d1YmRkcG1NbWdFMThO?=
 =?utf-8?B?RHROR2U2ZGhaeTJlTjR4em01NzZSejBzSVFHMzNoMElmSWRTREtTYVlRYlRn?=
 =?utf-8?B?Qm1GT29wMTZWc1FQSWRyN0hwaG9pcmYrZUVPK0puQU5qOVNMb0phVWtkNWJt?=
 =?utf-8?B?b2t0VXhPL2FURThEZGZyMUpscktOWWJYeUtwSHV6WTVLSFpxelMyRFpubUY3?=
 =?utf-8?B?bnFDRXN0SHVVczZKUzJSbjJHeExvdzJEM3oxMU9sRW8yQkZnbzUwd2IxR1du?=
 =?utf-8?Q?BXzW69HC8lD3eMcnXJDqkAJw3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a96518f-4f64-4681-fd49-08de3cc71907
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 17:18:15.0516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmvCHT5pnNHN9qXDJNPIbR2x1DeZkb8NveHSp1sScKcFbQqpqybHlt8FuyUl13xa71GdGSdmh/JkoiogpFQJ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_091819_368351_A1C455FF 
X-CRM114-Status: GOOD (  17.75  )
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMDY6NTY6NDJQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3
cm90ZToKPiBEZWZpbmUgTXVsdGktQnVzIEluc3RhbmNlcyBhdCBvZmZzZXQgMHg0MDAgZm9yIElu
dGVsIGNvbnRyb2xsZXJzLgo+Cj4gSW50ZWwgU29DcyBpbmNsdWRlIHR3byBJM0MgUENJIGRldmlj
ZXMgaW4gdGhlIExvdyBQb3dlciBTdWJzeXN0ZW0gKExQU1MpLAo+IGVhY2ggY2FwYWJsZSBvZiBo
b3N0aW5nIHR3byBJM0MgYnVzZXMuIFBhbnRoZXIgTGFrZSBhbmQgV2lsZGNhdCBMYWtlCj4gc3Vw
cG9ydCB0aHJlZSBidXNlcyBpbiB0b3RhbCAoSURzIDDigJMyKSwgd2hpbGUgTm92YSBMYWtlIHN1
cHBvcnRzIGZvdXIKPiAoSURzIDDigJMzKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBIdW50
ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEZyYW5rIExp
IDxGcmFuay5MaUBueHAuY29tPgoKPgo+Cj4gQ2hhbmdlcyBpbiBWMzoKPgo+IAlBZGp1c3QgZm9y
IGRvaW5nIGF3YXkgd2l0aCBkeW5hbWljIGRldmlkIGFsbG9jYXRpb24KPgo+IENoYW5nZXMgaW4g
VjI6Cj4KPiAJQWxzbyBkZWZpbmUgaW5zdGFuY2UgMCBpbiBkcml2ZXJfZGF0YQo+Cj4KPiAgLi4u
L21hc3Rlci9taXBpLWkzYy1oY2kvbWlwaS1pM2MtaGNpLXBjaS5jICAgIHwgMzUgKysrKysrKysr
KysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9t
aXBpLWkzYy1oY2ktcGNpLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL21pcGkt
aTNjLWhjaS1wY2kuYwo+IGluZGV4IDc4MmY0Njk4OTQyMy4uNDU4Zjg3MWEyZTYxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlwaS1pM2MtaGNpLXBjaS5j
Cj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9taXBpLWkzYy1oY2ktcGNp
LmMKPiBAQCAtMTgxLDE2ICsxODEsMjUgQEAgc3RhdGljIHZvaWQgaW50ZWxfaTNjX2V4aXQoc3Ry
dWN0IG1pcGlfaTNjX2hjaV9wY2kgKmhjaSkKPiAgCWludGVsX2x0cl9oaWRlKCZoY2ktPnBjaS0+
ZGV2KTsKPiAgfQo+Cj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgbWlwaV9pM2NfaGNpX3BjaV9pbmZv
IGludGVsXzFfaW5mbyA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtaXBpX2kzY19oY2lfcGNp
X2luZm8gaW50ZWxfbWlfMV9pbmZvID0gewo+ICAJLmluaXQgPSBpbnRlbF9pM2NfaW5pdCwKPiAg
CS5leGl0ID0gaW50ZWxfaTNjX2V4aXQsCj4gIAkubmFtZSA9ICJpbnRlbC1scHNzLWkzYyIsCj4g
LQkuaWQgPSB7MH0sCj4gLQkuaW5zdGFuY2Vfb2Zmc2V0ID0gezB9LAo+IC0JLmluc3RhbmNlX2Nv
dW50ID0gMSwKPiArCS5pZCA9IHswLCAxfSwKPiArCS5pbnN0YW5jZV9vZmZzZXQgPSB7MCwgMHg0
MDB9LAo+ICsJLmluc3RhbmNlX2NvdW50ID0gMiwKPiArfTsKPiArCj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgbWlwaV9pM2NfaGNpX3BjaV9pbmZvIGludGVsX21pXzJfaW5mbyA9IHsKPiArCS5pbml0
ID0gaW50ZWxfaTNjX2luaXQsCj4gKwkuZXhpdCA9IGludGVsX2kzY19leGl0LAo+ICsJLm5hbWUg
PSAiaW50ZWwtbHBzcy1pM2MiLAo+ICsJLmlkID0gezIsIDN9LAo+ICsJLmluc3RhbmNlX29mZnNl
dCA9IHswLCAweDQwMH0sCj4gKwkuaW5zdGFuY2VfY291bnQgPSAyLAo+ICB9Owo+Cj4gLXN0YXRp
YyBjb25zdCBzdHJ1Y3QgbWlwaV9pM2NfaGNpX3BjaV9pbmZvIGludGVsXzJfaW5mbyA9IHsKPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBtaXBpX2kzY19oY2lfcGNpX2luZm8gaW50ZWxfc2lfMl9pbmZv
ID0gewo+ICAJLmluaXQgPSBpbnRlbF9pM2NfaW5pdCwKPiAgCS5leGl0ID0gaW50ZWxfaTNjX2V4
aXQsCj4gIAkubmFtZSA9ICJpbnRlbC1scHNzLWkzYyIsCj4gQEAgLTI5NiwxNyArMzA1LDE3IEBA
IHN0YXRpYyB2b2lkIG1pcGlfaTNjX2hjaV9wY2lfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwY2kp
Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIG1pcGlfaTNjX2hjaV9wY2lf
ZGV2aWNlc1tdID0gewo+ICAJLyogV2lsZGNhdCBMYWtlLVUgKi8KPiAtCXsgUENJX1ZERVZJQ0Uo
SU5URUwsIDB4NGQ3YyksIChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfMV9pbmZvfSwKPiAtCXsgUENJ
X1ZERVZJQ0UoSU5URUwsIDB4NGQ2ZiksIChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfMl9pbmZvfSwK
PiArCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4NGQ3YyksIChrZXJuZWxfdWxvbmdfdCkmaW50ZWxf
bWlfMV9pbmZvfSwKPiArCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4NGQ2ZiksIChrZXJuZWxfdWxv
bmdfdCkmaW50ZWxfc2lfMl9pbmZvfSwKPiAgCS8qIFBhbnRoZXIgTGFrZS1IICovCj4gLQl7IFBD
SV9WREVWSUNFKElOVEVMLCAweGUzN2MpLCAoa2VybmVsX3Vsb25nX3QpJmludGVsXzFfaW5mb30s
Cj4gLQl7IFBDSV9WREVWSUNFKElOVEVMLCAweGUzNmYpLCAoa2VybmVsX3Vsb25nX3QpJmludGVs
XzJfaW5mb30sCj4gKwl7IFBDSV9WREVWSUNFKElOVEVMLCAweGUzN2MpLCAoa2VybmVsX3Vsb25n
X3QpJmludGVsX21pXzFfaW5mb30sCj4gKwl7IFBDSV9WREVWSUNFKElOVEVMLCAweGUzNmYpLCAo
a2VybmVsX3Vsb25nX3QpJmludGVsX3NpXzJfaW5mb30sCj4gIAkvKiBQYW50aGVyIExha2UtUCAq
Lwo+IC0JeyBQQ0lfVkRFVklDRShJTlRFTCwgMHhlNDdjKSwgKGtlcm5lbF91bG9uZ190KSZpbnRl
bF8xX2luZm99LAo+IC0JeyBQQ0lfVkRFVklDRShJTlRFTCwgMHhlNDZmKSwgKGtlcm5lbF91bG9u
Z190KSZpbnRlbF8yX2luZm99LAo+ICsJeyBQQ0lfVkRFVklDRShJTlRFTCwgMHhlNDdjKSwgKGtl
cm5lbF91bG9uZ190KSZpbnRlbF9taV8xX2luZm99LAo+ICsJeyBQQ0lfVkRFVklDRShJTlRFTCwg
MHhlNDZmKSwgKGtlcm5lbF91bG9uZ190KSZpbnRlbF9zaV8yX2luZm99LAo+ICAJLyogTm92YSBM
YWtlLVMgKi8KPiAtCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4NmUyYyksIChrZXJuZWxfdWxvbmdf
dCkmaW50ZWxfMV9pbmZvfSwKPiAtCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4NmUyZCksIChrZXJu
ZWxfdWxvbmdfdCkmaW50ZWxfMl9pbmZvfSwKPiArCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4NmUy
YyksIChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfbWlfMV9pbmZvfSwKPiArCXsgUENJX1ZERVZJQ0Uo
SU5URUwsIDB4NmUyZCksIChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfbWlfMl9pbmZvfSwKPiAgCXsg
fSwKPiAgfTsKPiAgTU9EVUxFX0RFVklDRV9UQUJMRShwY2ksIG1pcGlfaTNjX2hjaV9wY2lfZGV2
aWNlcyk7Cj4gLS0KPiAyLjUxLjAKPgo+Cj4gLS0KPiBsaW51eC1pM2MgbWFpbGluZyBsaXN0Cj4g
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
