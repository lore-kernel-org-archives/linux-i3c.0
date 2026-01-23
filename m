Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B815D72347
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Jan 2026 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9y+I8WM0lLcq8NfCDXRNU8U2I8fmSkm/Xdl82xiRoLo=; b=q1cH8TDOu7/Atx
	uZvdQmLGBQ1z1moOwFMciG8ZLsF6sxT9onaG9DfJ3fAwTMI/x5JYv96wWACeAFEIbOl2daqOX5NtH
	BJtrCn1Xixjb5Za6o0PthUqiAdkkE88FhufoufI3mfp2FuDeVBu/FJHINiq4nCandWPUccsdpusHB
	y7br3ZAYeFvtN7drtdmV7AlPyPYIgqjW5Hs9VuQrkXOcEaIVMd1t5EmUfxjWkzob+LjFXN0G2RJoj
	Yws9cBIc7RWzBeeUgsoOJU0R9SA3PYaDm9AZkYHzvGrjgbUeUC/+1Oh6j7xdOOvx75g2f2IuZVVsg
	cbLnyxxh/9DC313HYOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjC1L-00000008P2J-31x9;
	Fri, 23 Jan 2026 07:55:55 +0000
Received: from mail-northeuropeazon11011050.outbound.protection.outlook.com ([52.101.65.50] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjC1J-00000008P1w-2zel
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 07:55:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRIhp/Yx2Zjec9LlSAByY5qxSf7rA6MPrHnMEpB0J+AbdTm2uXiyYvM2hacjOWLfjJo/0K3/NrLWiHemMxu65czMoAKfUWKk1lOgpUdovS7T9VeelR7R7HB2VGMSEbErNBFzTpq5a34ZbzXCaF+yn6xCKewdOG5NOZSBdKnVkSkvkh4jB/LSneaE+rAXY84Z9WjamAWnneApsK4sidaGcfphkmw6qmbfpROUtPNr+RN01acnMcQfa2eP3vwt0y1Tf9CtF/u1LKrQt1z2QkYyeAkZSOgnvy1dpxUGboVw4GIA7LgrUkXzGcFm31DnPVOu+dlU7ezJ0vy4XTVgc70nLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TySWPROLG0o2r6z7c0NUVZGaz9eVihYfL+GquZwTN0A=;
 b=a0btikhMO0GeLLkWspgnS8iLiF8CmqtcfDyqfquQmQJ8SdV71PKmVCTvg4ru6DadsxiVy6tY1CC06xqXJL4ep0vgqaxmiTc2y28P3gW8wP4+CVD9jVq9fnQUfvbW1BhC2u+BGreTGp82BDtJ8GCVju3ArFDgtXTubEmMUB2fBykV/s9p4qnKWQf1Im50RDBFRdxquBV7Ux2sODZBObnZICnRT2RiEMFxKB3lyHxaMjIx1yu0gjb+n9MjvGKFGcDD9OjUKJMqmWsWIgy2FWcuBLIxwp2keQYz8LJ8Z6aGt8npYXtqIVyzEs+INkos3nwrU34jpIHCg6hYueYgMdqmhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TySWPROLG0o2r6z7c0NUVZGaz9eVihYfL+GquZwTN0A=;
 b=ogl59mwVz/seLMYiGXbx8aAirpFqAs9TQBuYTsOBs4OIbUdNT6BWGeVTaiQ8Rfb6M1M756IoviGfpmJe6gZbcMPt2uyhOMsPbWbTenGcDB6brKs/wQE6ejkWrY5VYyybtxVbZi+pfJVhVRB2GGZZBy1UA+LSOMxGo8qeSwzn3w0Y0xiUyrjQmYnIIL1/NeK7x5IjYLoTervBdSkBr75l5VSdzeV62+56R5ZtJaKWJQFGZr+LU7Xg6r6c/LNmLa9WS+fx4dQKL43jDqnDptQsD8qY1CBeugsT7AWp3eFSTMx2I+D80ibcUw2/p8TzORh5MskntrgXIMTOjpc3+dYLqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by DU7PPF576E2BA62.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 07:55:49 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 07:55:49 +0000
From: =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
Date: Fri, 23 Jan 2026 08:55:37 +0100
Subject: [PATCH v3] i3c: master: Add sysfs option to rescan bus via entdaa
Message-Id: <20260123-i3c_rescan-v3-1-026429fa0c65@est.tech>
X-B4-Tracking: v=1; b=H4sIAHgpc2kC/3WNQQ6CMBBFr0K6tmZm2gC68h7GmFIGqQswbW00h
 Ltb0AUbly/57/1JBPaOgzgWk/CcXHDjkEHtCmF7M9xYujazIKASEEvplL16DtYMUh8IW2g0GgC
 RhYfnzr3W2Pny5fBs7mzjUlgWvQtx9O/1LeGy+4WJtuGEEiVYrKBCJkXNiUPcR7a9WLqJ/puUz
 VrbShtdqw7Uxpzn+QPh1hbP7wAAAA==
X-Change-ID: 20260116-i3c_rescan-4921d0b41a00
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joshua Yeong <joshua.yeong@starfivetech.com>, 
 =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769154945; l=1982;
 i=david.nystrom@est.tech; s=20251215; h=from:subject:message-id;
 bh=SK7I2WJWvAtsdUbqPD39vjzGGAKAYPlajhhDS+brMi4=;
 b=eXTzeLIjV2LhNUlwt2rYYutd4mf20nsJguIdyaDMuXRqcx6oRL3NcTftZz9KXaD549lR78zAI
 Drvbvr47u6yBHzGfxWTLlA6SUw9EbpUYbNv3wPUFg3ugkSI7Rf+GaPH
X-Developer-Key: i=david.nystrom@est.tech; a=ed25519;
 pk=4E3iRjA+3w+a4ykfCHDoL5z4ONs9OcY4IN3pTwIG7Bs=
X-ClientProxiedBy: GV3PEPF00002BB2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:20) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|DU7PPF576E2BA62:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1ada02-9ced-487b-90d1-08de5a54d2e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWgrd3lTSExWUUtSMW1WdHc5T1cxdlZNQVNTRjVmdnV5SVk5bEcvM1B0YWJ4?=
 =?utf-8?B?NHBFK0RNQ0ZvRm5ySmxyQ0RmVGZ3VkdvK0w5a1dIMnJ6S296QWVvUm51dG1n?=
 =?utf-8?B?S2g4T3U4bjUvSUtBMFprVzcrTmFzL1hQUk0xM3l4R1hVZFZTRUVTaEdSRjVR?=
 =?utf-8?B?Slp6TE5BU2srT2I2Q0ZVd0kxYkx6Q3RJVmI5Vzgxa1g2RWlkcVphTFhwOTk0?=
 =?utf-8?B?Ujl1Q3FiTmlZcmdJVnFiMkxXTzV6ZW1PZzZ4WUE5WEhJRTVRdk1xZ0d6d242?=
 =?utf-8?B?L0M4YjBFNnNlTDQwRjFJaXFWMTNOL1pJZ2xkeDZHMi9JWU9qK1l2UFFtbU04?=
 =?utf-8?B?emFSZzR1bWJQcXdudUxEdDQxS1EvNHF1eDVBc042SGJIUFkrclgyUWdNb2ZY?=
 =?utf-8?B?ZzQ5dm5hTmxWZmpYNmJHQ1hkc0xyK2dxRncvNWx6emVRSm11ekxZak5XMm5U?=
 =?utf-8?B?bzQ2akpGY1RSK3oyOXhaOXg2cXMvU2kzWDE0bjAxTnNDZlczRTZGbE1jM1RO?=
 =?utf-8?B?cHI4V1owSEVyaUduWHBUUEJVK3lyMlUxbTFMTkZFT21MTGhDcm96OTZ1VnND?=
 =?utf-8?B?YXNIVU1uRStlYk5vRVJwNXZGYk9tRjc5NkhOWmRqcDg4YTRsUFQxbUZFdzhC?=
 =?utf-8?B?MFVLZEY2ZXZhQkVwM2E5cHRnT3lRZmdUdUlLSmJuYWtiVTJmSmV1OG4yK0tz?=
 =?utf-8?B?dUFLNHJFTGZtbHUzUjBDbUJYbzRsS3FzQWMzTHhUYkJsb3FUeVJod3gvbnZG?=
 =?utf-8?B?SFpCOVZqNW1DZ0NSRkhrZ1h5SzBOTHhUQll3WGRBMmFteXZ3eWN0bVhRVzlJ?=
 =?utf-8?B?d2JtYXh5M0haeERqdGNFelpqWmtIcjFiNkZqVC90TDcva3VYVThhUnpaUUVj?=
 =?utf-8?B?U0lmWUd0RUVrVzZhTEJpbEQ1c0xiaWQ0N2M1YUU3VTVVNXdxNzg3eC9WWnRG?=
 =?utf-8?B?a1BHdVZHYVRCQy84NHRFS3dSc21vVTZRa0pIR3RYTitWL3diTklYaFdHb1Mr?=
 =?utf-8?B?anAranZjOUlHZ011Rm44ZmF1L0VWV04vWFN3NW40dEVxRzQ0a2FrQThFeFFE?=
 =?utf-8?B?SUhVNGRvUDMyUVBXbUtwaFhHQUcvbjd0dXlKdGloSkU0M0lDNTRjc0UwVUpC?=
 =?utf-8?B?L3VpbG40VGs1TXZZdnR0V2thL1NXYWFoVERHak1MdENQK1FmbTg5eTQwanRr?=
 =?utf-8?B?TEZCUTc2ODR2azZ4cjVJQXJSZmhjMUtGZlVYanNLWk5uK3JPTk9EZlZ5UkMx?=
 =?utf-8?B?ZzJwYU5iM0dsOEU4KzZ0YUxLVFZnbmFONnNNOUZkSUMyMEUwQjhCL2psMWNk?=
 =?utf-8?B?OEZhWGhydThpSUVMOVozOUFzYndKUFMyMmdGdTd0a01xSjNHOFdUVWNsQ1hJ?=
 =?utf-8?B?ODhqTXdYbG8zY0F6MTFPUlNuNS81enYrT3lGNS9FaXhWRjMxL1hMUnBhYUxM?=
 =?utf-8?B?Zzg3ZWVoVmpndENuTFFlRWx4cGxnb2NvaE96OUJ6ZlgwRzlnR3NCVEtWVzk1?=
 =?utf-8?B?WExpYVZOZnZtalYzLy9jTlBYdHlSLzBTcmt1b1I5VlRlS3RxMlBKR3ZuaEI2?=
 =?utf-8?B?Qm9wOWFObHpxODAyUjBWNjdrelNlN1RDZVVOQWhxdm9rSkNGSURsY0dEQklN?=
 =?utf-8?B?bGc4c0JiaVdVVThWaFFGRUFkYW9hR3Z3SllJc3Y1WlR6QUpMb2ZZV2gwbUtB?=
 =?utf-8?B?NG9qbUVqMWhZNFFDSkFmQXBvbmJhSmtBSWkzS00rTk1JYXFaVnN5TnprQW9k?=
 =?utf-8?B?WC9MU3NvUElnTys5Qlg2eFZmd1RNaXZ0T3JOYWM4ZWtHTElSTXdVSjBDWWRV?=
 =?utf-8?B?ZTNraVdGR3NicjhoN1RsVXRXYVJ6K0tCNVZRYTdHY3lTWEtHeG12cTl1cVMw?=
 =?utf-8?B?blVhQXF1MDZoNXl4VG9ka2J6V2NjTk00ZHlSa2RXU2I3WkRidU5LZlNpK29w?=
 =?utf-8?B?ZkMrRDlXNFlrTG1CQjJYcjNKU1ppYldoT01pM2RlOHhWWWpnL3ZRWHc5eVJC?=
 =?utf-8?B?WjhJdWRxK0Fmd25kNVo5anBUUk5ENS80d1hqRDVkSmEvSVB4MTE2SEl5VC9h?=
 =?utf-8?Q?kfaii0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGQ0NUpnTlRCZ0FaWjBoNS93WGR3dkprQW0wZENpOGZ2NjB5VSs4TkE4V050?=
 =?utf-8?B?cFQrcUtzRnFBOUxtVi9FY2l3ZDVJbzVRNmpGSVhqUHVuZHFwUXRoSisyejky?=
 =?utf-8?B?amZpUTJHNDRQVWM3UlRyRk5OT1U0U3BJYnNKV3hlcHRjc0o2WGFrYStPNHht?=
 =?utf-8?B?dG1GM0NLQ2FDbVQ3NWdyUUtVY2IvZmVzZ29pdHQ0SnMxM2xycmJXWitxclg3?=
 =?utf-8?B?MVFyMTkxd3JJWXF3YUFqY1lKSUdad1pXVVNWL3MyanRlT0EzeHdEb3VQRDZC?=
 =?utf-8?B?UHVmdS95V3hWZU83OXhDcmduTVJMa1hqOUFMT1EvOHZTNzQwRjBqVkU0UHNR?=
 =?utf-8?B?dy9HWERwR0did2gyeVFsMzAyZnNJbVF5RWhsSThxZWoyM2JhR2Q5NmoxN2ZN?=
 =?utf-8?B?Q2lzYmhtUkNIM09OY0hwTWdFcko1VXgrVStSV3FZVVJkNldCdDR4Ujc2bFYz?=
 =?utf-8?B?djFhQlhHc2tOdm9NNEdIVURaMzNaMHZWKzZqTlBYdVUzbW1odWVoTzJraGdz?=
 =?utf-8?B?bitDV09hN3Fpak8xeFVpMDNmaVYvQmJ6UnQ3Rzd4WitCRjh2RkxqbTJCQzk3?=
 =?utf-8?B?UFNKd0FnWmxHdGVuVFd4UE1nWC9jYmxCWlV6aUloZnpmUHhiUzJQQm1LdTdj?=
 =?utf-8?B?UG1UVVFUbGtsLzczZFEvT1hvSEpXN2lwL1FFRGVweHF0L1pBQUVhanZzZFVx?=
 =?utf-8?B?ZVJ2Y0F5L2JRMmkrQVd2WmQ5RlJjbnl6eWVRcVJiQjhrN3hDRTJLRndLTWdG?=
 =?utf-8?B?azV0MGtSUGlVVXVTaTVyRFZ5cDF0bzc5aVBiWXhiOHJVU0RMQmcyTWFFcGJN?=
 =?utf-8?B?ZWVwaGVXcEVWdlBqOVRpZlJTMDREeU94dGUrRU9SYUxRNnhiTkw0STdBNFdW?=
 =?utf-8?B?OEJDWXZzaEoyMEFjSEdPSzRnKzE5dmZmc1pXZlpSMTZuajduZ1I2QjlZODg2?=
 =?utf-8?B?cGkxZEJaM2V4YXN4SnRsanlkSFNqMnA3NFErWDhVRS83KzErcFZidVUxUUZZ?=
 =?utf-8?B?dXZablRTd3YrWlRyRzNLbGNDTmF6ZHJITWtUYUtaVFlpRUtKRytUU29sV1hG?=
 =?utf-8?B?TmVXZHMwenI3RFhEc2p3K0V3K0htRkJyejNrUlFqOXlWRWpPOVlUdTJVL1Zy?=
 =?utf-8?B?bVJicy9Vb29FV01xL1NXNThWby9aQ2grd01iOTVRNW1UNVIyeG1DdG9mM0Mz?=
 =?utf-8?B?MzFkOGhQUkpGSDNVS2xJeUZ1ZVJPQ0RFMVl0YXhQaGVuZm5zYmhQeDhNb28w?=
 =?utf-8?B?NllTMVJxWnV4N2ZLNVdmakFWcDYzUVA0NHRiK3kyNUdBK25rK0R1K1UyU1M4?=
 =?utf-8?B?MlJlV0ZGUnFnc3FvQm13aTltdnRSd203RXFHYWpEY2JuZ09qSEhqTzU4Tkhm?=
 =?utf-8?B?TUMvOFE1M2s5UWZieHZsN0F0NytTRDRyRnFpMldubUpzMktBaU5lYXJMM3Bz?=
 =?utf-8?B?RXNkbW1SMEN0eWZNUFBrdGRTcU5mRThlRTY3R2lITnpDbU1Qci9jdkpZalVv?=
 =?utf-8?B?emhhRjFwcnQ1akhXd3JvQVYwU3Vnekw2blFGZmZ5aUxuNFhXY0VLVVVCRVRL?=
 =?utf-8?B?WEY4RmNPY2hpMC81RkovRFNOaDFZWUpmYzdiRUFvbmRNeVkzWnVGa2h3RFc0?=
 =?utf-8?B?OSszSDlFVExqeGJnZTNXTVV1WDBkVTNNTUlKUWtMVWRuUGZRQVdoQ2VaakNK?=
 =?utf-8?B?aXVQYWZ1TDg2UjdmTSs1aTlVd0xFclpkV2JMQ2dsSlZBV25FY25rVG13c2ZF?=
 =?utf-8?B?aW5qN05qalZKY1VLSWRkNTM1MmhWeVgrVW5mRnNKT0hZdXRsMkZLZUlSR0JG?=
 =?utf-8?B?S3pucFNSSUgyZDRWbHorK0VJbHo4bCtxZ3dyY081MVNGQ1pLeEt2NXYxQlpT?=
 =?utf-8?B?ZkdpMTdLQlpvMzhHL1RueHFUNnRoaFFObjlLRkNIZXZMdmttZjdSbWR2TWJq?=
 =?utf-8?B?NEhsdlhLcEpUOVJaczBhbmxzNVgvL0czUlhDUHVmTGNITVRlNE5USTJ6dGJC?=
 =?utf-8?B?VU9PNzlxU2ZtU1pZNFppcGtqd0tFRWI4SlBmV0dHSmREc0tJbFhtbEl3ckNs?=
 =?utf-8?B?TEdhd3d6VGZpN3pmYjc0eXpnZFhsYVZFVCtDSWFsWVl5VDZxc0tQQVl3YWxs?=
 =?utf-8?B?ZDlIZHhZU05vZXF0WTBudXZ0Kzl5WlFNcDVWQUJ0dSthUU9zS0pKK0gwMGdG?=
 =?utf-8?B?MlRXb0NGSXZLVDRMVUlCVlBiSjRWNERFRTZUcVhHZVNTbnF3NmZoYVMwVGFE?=
 =?utf-8?B?a3dGaUZNcWZ1cmQzNE5Lc2hZSHhFY0w4ak1xWDRBcEFWVmlJcURZYnhyVzFQ?=
 =?utf-8?B?cFJEcTJ3RGVJSkVVYlhaclpNR0MvaDRWZU95SWtvYnJyVWFXZEU2QT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1ada02-9ced-487b-90d1-08de5a54d2e2
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:55:49.5681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wEuO02gxftQcHJ4aJ2T1NUmuSv73nwv1b6la4Ocpn5dzlKcMVs3JgvMOTTvv2VV1a4MQ9c3FKc0fR46uEHYsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF576E2BA62
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_235553_758921_44F78720 
X-CRM114-Status: GOOD (  10.88  )
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

QWRkIHRoZSBhYmlsaXR5IHRvIHJlc2NhbiB0aGUgaTNjIGJ1cyBmcm9tIHVzZXJzcGFjZSwgaS5l
LiBwcm92b2tlCmFuIEVOVEREQS4gVGhlIHVzZWNhc2UgY291bGQgYmUgZi5leC4gYW4gaTNjZGV2
IHVzZXJzcGFjZSBkcml2ZXIKZm9yIGEgZGV2aWNlIHdpdGggYnJva2VuIGhvdGpvaW4gc3VwcG9y
dC4gSWYgdGhlIGkzYyBkZXZpY2UKYm9vdHMgc2xvd2x5LCBpdCBtaWdodCBiZSBtaXNzIHRoZSBE
REEgZHVyaW5nIGJvb3QuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBOeXN0csO2bSA8ZGF2aWQubnlz
dHJvbUBlc3QudGVjaD4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gUmVuYW1lIHN5c2ZzIGVudHJ5IGZy
b20gcmVzY2FuIHRvIGVudGRkYSwgQ29tbWVudDogSm9zaHVhIFllb25nCi0gTGluayB0byB2Mjog
aHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwMTIyLWkzY19yZXNjYW4tdjItMS04NGM3NGE0
ODNmMDNAZXN0LnRlY2gKCkNoYW5nZXMgaW4gdjI6Ci0gSW1wcm92ZWQgdGhlIGNvbW1pdCBtZXNz
YWdlIHdpdGggIndoeSIuCi0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIw
MjYwMTIyLWkzY19yZXNjYW4tdjEtMS0wYzE3MDcxZTIzMmJAZXN0LnRlY2gKLS0tCiBkcml2ZXJz
L2kzYy9tYXN0ZXIuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBi
L2RyaXZlcnMvaTNjL21hc3Rlci5jCmluZGV4IDgwZGRhMGU4NTU1OC4uYTFkODE2NjM0YTI1IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYworKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIu
YwpAQCAtNzU4LDYgKzc1OCwyOSBAQCBzdGF0aWMgc3NpemVfdCBkZXZfbmFja19yZXRyeV9jb3Vu
dF9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAKIHN0YXRpYyBERVZJQ0VfQVRUUl9SVyhkZXZf
bmFja19yZXRyeV9jb3VudCk7CiAKK3N0YXRpYyBzc2l6ZV90IGVudGRhYV9zdG9yZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYsCisJCQkgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCisJCQkg
ICAgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgY291bnQpCit7CisJc3RydWN0IGkzY19tYXN0ZXJf
Y29udHJvbGxlciAqbWFzdGVyID0gZGV2X3RvX2kzY21hc3RlcihkZXYpOworCXVuc2lnbmVkIGxv
bmcgdmFsOworCWludCByZXQ7CisKKwlyZXQgPSBrc3RydG91bChidWYsIDAsICZ2YWwpOworCWlm
IChyZXQpCisJCXJldHVybiByZXQ7CisKKwlpZiAodmFsKSB7CisJCXJldCA9IGkzY19tYXN0ZXJf
ZG9fZGFhKG1hc3Rlcik7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCX0KKworCXJldHVy
biBjb3VudDsKK30KKworc3RhdGljIERFVklDRV9BVFRSX1dPKGVudGRhYSk7CisKIHN0YXRpYyBz
dHJ1Y3QgYXR0cmlidXRlICppM2NfbWFzdGVyZGV2X2F0dHJzW10gPSB7CiAJJmRldl9hdHRyX21v
ZGUuYXR0ciwKIAkmZGV2X2F0dHJfY3VycmVudF9tYXN0ZXIuYXR0ciwKQEAgLTc2OSw2ICs3OTIs
NyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqaTNjX21hc3RlcmRldl9hdHRyc1tdID0gewog
CSZkZXZfYXR0cl9keW5hbWljX2FkZHJlc3MuYXR0ciwKIAkmZGV2X2F0dHJfaGRyY2FwLmF0dHIs
CiAJJmRldl9hdHRyX2hvdGpvaW4uYXR0ciwKKwkmZGV2X2F0dHJfZW50ZGFhLmF0dHIsCiAJTlVM
TCwKIH07CiBBVFRSSUJVVEVfR1JPVVBTKGkzY19tYXN0ZXJkZXYpOwoKLS0tCmJhc2UtY29tbWl0
OiBlM2IzMmRjYjlmMjNlM2MzOTI3ZWYzZWVjNmE1ODQyYTk4OGZiNTc0CmNoYW5nZS1pZDogMjAy
NjAxMTYtaTNjX3Jlc2Nhbi00OTIxZDBiNDFhMDAKCkJlc3QgcmVnYXJkcywKLS0gIApEYXZpZCBO
eXN0csO2bSA8ZGF2aWQubnlzdHJvbUBlc3QudGVjaD4KCgotLSAKbGludXgtaTNjIG1haWxpbmcg
bGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
