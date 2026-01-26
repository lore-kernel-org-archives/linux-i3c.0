Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8002AC88E72
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jan 2026 08:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DvATLAyY9fcw0tkR2W4ZemFt3Emk5+trCRE5vDkQq08=; b=sdKtxSV8lxNCBt
	XRaTyapUZ5QdmKmLF1SwFg4M7lPjaC2fdn7YfxGV/jHfPSAhVMGO5SAT05kBAAd6Eik2nghjbFPsr
	6ZGgmCCCXE88Yl7famVwSeNgUYtie+ZAYxn3No6ShIxEAXQb2nM8PwJb48kSgRmpspMx2VQWlqvnh
	cPC1BLcNoEh7kChb8xDVYzS5KnFAqmO+aV2o5d03SCtJIhUPFdTdEJpchG2Iup+kwZ6AVAWu+2gvl
	dIninkA00nqPROA+U5QYttGpi9c7pZAJlruKy/VnYpaiuOeDC8TBKCwGHmB7Kjx7IhGpk3zZKh256
	6OuNCPyq5I7MaFP4FxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkI67-0000000C795-14we;
	Mon, 26 Jan 2026 08:37:23 +0000
Received: from mail-northeuropeazon11010029.outbound.protection.outlook.com ([52.101.84.29] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkI64-0000000C78d-27E5
	for linux-i3c@lists.infradead.org;
	Mon, 26 Jan 2026 08:37:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPs69ARQ6phQ12O89O5/l1hKkzCzqtm/nIfOXaRgZrc8eGj+R1rKEETrvmg/mf92m7lQbr0uezHNMjFI6MQ4jHsid/8EMUmWROpLzEwE3BZzf2gB2W/JCBODjcHYR4zbpn5ETGUXzlkgi9sdujfP4BrKeKRgSSIRUlStaA0qBj83TCVsydAFviaVjB2EescFMfX3jpANkbFdk/z0VzZg5uuez/hgTzwJZnkORkSOsStcejBxVvQPcg6unpnlm4O6mwQy4doBVpvOClGMF45ezqsbTpY9cur8z19wDDzvJkAxKBFF75pmvbKOuHbvWfq61w7vRJe1l5VyjauorGORhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Drcunhx22U+hgD6pnjX7IU5AqJNZmm3ZhKaTmBMLL0=;
 b=QJ9NQMMetwkDSvD8dC317k3bLGrmpvJ7n9xXegRm1pVS3YEHJTR7ArfORtPAeK/8vjqo9N8Nte+cQK+P8EUBZlUmFwQ8PXEglmNts58/VihWtqqSVoju8ragMi5Dgj7e8zEaxfMTdwhpOl44oCVVIsbI/Wyxm3ciKssRY4Thw1/SJ2DEq2T/uNi5zz5o+EhwiElMkf3HTViqNbBXVlrQsG13YO/TOcAF3CJiL1JdEqBC5TSSKJi7LiUKph3rdAd6NsPHsESuZ6UEcCMpoTG4TDAT2eC4fcqDKjhI9x0/ke7kJBGFfX5/pwqF335UI45fdVaAHGfWcrNU/YM2+LtvIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Drcunhx22U+hgD6pnjX7IU5AqJNZmm3ZhKaTmBMLL0=;
 b=db3K4bQtZwU5ld7H7PrdoP76PhvQN1Pptz+nhuZS0GLmlaNb4qvNC0F9Sb9WLCqFuHzp0EvbNPXSxPt9lkIxSoUZHWgkXPsKlwYMuTnleo5c/s8KoUn0FGvwcgai3HEUJeWtSO3/LEZYdW0KDd73IrkSDrJrFGI6c7Tg4Q155gW4ZO1q/Z6+/Cm6+PKX2p2Ib4+dSPH2NXS5NscAt+VAcsZ858ekHnzhU/U3NWZ8OfOpIcxwEtqifFFUb2hnJI1inGG7lQloxjWYodz0ZgVgBpxH3t6NeUbV6ezh3J4j3bt/iLZVa5E3sJSKr3rlJlBs7TcQANxYf42ttgR5zud82Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by PA4P189MB1230.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 08:37:14 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 08:37:14 +0000
From: =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
Date: Mon, 26 Jan 2026 09:37:01 +0100
Subject: [PATCH v4] i3c: master: Add sysfs option to rescan bus via entdaa
Message-Id: <20260126-i3c_rescan-v4-1-6b3559d82abc@est.tech>
X-B4-Tracking: v=1; b=H4sIAKwnd2kC/3WNyw6CMBBFf4V0bc3MtPJw5X8YY0oZpC7AtEg0h
 H+Xogs0cXmSe84dRWDvOIh9MgrPgwuua2fQm0TYxrQXlq6aWRBQCoipdMqePQdrWqkLwgpKjQZ
 AzMLNc+0eS+x4enO4l1e2fSzEReNC3/nn8jZg3H3CROvwgBIlWMwgQyZF5YFDv+3ZNiJ2B/pv0
 mzm2mba6FzVoH5MtTbVl6niJ6WaitqATXcrc5qmF8eUKK0pAQAA
X-Change-ID: 20260116-i3c_rescan-4921d0b41a00
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joshua Yeong <joshua.yeong@starfivetech.com>, 
 =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769416629; l=3557;
 i=david.nystrom@est.tech; s=20251215; h=from:subject:message-id;
 bh=dfF4j9J4WuaVWgmK/QrXE91IMEbM7LfhnNxn5UJtoCU=;
 b=e2C5yLs/wOadunjzjKF2inZcjoebd3p5fO9JyRTMcElh+EUTe0Xok7sMKJTNjkEE49MgbbsPN
 SSXLK8hC7YXATpcNk6l2SPVnXg+06HoyrNLKqPEjVGZRd+s2L2+Di5j
X-Developer-Key: i=david.nystrom@est.tech; a=ed25519;
 pk=4E3iRjA+3w+a4ykfCHDoL5z4ONs9OcY4IN3pTwIG7Bs=
X-ClientProxiedBy: GV3P280CA0081.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::21) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|PA4P189MB1230:EE_
X-MS-Office365-Filtering-Correlation-Id: ecdbf366-d680-4f81-924e-08de5cb61b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2JucnlwY1BtWm5qYUNOb1VGbWQyT1ZrYjgyWHVWa0pBcDBLK3Q5cWJYMzFx?=
 =?utf-8?B?ZGpyczVDWE05ME9jajdrZFpaMTBleDNrbEpiSmFXdHJzUnJQbVpkQWxGOTIz?=
 =?utf-8?B?N2dhRFJ5dk9WWFJOblZCcjloSThkazFVMjUrVk04d3NlVUZmY1dZN0ZxSzhJ?=
 =?utf-8?B?NnFLdGltemtTU3JOOCt5WWZGejNvMnhTZlloNmF1U2tKUGVkUnVQZmhyVWVi?=
 =?utf-8?B?WVl4bk5SMStqZE5UdUNVVkYrZXJCRUZHby9FeE93VkdMS2l1RHJZNXhMOWJj?=
 =?utf-8?B?ckRBN25wU3V0ZktTbUU5aVBzdkFjaE1USjFHRm0zTEJ4L1JHYmcxLzRxeS9Z?=
 =?utf-8?B?aVp4QzloZjlXOHl0VUdHR3N5VFhtMkVoNjgvcnZIQ2pxOUZnWEN2UktOMm9M?=
 =?utf-8?B?MFRZaEVCSEo4clZHc1IvSWExczhBV0RSK24wWWlFT0lST29JYVVGa3FBRG9L?=
 =?utf-8?B?c1VlOVJlckh4d1RTY1NPb25jeXNHc0lOVkZibytXWUp4dWszZ29zRnhzN3ky?=
 =?utf-8?B?Vytlb283Yy8wY2NtV3hreHpDY3I5ZXZQKzhCWVM3WFlVTWdJZ1NHbnM5V1ZU?=
 =?utf-8?B?elIzV1krSzdWdWh1YUtjOFR5cllkb25KamwxY1NxQ2J4VHZGWmFieFlodjNG?=
 =?utf-8?B?T0tjaGVxa29JSXN1dVBWTDhKSTR4TG9wbi9rZHBmam5RWXo0L1VNcHBsbTB3?=
 =?utf-8?B?YTgweDBJa0RNSFlsWW5HOUNaNllQem9xK1RMS3RlQ2RZOEpwdWZFYzQ1RVZy?=
 =?utf-8?B?QlptOHpYbEU5ZWR0bFdYazlTOGtqbnBvNjlQdmRsWnJocFlXR2IxREpQMHFt?=
 =?utf-8?B?bVhpMG5XdUFZQ2xRV1Y1ZWt1Qzh1b2RwcWtuaTFLcG9nMDlsSXVmcmdzQ1p3?=
 =?utf-8?B?L25HcnJJWmh2cmZheW9iUE1KNVZ0ZW0wblVuc2UyeU9pZWgxa2hsYTZaelFE?=
 =?utf-8?B?SWRXNjlLVmhtbkVsQjlXTFFULytvVlJCcXVJNk9oTVlEd3NKMEwyVzMzcld4?=
 =?utf-8?B?T2FTQzV4bUhnRTlTeUsrbXpUaGFYWmNUQm9YRG44Qk5rOUNpZGFRV1l0Y2NH?=
 =?utf-8?B?UHVSUVRDSlU4ejdZb0tlTGVQS24xaUJjaURtM2dPY1N5T3hUdWlpVFpCbS9j?=
 =?utf-8?B?R1A1alVsTHNkSjVWc3B5bTJFbTJBOStBZWpJK2NSdlc4cVFwTC9HbFdWK0gw?=
 =?utf-8?B?VmJrOFhzY1lGYm9GUUlJbVV3ajlYS0ZYaysrUnk1dGRTdVp4akYzeU9uckht?=
 =?utf-8?B?UVUwYnBTZGdQNHVidVUxL3l5RHN1VUh6aUR4OGpiVFpTcWxSY2UvbGpzY1lL?=
 =?utf-8?B?aHM3RXUyVE5ldFk0bjNuM2k5ODFUZ0lqc2w2ZnN4OWVLVFAvc3ZIYVJ3SVAx?=
 =?utf-8?B?S1o5WHl4b2pwbHdPK0hzOE1yazRpd0ZxalcwZ05ZK3crQkNKM3RmY3BxRTlN?=
 =?utf-8?B?ZkVCcW5vZ0F4MGFDODF1bmJ0Y3lQSXdiMHluZ1llSHJXSjBvMDBEZkVZbW40?=
 =?utf-8?B?aWhMSk8rdmozQ200M1RzN1E1MTYwd3NycmNHU0tMaFdWYkNIcmlLZlVybWpN?=
 =?utf-8?B?eXJodFNHY2xtc09oNEVWUlBjSXorbHIxTEpVSlZnMEIrbFpkV2VnSXhqaXN1?=
 =?utf-8?B?NFJJOEV2emZ4a3NDZEg3NlhOK09weS90a1d0NlNEM3JmSHRkMWNscG1tamNV?=
 =?utf-8?B?OGlDcW5VM0hWWDlQMlovTndzMlN5UlB4Sk9weDBjUmx1T2ZmNWlydXE4QmEx?=
 =?utf-8?B?by9sTzU3OFJTZEFYcUFiczFwamtGcjJkYzFmSG5nNkdTVkdhMWtkeUtYb0lp?=
 =?utf-8?B?YUZIbUJGODQwNG5NQ1BFRzZBVWxNeGJxOWR3UVRaRFFUZ3NRUlJMU0ZDQlMw?=
 =?utf-8?B?RGJWUnFHL2xvR3d4TDJ3WUxSVlZPemxkWWVTdzNUWjNEQjNTVUN6b0lWdDEv?=
 =?utf-8?B?eDdpV2N6ZzhNUGZaUHgvTlhPeHloSEFkdnlPUk5JUW1DaWk2NDB1eTBxWXhJ?=
 =?utf-8?B?b2tadGZLMWxaRUg1UjNuZlZkSXdodVNKZ3g5Rmx4cWZZVlFDUEs5K0U1OTRp?=
 =?utf-8?Q?ZZJGE9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1BzbWVlN2J0dE1RRDRuY2dKMTZwamI2NFNCN1c4ZTRpVndUMkpLdFBNUlJD?=
 =?utf-8?B?dXhuQis5QnAwb3lLUTlsZnZNTGxkSWc2NDZnZ3VtVTZZNjNmbUZ2OENPQmR6?=
 =?utf-8?B?T3ozTHRrWTc3OVF6aWFsM2JSTVc5cVhseUg3dlV5WFF1bHMrVnNuWFVzcmxT?=
 =?utf-8?B?VWRrQVBuU1dQUXZQTXEvZUFYSDVTa25HaElPQlovSG9FekJqeTdXTVNJMTZU?=
 =?utf-8?B?N000WHRnMXJqeHZnUmQvOFN5VEc5eG92ZEFhVFBmNHJic0drWTAvalNHVkRK?=
 =?utf-8?B?VEZhU2FWY2Z1SGJ0akhRR05yQVlxNDhTaTFla1VaMFlUTm5hUmlGMkwvT01l?=
 =?utf-8?B?Q0xHckljOXQ2ekQvVUtzaFVGVG9NS2oyMFNML2dOVUdqNnp5QzljUk5UL2JM?=
 =?utf-8?B?RUVlSm5LZ1FQcW1XMEJERkU0UkRObFVzV3JaTmhOYXJ2U1YzRXFBdlZhZjF4?=
 =?utf-8?B?QkZJVlpMTEJXUmNHZlptcG04OGk2QU5tRHRYYThkaVR3UDFqazZRcWZadWxi?=
 =?utf-8?B?d0pic3U3bFZPTjNpaUUxdXRHREI5L3E2VlRNL2lvNWRyYXhtdWdXZGZkRjda?=
 =?utf-8?B?RnRKbXdETzFzOTBEY3ZPWFZsRzdGaGlKYnUrSkI4ZXFTNS9wQWl1TlJKQzF4?=
 =?utf-8?B?RUc2cWYrL0diSzZ4NG1HblFOZW91MnZtcUZWQ2hOQ0JGa25VVDdOOTFGem8y?=
 =?utf-8?B?THI4TDhMZmNpcmtqajdOS1lyN2tYLzVxVSswU2V0czU2Y05TYkEzU3hOdGFL?=
 =?utf-8?B?ck5Ocm5ITDQvVmVWY2N3WjZmakg4d2U1Yzlxd0FJbTNRL3daKzdMM2VEVWZU?=
 =?utf-8?B?bXJvS2hNbmlZQ2s2TTNkL0FITXBJVDQ3NHBGc2VldEJuM2FUSlhVeGI4dVR1?=
 =?utf-8?B?Y094Z09kd0tjcDRMeWRLVHJRTERZMHhDNFNHZWJCOEZoeGttRHMrWHZZRXEv?=
 =?utf-8?B?TGMrL1RqQU9KMUJpNEt6bGc0bU5FOHI5eXpSS3YrcnprcHdROXlMUlJXWE0x?=
 =?utf-8?B?OWNYYjE5aUdLU0pTLzNPeVJibWIrVlZFL1hhMG1oR0xCL2htMlNYMXVPUmlX?=
 =?utf-8?B?dU1ZWjdzOFEzcWpMdXpLSTBNODR5TTJxdCtGRTFLT1pPa01DTnNuWUhRQ0NM?=
 =?utf-8?B?VmhyQ0NJNXN5N2NYRmZ2WWhQM0FHOUtmcHZnZVhvVVVYWm5GY09lUitVSmpj?=
 =?utf-8?B?VmxaZTU4L1IyRnBnckRkK214dk4xMXJHY2VVdXplQUJIVWRKZXhYN3FCMjZ0?=
 =?utf-8?B?ZEkrd1lsTGtoZXFpV3hRY0hWSExlVWgvWjhyL2V3UkJpdUdaMHVyNHhQOUtC?=
 =?utf-8?B?YW1aMURaVVQrTkFLZU8xcGwxTlI2bGdraktOenFlQzUzMjlhL21EZHBTbzlU?=
 =?utf-8?B?RzZocFc2TG01cFRHT1BmUHJKeVVkZDFjRjVuRkdXbXAyeCtFeTcvdmNuWlQy?=
 =?utf-8?B?SjlKR2owUVl6aUdDVWxWbFRlbUZNOUxtWkJGVFZuTFJNU2hpZG8ramRPTXRZ?=
 =?utf-8?B?Vzd5bDkzdFNmQWhvajl2QUhuVE5XNWdHcDZCU1crVXFGVUNSZFg0MGF6ZjVG?=
 =?utf-8?B?VFJUQk1LY0Examd6TVdHMVExdm1UVjN5Nk90cU9HdkZrVms4YnNkbDZ2UEt2?=
 =?utf-8?B?WkE0UjF3SjRJR3ZZMTBic3J0dlRoZ21hMTM4SFd4bE1heDVya1VTcmZtV0tW?=
 =?utf-8?B?WnNXek9NL1FZZmpNMG5sOFZqVjJZNmJvNnp1ZUFyYnFvVUZ1TjlCZlNwNVJO?=
 =?utf-8?B?ZCswN2pNcW5HMnFnamdNZFphYUFGa3pCckZiWHMwejE4eHQzOXdFSzdDK2xH?=
 =?utf-8?B?MmNFM0F5ZlA4Qi82UmFxYnp4NDBRVGxrN1ZObkxkd2pHdFE4Zk5NTk41bjNi?=
 =?utf-8?B?MWhTS0VqVzU5eHZKb3N6NzJqNkdHOWVrdkR1SnV5QnYrQWllMUdCNGVWUWtH?=
 =?utf-8?B?cU5zdTlRMmpIeXMxODc1VmZJVnZqZSthMlpWcVpOVnBoOFVnY3o0MTYwek40?=
 =?utf-8?B?RVM4aS9ibnZ5NmxGY2hZWlN3Y3BEMi9SeXpMclZYamlMNDEyVEsreVNzdG9x?=
 =?utf-8?B?NURxL0NpdXl1WktHMmRhWTh2ZjV3bmhsRTQ5TEFOaHB3WURvYWRScVova0Ex?=
 =?utf-8?B?bU41Sk9uMnFpWXNuTjVSWGcyaGt6Z0ZkaG1XdVc2SEFTWFZ4ckZhR3VMcmJh?=
 =?utf-8?B?SnBnRlZiMjUxemZuUTBEUy9yd2xKbTRRYU51eHdscmc3VVdCUUxjV2ZSZDBn?=
 =?utf-8?B?MDIwRlU2WER1MkcxUFpacjhkRDFnMi9NZlBBcFdUTUZsSG4xWm4xM3ZOWldP?=
 =?utf-8?B?VlFCYmhPUE9PRjZ0bW9sMUxnSUUrSUZSS01vNi9wY2FmcHJQV1dRdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdbf366-d680-4f81-924e-08de5cb61b17
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:37:14.2294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VtjdlRal4DhnOaK1f41FLGpPKhnSlNLbZREyk5PZs4FcsRCSMDNuZ3Fv4Xmpr1DSwb/VABKWamHs/kIoYfBaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_003720_623280_FEEB9A46 
X-CRM114-Status: GOOD (  12.44  )
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

QWxsb3cgdXNlcnNwYWNlIHRvIHJlcXVlc3QgZHluYW1pYyBhZGRyZXNzIGFzc2lnbm1lbnQsIHdo
aWNoIGlzCnVzZWZ1bCBmb3IgaTNjZGV2IGRldmljZXMgd2l0aCBicm9rZW4gaG90LWpvaW4gc3Vw
cG9ydC4KVGhpcyB3aWxsIGFzc2lnbiBkeW5hbWljIGFkZHJlc3NlcyB0byBhbGwgZGV2aWNlcyBv
biB0aGUgSTNDIGJ1cwp3aGljaCBhcmUgY3VycmVudGx5IHVuYXNzaWduZWQuCgpTaWduZWQtb2Zm
LWJ5OiBEYXZpZCBOeXN0csO2bSA8ZGF2aWQubnlzdHJvbUBlc3QudGVjaD4KLS0tCkNoYW5nZXMg
aW4gdjQ6Ci0gSW1wcm92ZWQgY29tbWl0IG1lc3NhZ2UsIG9uY2UgbW9yZS4gQ29tbWVudDogRnJh
bmsgTGkKLSBBZGRlZCByZXF1aXJlZCBkb2N1bWVudGF0aW9uIGZvciBzeXNmcyBhZGRpdGlvbi4g
Q29tbWVudDogRnJhbmsgTGkKLSBMaW5rIHRvIHYzOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsv
MjAyNjAxMjMtaTNjX3Jlc2Nhbi12My0xLTAyNjQyOWZhMGM2NUBlc3QudGVjaAoKQ2hhbmdlcyBp
biB2MzoKLSBSZW5hbWUgc3lzZnMgZW50cnkgZnJvbSByZXNjYW4gdG8gZW50ZGRhLCBDb21tZW50
OiBKb3NodWEgWWVvbmcKLSBMaW5rIHRvIHYyOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAy
NjAxMjItaTNjX3Jlc2Nhbi12Mi0xLTg0Yzc0YTQ4M2YwM0Blc3QudGVjaAoKQ2hhbmdlcyBpbiB2
MjoKLSBJbXByb3ZlZCB0aGUgY29tbWl0IG1lc3NhZ2Ugd2l0aCAid2h5Ii4KLSBMaW5rIHRvIHYx
OiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjAxMjItaTNjX3Jlc2Nhbi12MS0xLTBjMTcw
NzFlMjMyYkBlc3QudGVjaAotLS0KIERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtYnVz
LWkzYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvaTNjL21hc3Rlci5jICAgICAg
ICAgICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFu
Z2VkLCA0MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVz
dGluZy9zeXNmcy1idXMtaTNjIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMt
aTNjCmluZGV4IGMxZTA0ODk1N2EwMS4uMDQwODI0YWM3NDAxIDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1pM2MKKysrIGIvRG9jdW1lbnRhdGlvbi9BQkkv
dGVzdGluZy9zeXNmcy1idXMtaTNjCkBAIC0xNzIsMyArMTcyLDIyIEBAIERlc2NyaXB0aW9uOgog
CQl0aGUgYXV0b21hdGljIHJldHJpZXMuIEV4aXN0IG9ubHkgd2hlbiBJM0MgY29uc3Ryb2xsZXIg
c3VwcG9ydHMKIAkJdGhpcyByZXRyeSBvbiBuYWNrIGZlYXR1cmUuCiAKK1doYXQ6CQkvc3lzL2J1
cy9pM2MvZGV2aWNlcy9pM2MtPGJ1cy1pZD4vZW50ZGFhCitLZXJuZWxWZXJzaW9uOiAgNi4yMAor
Q29udGFjdDoJbGludXgtaTNjQHZnZXIua2VybmVsLm9yZworRGVzY3JpcHRpb246CisJCVdyaXRl
LW9ubHkgYXR0cmlidXRlIHRoYXQgdHJpZ2dlcnMgYSBEeW5hbWljIEFkZHJlc3MgQXNzaWdubWVu
dAorCQkoREFBKSBwcm9jZWR1cmUgd2hpY2ggZGlzY292ZXJzIG5ldyBJM0MgZGV2aWNlcyBvbiB0
aGUgYnVzLgorCQlXcml0aW5nIGFueSBub24temVybyB2YWx1ZSB0byB0aGlzIGF0dHJpYnV0ZQor
CQljYXVzZXMgdGhlIG1hc3RlciBjb250cm9sbGVyIHRvIGJyb2FkY2FzdCBhbiBFTlREQUEKKwkJ
KEVudGVyIER5bmFtaWMgQWRkcmVzcyBBc3NpZ25tZW50KSBDb21tb24gQ29tbWFuZCBDb2RlKEND
Qykgb24KKwkJdGhlIGJ1cy4KKworCQlUaGlzIGlzIHVzZWZ1bCBmb3IgZGlzY292ZXJpbmcgSTND
IGRldmljZXMgdGhhdCB3ZXJlIG5vdCBwcmVzZW50CisJCWR1cmluZyBpbml0aWFsIGJ1cyBpbml0
aWFsaXphdGlvbiBhbmQgYXJlIHVuYWJsZSB0byBpc3N1ZQorCQlIb3QtSm9pbi4gT25seSBkZXZp
Y2VzIHdpdGhvdXQgYSBjdXJyZW50bHkgYXNzaWduZWQgZHluYW1pYyBhZGRyZXNzCisJCXdpbGwg
cmVzcG9uZCB0byB0aGUgRU5UREFBIGJyb2FkY2FzdCBhbmQgYmUgYXNzaWduZWQgYWRkcmVzc2Vz
LgorCisJCU5vdGUgdGhhdCB0aGlzIG1lY2hhbmlzbSBpcyBkaXN0aW5jdCBmcm9tIEhvdC1Kb2lu
LCBzaW5jZSB0aGlzIGlzCisJCWNvbnRyb2xsZXItaW5pdGlhdGVkIGRpc2NvdmVyeSwgd2hpbGUg
SG90LUpvaW4gaXMgZGV2aWNlLWluaXRpYXRlZAorCQltZXRob2QgdG8gcHJvdm9rZSBjb250cm9s
bGVyIGRpc2NvdmVyeSBwcm9jZWR1cmUuCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIu
YyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCmluZGV4IDgwZGRhMGU4NTU1OC4uYTFkODE2NjM0YTI1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYworKysgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIuYwpAQCAtNzU4LDYgKzc1OCwyOSBAQCBzdGF0aWMgc3NpemVfdCBkZXZfbmFja19yZXRyeV9j
b3VudF9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAKIHN0YXRpYyBERVZJQ0VfQVRUUl9SVyhk
ZXZfbmFja19yZXRyeV9jb3VudCk7CiAKK3N0YXRpYyBzc2l6ZV90IGVudGRhYV9zdG9yZShzdHJ1
Y3QgZGV2aWNlICpkZXYsCisJCQkgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCisJ
CQkgICAgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgY291bnQpCit7CisJc3RydWN0IGkzY19tYXN0
ZXJfY29udHJvbGxlciAqbWFzdGVyID0gZGV2X3RvX2kzY21hc3RlcihkZXYpOworCXVuc2lnbmVk
IGxvbmcgdmFsOworCWludCByZXQ7CisKKwlyZXQgPSBrc3RydG91bChidWYsIDAsICZ2YWwpOwor
CWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlpZiAodmFsKSB7CisJCXJldCA9IGkzY19tYXN0
ZXJfZG9fZGFhKG1hc3Rlcik7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCX0KKworCXJl
dHVybiBjb3VudDsKK30KKworc3RhdGljIERFVklDRV9BVFRSX1dPKGVudGRhYSk7CisKIHN0YXRp
YyBzdHJ1Y3QgYXR0cmlidXRlICppM2NfbWFzdGVyZGV2X2F0dHJzW10gPSB7CiAJJmRldl9hdHRy
X21vZGUuYXR0ciwKIAkmZGV2X2F0dHJfY3VycmVudF9tYXN0ZXIuYXR0ciwKQEAgLTc2OSw2ICs3
OTIsNyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqaTNjX21hc3RlcmRldl9hdHRyc1tdID0g
ewogCSZkZXZfYXR0cl9keW5hbWljX2FkZHJlc3MuYXR0ciwKIAkmZGV2X2F0dHJfaGRyY2FwLmF0
dHIsCiAJJmRldl9hdHRyX2hvdGpvaW4uYXR0ciwKKwkmZGV2X2F0dHJfZW50ZGFhLmF0dHIsCiAJ
TlVMTCwKIH07CiBBVFRSSUJVVEVfR1JPVVBTKGkzY19tYXN0ZXJkZXYpOwoKLS0tCmJhc2UtY29t
bWl0OiBlM2IzMmRjYjlmMjNlM2MzOTI3ZWYzZWVjNmE1ODQyYTk4OGZiNTc0CmNoYW5nZS1pZDog
MjAyNjAxMTYtaTNjX3Jlc2Nhbi00OTIxZDBiNDFhMDAKCkJlc3QgcmVnYXJkcywKLS0gIApEYXZp
ZCBOeXN0csO2bSA8ZGF2aWQubnlzdHJvbUBlc3QudGVjaD4KCgotLSAKbGludXgtaTNjIG1haWxp
bmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
