Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5198CCA0FFF
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/GobYvPNhbUS1W1CbPutQ4DUz/j7Yhnn9bF1Biu81U=; b=wgA+Gz8g9xIOwC
	In9oQXMcfFos6yvcZClDb68CdCHaq7jGBY2DuhhVEgMoVtg/ZBpelmBdJ7/rlo4EzyY4TIfIASe/Z
	gOIOpTfPVLTujOtC8OycbRUo/60hlkDy1bdp8WhbJhwb65K06ZJtVZ0sXfSJiajOAsJtoPgQsryDK
	raepe34FtzUiibedKvPVP2z744lXYp4sx0pZnRsV5iarSGlfMIHmk4pBKb3lTnTattfun49Ex0S5D
	awVrfyrFD1dDBF/xpivJdSQZkXw1ttgBWIGNUvATmc53rvxVU1xfFwXVsb/hykSznxI8B74jdtjC3
	m4bMaxIz41mumeAmlHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbw-0000000GZG7-0HMg;
	Wed, 27 Aug 2025 19:15:08 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIp1-0000000G9wm-3JcC
	for linux-i3c@lists.infradead.org;
	Wed, 27 Aug 2025 16:16:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3nwSADbEt+xdkiB32kzU86dWHvTYSlTR1rZZwNM43kiTNk40HAZyTv2HGYiE9pc4qzPB7/08WBYfTiA4prAfVX1egkD5b8ohBHetbPsbBMaXX7PvI98r63skM3MiaA8pLLv7IPkcWpCbB+rG7Gw7kdUDaVuKZUMp/TfwSyuW2HNh4xOqkuYZaRnwlwEVuN3DTj8kgRgW49uoLUACSmYnT1gyOnWG9vV7bzrZVzLzR8PnmliD0hP52RtkmVV4LlaGnHBYbGlVrNtLg6BLH3MuHDsVOOl4W08bwpeteAI62C38S8yndNVhVmtqVf7IcrtxC0Zm77OlHmPWU8yZHC7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RV/ILft7B6/5+HJfCO3vtFhtHaOeRVdmOqA9SuHOy4E=;
 b=MkW4Mwr1jFVjdIeB8jT0qD74dyZfeut8QSv0nW2MFdNMRSE8QHyVUcSBucwXXCh9SV+x0OdMshPW7A3Tm4JSmAmY95VQdMrkLBUIIZTH/B59kThlBPqYgcVUf1LD0A8kZ3LENK3z3jkspimpeBL/rFlkKh9dc0KAlZXKNTYT6jJ5E1IDbukpY5yWNaTkFI6IxhUUb829FZ8MYX+qMMehwitRRjLMyEC/XsP4VzVhPuFZodwTvFKwHF7htlhkoHbEwM7gm5F9QlfS3YW+mvy8yjc+9aTCpVcCocLVtx8aEAChthNZPJFOSnoifG2iFEQLuCA0BwrxmVJ/U4l4ocNm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RV/ILft7B6/5+HJfCO3vtFhtHaOeRVdmOqA9SuHOy4E=;
 b=cYF5tHJ2RQe78WKNc1NxfjEcjUQAXpnojTpRW1Ar9CIQz9H1pT30E/hTN5p9itaEJviBrFBS2CAPzf7hMYtlE0E1qz25G/Xzhl6XrzxQhuDfOCcXB5RruXZNpksy1fod21LmBgt+CVuAHlk1oUtTKvllpbZFiVqVZ0LUPrkEdJc+r30DchsCGc611S+6p4cJIbwKjCp8np0KqyO+FLDvQ1rwrl8ET3k72UoWxAG5GaGgjXhg3e96YDlKNSPUgD/KOUB+SEsd3fm2LDkbC2AL4s4IC9+yVKQmLxKLoeBmM3uRtg7l5FsVYkYsgtEzIQRI3eB/lnvrmYOqV+welRuTHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV2PR04MB11144.eurprd04.prod.outlook.com (2603:10a6:150:27a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 16:16:22 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 16:16:21 +0000
Date: Wed, 27 Aug 2025 12:16:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1] i3c: master: svc: Use manual response for IBI events
Message-ID: <aK8vTpg3nHkzqOYR@lizhi-Precision-Tower-5810>
References: <20250819090831.3009647-1-yschu@nuvoton.com>
 <aK3eHkf31uIw04EH@lizhi-Precision-Tower-5810>
 <CAPwEoQPnxW2jRpcqE_QSW2rNm8-zHfkTF=Ns_w7szYj-k3bTXA@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAPwEoQPnxW2jRpcqE_QSW2rNm8-zHfkTF=Ns_w7szYj-k3bTXA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:332::7) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV2PR04MB11144:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd7e861-d6a5-42ce-b504-08dde5850fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3phTVZpRmpZdDVDSnJEd0dHeS9UdWl4bEdhbkRkdnhNU0FlWG1pV3pUays3?=
 =?utf-8?B?UG10S0dFdlNBNWZLb3paR1YvK2RET2ZSdUZYa3I1OXlkNjlpN25KMW1YSnkv?=
 =?utf-8?B?YkpYOWJHR1hOdTk4TmE2Y09BYmtNdjBDUkx0bElXSGc3OTFRVWhFcndyV0Y0?=
 =?utf-8?B?N1lZMEVuWUtCN2tFcTlOZmlxRS83K1NVMkJ5RzNyaHE5cUVZekMvWE8zbmo3?=
 =?utf-8?B?MSt5SlVPSlhHNVdIQ3VYbi82aXRpTTBEYTlXNUZTNGV0akhnRktxb3BQMVFL?=
 =?utf-8?B?enBvRXFvYVV4TTgwa0VKeVlZUDJ5dVJpcmpVUzB3T1JTekFNRHZ4MzN0ZW9q?=
 =?utf-8?B?T2pLVGZVbFpucEE1R3FNWEU0MlI2MVVsTjN5aE5YSkNyay94R3VWNGlrVFJm?=
 =?utf-8?B?RzQxS1JxYXpkK3hxc2ZCZnE4SWg2SHVaVjI3RmRmUkZqTjhrM0hiLzNjS0Qr?=
 =?utf-8?B?VWNGb2V0VDJBdjFyMytHdmVRN0VRb00yeURzK3dpc3hIOTgvYVBZSVloVUxX?=
 =?utf-8?B?ck53c20weXNJZlhMZnpnK1NpQWw2a2tMWHRaZlNqWUVGTUtiaEx2Y1Z4WFJO?=
 =?utf-8?B?bzRMa3IwcUl0ckVQeXNROTF1Ym1ZVjFZOFBFR2hvSTArRkZjRGVLZ0FSWktp?=
 =?utf-8?B?OXpHbTQzS1Q4dVNuT3cxVTgvemVSSnpKVE9tVldiczFRaVZmRHlHVWl6UGl1?=
 =?utf-8?B?KzVhOWFUL0JLdXVlbnl6MmlSOWJBQXVCZ2x5M0o3MjdsMWtlWmhaeXJ6OVBN?=
 =?utf-8?B?WEFwNmV3NndxT0pIb3IvTmppMDVUT0JEamRDVDlveDgzVjV6QVl0ZnlVU3gw?=
 =?utf-8?B?aGYvcm1HQWlLMWQzcWtRTlI0dHl4a3pVMTJOcUVMREczVHV3TnNLdTQ0cXRY?=
 =?utf-8?B?SHFXV2ZxODZOejZZa0FuWlJhZHdobC9NOGtOWFZKTWRaenRsSHMvdGJWNEk3?=
 =?utf-8?B?MUdQOEZ4RUs1MFhYTGk2dmV6MEdmQ1J1dTBrS2FqNUF1d3h1K2lOUHdtWUJp?=
 =?utf-8?B?bFE1Mkc2RTVkNEwvaHpXN2JsRGI4QVdYRXF0aFN1TlFFM1VpakhVazdwYzZw?=
 =?utf-8?B?V0RGczdWOWFJZ1hqUTl1NHMzd3N3ejdGOHViS1VKSFdRY3M3NStOSGgzNmJW?=
 =?utf-8?B?SXRlbWQ3cnBvREJCT1BRNU4rYTdaWmJiVjJUYjBCS0UzaEtUeEN4amF4Qmxz?=
 =?utf-8?B?b29sQ0EyMlZ0cXQ0UEFSNzlOdGFFNC9UQnh4cUVTZk9CTHk1a0NzZGpYYVhO?=
 =?utf-8?B?djNuUDZJZHo5NUM4R0RWVSthNTZWU2IyM2ZSeWxJTGlMZ056d0FsYVBXc2Iy?=
 =?utf-8?B?RXNQZlNucUNaUDV5ZzdUQ2JiTkJmdWZHYWtsZVROeFYwWEJvVzJIRGhxa2pF?=
 =?utf-8?B?SCtISzU2cDlrWC9QNFBrN05kMFlqWVhjRUZSY3QrZmFZa1ZRb0QyN0l5K2lZ?=
 =?utf-8?B?ZXczNHlNeTQvTGUwTEZvdDR3bWZHNmpSM2c4SWlNZ3Z3VCtxcW5zcVZ0aWZ4?=
 =?utf-8?B?Szhid0hoZmNDckRlZmJUcjMwWTN6K3hZS2xITWxWTzdSM1RXQ2N1cEtKNDdB?=
 =?utf-8?B?Nkx0VllBcCtnL0djOWFNMHE4aXNwdUwxUkQ5YmtmRkFrSE1ETzRza2ZSVXdv?=
 =?utf-8?B?SjNZcEdVNU4wcEpqeXFnUmdTSmVFaWZtbWMyT1dFY0poVzRkRnczLzdQbEY0?=
 =?utf-8?B?bDZEVTBwa1lhalFpT3VLM095VStYSEwyQ1VGUlprQThMVThNc3pJRGZXSDh1?=
 =?utf-8?B?cDJBeUZ0VHBQdlVoZXorRkpNTWYzTEFxcmdBei8wNHpoRGdvUFlGYllLSDJN?=
 =?utf-8?B?dldMTGNvNnAwSWdjK0orT2lWbW1YTFNWVUlzTk8yOFYwdUdoVHB3a3MzZm1C?=
 =?utf-8?B?d3k0STNoN0VUZmZVZk9rWnNBUmRMdk5uUHpTTWlMb254MERqK1psNEpXSTBH?=
 =?utf-8?B?VG55am1LRVRrVXoxSDBmWjdiN25TdjVVdEZSTlZQVnkvS0pxekJrQ3hqM3RO?=
 =?utf-8?B?S1phc1piTzdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG9wK2hKRERYeXhwYXhmb3ZpZE5wcmI4cnNwNlk3d3dTdUN0Y1RWMzBJU2E4?=
 =?utf-8?B?d080bEIxYjNxTWdGNTdTNjd1MVRTOEJQdUF3RG04TlNWYjZRaURNSU1XQXk5?=
 =?utf-8?B?ckFHVzV4VC9jb2h5dWFURFVOc3dtdmNBbnk5OEtTK1VaVHdNb1BxWENCSUlM?=
 =?utf-8?B?UDBwelR4ZTBiY1RXQmttM0JzTlRKNHZzUWpWcnlsdmc0YmYxbVBhc2c4a3c1?=
 =?utf-8?B?NHdGMjNXM00ydXZaQ2s4R2UxS3VjK0ZvL3lGQ0xPRFZ2UTdHVnBFVkVvUCtU?=
 =?utf-8?B?ZURIWXhjUG5GdEk2R2xDQ0htNVF6WE9vSFBoem5LcW45VHI1NGVOMnBQckUx?=
 =?utf-8?B?ZG5GcTJvYWFJelhHTER3QmZtUkQ4ZXRLVGp3UG1ocTV3dmxZTWxtZUswckw4?=
 =?utf-8?B?dDBYS1NlMTZ5eFB4dEJETkdLbHU1SzVlTDU4MFNYd0xqUCt5bUpaWjl2YTVw?=
 =?utf-8?B?SkxNdDRraDI2VVNsZGZ5QTNXUU1EdFg3NDh2NHZLdW5VMkVGK2Vub3E5M0lP?=
 =?utf-8?B?SWRheHMyaHFnYm5QNDZQOGFJK29WRVZjSWhhbU5qUVJscTF1bEh3ZkJlSUtF?=
 =?utf-8?B?Ykc4Wm80Rzh2MjBqd0xXWlJHZHVXWis2NGthdTk3NUh0ZnV4eE9teEh3QzJI?=
 =?utf-8?B?N0hSa1RZVFExeUxpcFhhQ3JiTFB5VnJySWxkZEhZcG5CKzlnMER4RHFxeldt?=
 =?utf-8?B?ZDRmc3FZMDR3UFhQaFQxeXNoeTZhRmNCOWdHVFdjRHpLM28zcXJwSjBUWi9H?=
 =?utf-8?B?NVMvZXZZVTBUSUxtZ3lUczhaQXFHTWNLY1o0RDlwSlpQTlFoYnBnYjRLZUhp?=
 =?utf-8?B?dWhqUXhDbFR5enIxck91Y05wdE11Y25yRndxdW9Ldm1GcXlZU3JjMnZvNG1T?=
 =?utf-8?B?SFpiV1hIcFFwNkpvOURpekh2QTVyNEZSeWV3RFRkU09CdFRpdXFqMVVtTjMz?=
 =?utf-8?B?eDRkeHNkVjdxdzE3VVQ5TFY2Z2lSRVFpNStuZjI4WG1oVG1WdUZ6emE2YzIz?=
 =?utf-8?B?MTdKcEdsNjJaRjJyc3MvU3hQVk9sSVEyalNuYXNFNU1PVmVnejF3RzhjcFRh?=
 =?utf-8?B?bFcyQlQyRERzOTRIdlovdDRPeFBNdlZ0MnhsU2t6cFRRaG1uVTd1NGVjdWRN?=
 =?utf-8?B?MmZTOVRrYnVuTWtKd0lLM1hDTWRtN0xaSnhLdldVMVNuUXpHMnMxL2FwY1lZ?=
 =?utf-8?B?MGRaQkFRRVphNlJka0JhUkdLVUJXOEx1Y05JRnNNOGxHZS9DeUdvUldaZkMx?=
 =?utf-8?B?RmdqSTV1bHhrc3M0ZTJwMUhqK0lJSnBGVVppYWZXQWtDdUErOW1zY2tpa21X?=
 =?utf-8?B?YVdCK3M5YUdBWVFmWWRFNDZPbThnM0RGTjJ0TDdxVUE1aEVTdWE2azRGelRz?=
 =?utf-8?B?MEg0VnNQcHc2dnRyVUVoWjdvSGpnUWxTSjFDT0dNR3Rva3BGV08zZ3NJeHBI?=
 =?utf-8?B?c24reVhFVjliT2V0MDZycmhYK3BHTjF0a2FBSUxKSzI5ZFptMGxwVUNISDJy?=
 =?utf-8?B?OVBrZXZXT00yNy82eGhhUTRiQjA0RVNXaVEvOGFUc1VmYTBjRlhqakh4YU9p?=
 =?utf-8?B?eS9TdGFYMmRROEEyWm1wK3o2RmNtTnVWaXJkQ0JNZWdGdEh4VnJHUFc3aGMv?=
 =?utf-8?B?RElMVG1CbnVKTGp1UjRrMi9UaXpDVUlzU1BUczRSN1FOWFFYT3R3dG1OTDRN?=
 =?utf-8?B?YXVGWk1yVnJTNndRRWl1ayt6NS82cWdETGJ1d1E1MlRiWERoWm9qdml1anpX?=
 =?utf-8?B?T3B6b24xWTVVSHdENHpseTQ2RlZQdnNJeWRoSjcyamhrYVFXRDJLSkR2b2F1?=
 =?utf-8?B?TDRaNFF3VGliWjBGME4wVHE4NWlvdUFaRnlobnNVMmlYazBNZUZYS2w2czVv?=
 =?utf-8?B?eE93QjNUMDI0NndWTjU2WHowWEw5UUp6TEZoUDJLbFdmc3hqWVU5WlluNXhP?=
 =?utf-8?B?Z1p0M3lCT3hFWmJqV1I2RjNjdCtTWTdYYmE3M0VqajZwNWVZMmwzTk96R0c0?=
 =?utf-8?B?OVVnOG5NK2txVFpOK2RFWlVJUGNNT2d1VzFMOWxHN0UvZmlFNFUydzlHV3dl?=
 =?utf-8?B?UEVjWWpVb2xGU0pUMzA4REtvNGoveVdCUlN1Ylo1NkxUcy9Ra0hpWk5GSnVT?=
 =?utf-8?Q?o04ZUK4IHK0Fs/7fWxEC1wEA8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd7e861-d6a5-42ce-b504-08dde5850fea
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 16:16:21.8200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUUIZB0GvQAcrAjx9DGxnNb3LSVKLsPj96kOZB4vj6SN5RJ8QMyC8TWT1G3k77CPcc4w7vZevROUGrQJPXt/pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_091628_002190_CBE86765 
X-CRM114-Status: GOOD (  35.81  )
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

T24gV2VkLCBBdWcgMjcsIDIwMjUgYXQgMDg6NTQ6MDNBTSArMDgwMCwgU3RhbmxleSBDaHUgd3Jv
dGU6Cj4gT24gV2VkLCBBdWcgMjcsIDIwMjUgYXQgMTI6MTfigK9BTSBGcmFuayBMaSA8RnJhbmsu
bGlAbnhwLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBBdWcgMTksIDIwMjUgYXQgMDU6MDg6
MzFQTSArMDgwMCwgU3RhbmxleSBDaHUgd3JvdGU6Cj4gPiA+IEZyb206IFN0YW5sZXkgQ2h1IDx5
c2NodUBudXZvdG9uLmNvbT4KPiA+ID4KPiA+ID4gVXNpbmcgSUJJUkVTUF9BVVRPIGNhdXNlcyB0
aGUgaGFyZHdhcmUgdG8gQUNLIElCSSByZXF1ZXN0cyBldmVuIHdoZW4gdGhlCj4gPiA+IHRhcmdl
dCBpcyBub3QgaW4gdGhlIGRldmljZSBsaXN0LiBUaGUgc3ZjX2kzY19tYXN0ZXJfbmFja19pYmko
KSBoYXMgbm8KPiA+ID4gZWZmZWN0IGluIHN1Y2ggY2FzZS4KPiA+Cj4gPiBob3cgdGhpcyBjYXNl
IGNhbiBoYXBwZW4gc2luY2UgZGVmYXVsdCB0YXJnZXQncyBJQkkgaXMgZGlzYWJsZWQuIE5lZWQg
aG9zdAo+ID4gc2VuZCBJQkkgZW5hYmxlIGNvbW1hbmQgdG8gdGFyZ2V0IGRldmljZXMgYmVmb3Jl
IHRhcmdldCBwdWxsIFNEQSBsb3dlci4KPiA+Cj4gSGkgRnJhbmssCj4KPiBUaGlzIGlzIHRvIGV4
cGxhaW4gdGhhdCB0aGUgb3JpZ2luYWwgY29kZSBzdmNfaTNjX21hc3Rlcl9uYWNrX2liaSgpCj4g
d2lsbCBuZXZlciB0YWtlIGVmZmVjdCB3aGVuIHVzaW5nCj4gQVVUT0lCSSB3aXRoIElCSVJFU1Bf
QVVUTyBydWxlLgo+ICAgICAgICAgLyogSGFuZGxlIHRoZSBjcml0aWNhbCByZXNwb25zZXMgdG8g
SUJJJ3MgKi8KPiAgICAgICAgIHN3aXRjaCAoaWJpdHlwZSkgewo+ICAgICAgICAgY2FzZSBTVkNf
STNDX01TVEFUVVNfSUJJVFlQRV9JQkk6Cj4gICAgICAgICAgICAgICAgIGRldiA9IHN2Y19pM2Nf
bWFzdGVyX2Rldl9mcm9tX2FkZHIobWFzdGVyLCBpYmlhZGRyKTsKPiAgICAgICAgICAgICAgICAg
aWYgKCFkZXYgfHwgIWlzX2V2ZW50c19lbmFibGVkKG1hc3RlciwgU1ZDX0kzQ19FVkVOVF9JQkkp
KSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc3ZjX2kzY19tYXN0ZXJfbmFja19pYmkobWFz
dGVyKTsKPiAgICAgICAgICAgICAgICAgfQoKT2theSwgaTNjIHRhcmdldCBtYXkgc3RheSBpbiBJ
QkkgZW5hYmxlIHN0YXRlIGlmIGhvc3QgcmVib290LgoKd2hhdCdzIGJhZCB0aGluZyBoYXBwZW4g
aWYgaG9zdCBBQ0sgSUJJPyBvdGhlciBJUHMgSUJJIGF1dG8gaGFuZGxlZCBieQpoYXJkd2FyZSwg
SSB0aGluayB0aGVyZSBhcmUgbm90IGNvbXBsZXRlIGxvZ2ljIGluIHRoZXNlIElQLgoKPgo+ID4g
Pgo+ID4gPiBBdXRvSUJJIGhhcyBhbm90aGVyIGlzc3VlIHRoYXQgdGhlIGNvbnRyb2xsZXIgZG9l
c24ndCBxdWl0IEF1dG9JQkkgc3RhdGUKPiA+ID4gYWZ0ZXIgYW4gSUJJV09OIHBvbGxpbmcgdGlt
ZW91dC4gVGhlIGZvbGxvd2luZyBzZXF1ZW5jZSBpcyB0aGUgY2FzZToKPiA+ID4gMS4gVGFyZ2V0
IHB1bGxzIFNEQSBsb3cKPiA+ID4gMi4gU0xWU1RBUlQgaW50ZXJydXB0IHRyaWdnZXJzIHRoZSBJ
QkkgSVNSCj4gPiA+IDMuIFRhcmdldCByZWxlYXNlcyBTREEKPiA+ID4gNC4gRHJpdmVyIHdyaXRl
cyBBdXRvSUJJIHJlcXVlc3QgdG8gTUNUUkwKPiA+ID4gNS4gU0RBIGlzIGhpZ2gsIHNvIEF1dG9J
QkkgcHJvY2VzcyBkb2VzIG5vdCBzdGFydAo+ID4gPiA2LiBJQklXT04gcG9sbGluZyB0aW1lcyBv
dXQKPiA+ID4gNy4gQ29udHJvbGxlciBzdGF0ZSBpcyBBdXRvSUJJIGFuZCBkb2Vzbid0IGFjY2Vw
dCBFbWl0U3RvcCByZXF1ZXN0Cj4gPiA+Cj4gPiA+IEVtaXR0aW5nIGJyb2FkY2FzdCBhZGRyZXNz
IHdpdGggSUJJUkVTUF9NQU5VQUwgYXZvaWRzIGJvdGggaXNzdWVzLgo+ID4gPgo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBTdGFubGV5IENodSA8eXNjaHVAbnV2b3Rvbi5jb20+Cj4gPiA+IC0tLQo+ID4g
PiAgZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCAxNiArKysrKysrKysrKy0t
LS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1h
c3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiA+ID4gaW5kZXgg
NzAxYWUxNjViMjViLi4xNzY0NGUwNDFiNDQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvaTNj
L21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9z
dmMtaTNjLW1hc3Rlci5jCj4gPiA+IEBAIC01MTcsOSArNTE3LDEwIEBAIHN0YXRpYyB2b2lkIHN2
Y19pM2NfbWFzdGVyX2liaV9pc3Ioc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIpCj4gPiA+
ICAgICAgICAqLwo+ID4gPiAgICAgICB3cml0ZWwoU1ZDX0kzQ19NSU5UX0lCSVdPTiwgbWFzdGVy
LT5yZWdzICsgU1ZDX0kzQ19NU1RBVFVTKTsKPiA+ID4KPiA+ID4gLSAgICAgLyogQWNrbm93bGVk
Z2UgdGhlIGluY29taW5nIGludGVycnVwdCB3aXRoIHRoZSBBVVRPSUJJIG1lY2hhbmlzbSAqLwo+
ID4gPiAtICAgICB3cml0ZWwoU1ZDX0kzQ19NQ1RSTF9SRVFVRVNUX0FVVE9fSUJJIHwKPiA+ID4g
LSAgICAgICAgICAgIFNWQ19JM0NfTUNUUkxfSUJJUkVTUF9BVVRPLAo+ID4gPiArICAgICAvKiBF
bWl0IGJyb2FkY2FzdCBhZGRyZXNzIGZvciBhcmJpdHJhdGlvbiAqLwo+ID4KPiA+IE5lZWQgY29t
bWVudHMgaGVyZSB3aHkgUmVxdWVzdF9BdXRvSUJJIG5vdCB3b3JrLiBJIHRoaW5rIGl0IGlzIElQ
IGRlc2lnbgo+ID4gZGVmZWN0IHRvIG1ha2UgUkVRVUVTVF9BVVRPX0lCSSB1c2VsZXNzLgo+IEl0
IGlzIG5vdCBhbiBJUCBkZWZlY3QuIFBlciBzcGVjLCBBdXRvSUJJIGVtaXRzIGEgU1RBUlQgd2l0
aCBhZGRyZXNzCj4gNydoN0Ugd2hlbiBhIHNsYXZlIHB1bGxzIFNEQSBsb3cuCj4gQSBTREEgZ2xp
dGNoIChoaWdoLT5sb3ctPmhpZ2gpIGNhbiBjYXVzZSB0aGUgY29udHJvbGxlciB0byByZW1haW4g
aW4KPiBBdXRvSUJJIHN0YXRlLgo+IDEuIFNEQSBoaWdoLT5sb3c6IHRyaWdnZXIgSUJJIGlzciB0
byBleGVjdXRlCj4gMi4gU0RBIGxvdy0+aGlnaAo+IDMuIElCSSBpc3Igd3JpdGVzIGFuIEF1dG9J
QkkgcmVxdWVzdCwgdGhlIGNvbnRyb2xsZXIgd2lsbCBub3QgZW1pdCBhCj4gU1RBUlQgYmVjYXVz
ZSBTREEgaXMgbm90IGxvdy4KClRoaXMgaXMgb3ZlcmFsbCBkZXNpZ24gcHJvYmxlbSwgbm90IElQ
IGltcGxlbWVudCBwcm9ibGVtLiBBVVRPX0lCSSB3YWl0IFNEQQpsb3cgaXMgd3JvbmcuIE5vcm1h
bGx5IGNhc2UsIHRhcmdldCBtYXkgcmVsZWFzZSBTREEgYWZ0ZXIgcHVsbCBkb3duIFNEQSBsb3cK
Zm9yIHNvbWUgdGltZXMgdG8gYXZvaWQgbG9jayBidXMuCgphZnRlciB5b3VyIHBhdGNoLCB5b3Ug
d2lsbCBmaW5kIG5vIHBsYWNlIHdpbGwgbm90IHVzZQpTVkNfSTNDX01DVFJMX1JFUVVFU1RfQVVU
T19JQkkgYXQgYWxsLiAgU28gU1ZDX0kzQ19NQ1RSTF9SRVFVRVNUX0FVVE9fSUJJCmJlY2FtZSB1
c2VsZXNzLgoKQWRkIGNvbW1lbnRzIGhlcmUgd2h5IG5vdCB1c2UgU1ZDX0kzQ19NQ1RSTF9SRVFV
RVNUX0FVVE9fSUJJIHRvIGhlbHAKZGV2ZWxvcGVyIGtub3cgdGhpcyBwcm9ibGVtIGJlY2F1c2Ug
U1ZDX0kzQ19NQ1RSTF9SRVFVRVNUX0FVVE9fSUJJIGxvb2sKbGlrZSBzaG91bGQgYmUgdXNlZCBp
biBoZXJlIGZyb20gSVAgc3BlYy4KCj4gNC4gRmluYWxseSBJQklXT04gcG9sbGluZyB0aW1lcyBv
dXQsIHRoZSBjb250cm9sbGVyIHJlbWFpbnMgaW4gQXV0b0lCSSBzdGF0ZS4KCj4KPiA+Cj4gPiBP
bmx5IGNvbmNlcm4gaGVyZSBpcyB0aGF0IHN2Y19pM2NfbWFzdGVyX2Fja19pYmkoKSBuZWVkIHNl
bmQgaW4gMTAwdXMgYnkKPiA+IGkzYyBzcGVjIHJlcXVpcmVtZW50Lgo+IFRoZSBmdW5jdGlvbiBz
dmNfaTNjX21hc3Rlcl9hY2tfaWJpKCkgZXhlY3V0ZXMgcHJvbXB0bHkgaW4gdGhlIElSUQo+IGhh
bmRsZXIsIHRha2luZyBtdWNoIGxlc3MgdGhhbiAxMDDigK91cy4KCk92ZXJhbGwgSSBhbSBhZ3Jl
ZSBvbiB3aGF0IHlvdXIgY2hhbmdlLCBidXQgY2xlYXJpZnkgc29tZSBzaXR1YXRpb25zLgpNYW51
YWwgaGFuZGxlIElCSSBpcyBub3QgZ29vZCBpZGVhIG92ZXJhbGwuIENvcmUgbWF5IHJ1biBzb21l
IEVMMi9FTDMgY29kZXMuCgpmb3IgZXhhbXBsZSwgaW1wcm92ZSBTVkNfSTNDX0lCSVJVTEVTX0FE
RFIgYW5kIGxldCBTVkNfSTNDX01DVFJMX0lCSVJFU1BfQVVUTwp0byBjaGVjayBpZiB0YXJnZXQg
YWRkcmVzcyBpcyBrbm93biBsaXN0LgoKVGhhbmsgeW91IGZpbmQgdGhpcyBwcm9ibGVtIGFuZCBw
cm92aWRlIHNvbHV0aW9uLiBJIHRoaW5rIGp1c3QgYWRkIGNvbW1lbnRzCmluIC8qIEVtaXQgYnJv
YWRjYXN0IGFkZHJlc3MgZm9yIGFyYml0cmF0aW9uICovIHRvIHNob3cgd2h5IGhhdmUgdG8gdXNl
ClNWQ19JM0NfTUNUUkxfUkVRVUVTVF9TVEFSVF9BRERSLgoKRnJhbmsKPgo+IC0tLQo+IFRoYW5r
cy4KPiBTdGFubGV5Cj4gPgo+ID4gRnJhbmsKPiA+Cj4gPiA+ICsgICAgIHdyaXRlbChTVkNfSTND
X01DVFJMX1JFUVVFU1RfU1RBUlRfQUREUiB8Cj4gPiA+ICsgICAgICAgICAgICBTVkNfSTNDX01D
VFJMX0lCSVJFU1BfTUFOVUFMIHwKPiA+ID4gKyAgICAgICAgICAgIFNWQ19JM0NfTUNUUkxfQURE
UihJM0NfQlJPQURDQVNUX0FERFIpLAo+ID4gPiAgICAgICAgICAgICAgbWFzdGVyLT5yZWdzICsg
U1ZDX0kzQ19NQ1RSTCk7Cj4gPiA+Cj4gPiA+ICAgICAgIC8qIFdhaXQgZm9yIElCSVdPTiwgc2hv
dWxkIHRha2UgYXBwcm94aW1hdGVseSAxMDB1cyAqLwo+ID4gPiBAQCAtNTM5LDEwICs1NDAsMTUg
QEAgc3RhdGljIHZvaWQgc3ZjX2kzY19tYXN0ZXJfaWJpX2lzcihzdHJ1Y3Qgc3ZjX2kzY19tYXN0
ZXIgKm1hc3RlcikKPiA+ID4gICAgICAgc3dpdGNoIChpYml0eXBlKSB7Cj4gPiA+ICAgICAgIGNh
c2UgU1ZDX0kzQ19NU1RBVFVTX0lCSVRZUEVfSUJJOgo+ID4gPiAgICAgICAgICAgICAgIGRldiA9
IHN2Y19pM2NfbWFzdGVyX2Rldl9mcm9tX2FkZHIobWFzdGVyLCBpYmlhZGRyKTsKPiA+ID4gLSAg
ICAgICAgICAgICBpZiAoIWRldiB8fCAhaXNfZXZlbnRzX2VuYWJsZWQobWFzdGVyLCBTVkNfSTND
X0VWRU5UX0lCSSkpCj4gPiA+ICsgICAgICAgICAgICAgaWYgKCFkZXYgfHwgIWlzX2V2ZW50c19l
bmFibGVkKG1hc3RlciwgU1ZDX0kzQ19FVkVOVF9JQkkpKSB7Cj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICBzdmNfaTNjX21hc3Rlcl9uYWNrX2liaShtYXN0ZXIpOwo+ID4gPiAtICAgICAgICAg
ICAgIGVsc2UKPiA+ID4gKyAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgaWYgKGRldi0+aW5mby5iY3IgJiBJM0NfQkNSX0lCSV9QQVlMT0FEKQo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdmNfaTNjX21hc3Rlcl9hY2tfaWJpKG1hc3Rl
ciwgdHJ1ZSk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBlbHNlCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN2Y19pM2NfbWFzdGVyX2Fja19pYmkobWFzdGVyLCBmYWxz
ZSk7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBzdmNfaTNjX21hc3Rlcl9oYW5kbGVfaWJp
KG1hc3RlciwgZGV2KTsKPiA+ID4gKyAgICAgICAgICAgICB9Cj4gPiA+ICAgICAgICAgICAgICAg
YnJlYWs7Cj4gPiA+ICAgICAgIGNhc2UgU1ZDX0kzQ19NU1RBVFVTX0lCSVRZUEVfSE9UX0pPSU46
Cj4gPiA+ICAgICAgICAgICAgICAgaWYgKGlzX2V2ZW50c19lbmFibGVkKG1hc3RlciwgU1ZDX0kz
Q19FVkVOVF9IT1RKT0lOKSkKPiA+ID4gLS0KPiA+ID4gMi4zNC4xCj4gPiA+CgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
