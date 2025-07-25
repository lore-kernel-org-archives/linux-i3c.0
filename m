Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5679C87FCA
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Jul 2025 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+z13SjwqVDU2VULOGQTYZsLXJ6AVrG57z0faKf6CNUI=; b=ob4j+QXu6CU2Ua
	iwQ7pSrka+EP3tD8SmVJiyIvwEyESrv65VM31Nw2m2SA44busWsU93yNAQ6raESbD/fVQ9c3ISdiF
	ygp+X7At74ZcKBZqhGeIfGCxU3Nc4Aj/y0neHz4Ip/O3OB4kDKbR+Wy/OCG1z2O5GfaEKAOrETM+v
	v8swQxrN9KZAN4p3/90IoBY+9irM3cx8ko9FkHoCT+Uq8eNUlBIGwdaJggu7vRzZlfWSoR0L666HD
	oHDREM30yUgLEGh5QF3m9jRJqhgmf2no2GFZf8NVHau1KzI+0Pgn4N82tK5elxuHqoynj09vXUNNG
	f3NOAm704P3SNSL3+SJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufK7Y-0000000A5B4-24hH;
	Fri, 25 Jul 2025 15:14:04 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufK7V-0000000A5Ae-2CE2
	for linux-i3c@lists.infradead.org;
	Fri, 25 Jul 2025 15:14:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvzMH4GB7s7DbZ6Z8s9psWZeyiia63BoFVdkVoxA9l223Jm72hBhYNh64KgrZFW9fTfJCWghYY+OnfmpeWlBdek3sSwhSZM4HOBlLJF1Ys/r3dTpJwcDMl2cpRy1qLIvW9sISOGs7QiuZ1XxoTOhlmheWqKOqk8i952sVnELDzA2Pxjgh9qRXTtiMRP9teVg+AHdA0zAvBW4KQYtCOSlLGdEp1BibF+q88o/OJ/Vhl07HX1Ylwj1/2f7GeBZzhliyx3gK/5RU6Iwlhh0kQLEwck7xjqIHTJkKEbzuIRS8urRFf1/S7gBH6Luibz5+kEW1VR+FqZjbSGnZeG0YpoKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWFW/dUi/lPdhdvhg7f7VdeBjW0+dWrdpMJOc5pEecg=;
 b=wsFPzbHPeBoXV/qZJsICsgniUCF/1o6qFec4iPlDA7F2H+FISruL/dYCmaOYckBHsldmrh9flximPFVxu46Qyp4UHp9kXWKK74sjzWNynp9kmpGYSWrrRH7XmSAqbD4MX3pfb6Z+ZLKmxrBcXY/friuao4+TfXWLbeZ9Ijyd6hnPoCZw+yPVynyuPztUucghLaAHlMIincE/r+Zt6kpq2g1BKDILs4s07tv2vB7hnC8ta3urbnjqOCxgzH4i7wEtS05JMkIwDS+y3H15ZiasaXfmkWtHssRVm+87Cvz4DIvh1JVL0lfnh7gEZjgKdwbFyGXnk5bltDkPGBE9+u18GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWFW/dUi/lPdhdvhg7f7VdeBjW0+dWrdpMJOc5pEecg=;
 b=R4966eZtBu+k6F9DZc+Z7Mijzo9Tw6HfaLaQ3JSw/zWA0TOF4l28G8iMjzk2BjfMjclHHcmmERoA6bWHcgSKBmcBG5gvRYhGPcHKiyk3DV4bC8QwZ3A//H5WjRhi3WYIWDxS46m+XCsYb0qrgL2Mgl3kWRYxv9T9hvEmFwQ9YZGE5R/xVOj+S0rtL8JJNS/KeQv6jkJJE4ASbmJ+XtmWCIdidPDutOWpxs56Rm3k+Etq9xkItCgvpM9HMV7Eqztsmjz4dhJ7F4VK24HvI80rlIcc609/icrJVdr6N05PlvcPF5XmfzL0Ewa4LylbO36GTs9++aZ+Q0LyDyJ8jhCwsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7918.eurprd04.prod.outlook.com (2603:10a6:102:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 15:13:54 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 15:13:54 +0000
Date: Fri, 25 Jul 2025 11:13:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1] i3c: master: svc: Fix npcm845 FIFO_EMPTY quirk
Message-ID: <aIOfLYIVE8NkYTxH@lizhi-Precision-Tower-5810>
References: <20250725070310.1655585-1-yschu@nuvoton.com>
 <aIOKeClm/vOPp4IU@lizhi-Precision-Tower-5810>
 <CAPwEoQNfdit9fOiUY-WzQvS377nEqBu=s8S1zqS7tdSZfQeCHQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAPwEoQNfdit9fOiUY-WzQvS377nEqBu=s8S1zqS7tdSZfQeCHQ@mail.gmail.com>
X-ClientProxiedBy: AS4P189CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e825240-5a6b-4531-c498-08ddcb8dde79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3AxdlRML1dXSGk5RU9NQnZWbEVqYzlhYkF1dzcvZm5OVGVpT0xxT2VscXc0?=
 =?utf-8?B?SWl2bkJvNkZuK0x4NklocmxSdHhSeU5hbkoyRjBaVCtLOVRiNldlUkVHNEll?=
 =?utf-8?B?RWNVbElhaXFyaVN2TGM4cTJ0emRURUg2eUNNK3B6OG9ETUJWRktYTG1nOVh2?=
 =?utf-8?B?bjBnY2NCSTlqTjBpOVVFOFFiVkRaclhydVU5L3I3TTNNa3FZdzZseGJHRDli?=
 =?utf-8?B?NjNhK2VQSHgxZ0FBa2lpa1lzbmZIQ1RTTEQ2UjQremZqZlptdUdRSE9WdTNE?=
 =?utf-8?B?VnNwa3RpekFZTmp5OEhwc2VkSTJpRk9XQ3lMRGhjUE5ydWhWQkxPL0F0eFF3?=
 =?utf-8?B?THExZG9RNVB0Wkd4VGQ0eDFMaUtGMzRybjZRZjErWC9wL3pma1diL09DTkM3?=
 =?utf-8?B?b1RIdEpmbjIyNGxiZGpIODNNb3JVN2NQRDVkMVI1VWJUc3VyVjJNc0JpZDlH?=
 =?utf-8?B?dnJ0TWREZEJmKzlPWnhqWHdNWXo1bmwyZUFzTjJrSStDTFVuWTR2QTNvSGpL?=
 =?utf-8?B?MC9SL2txenJyZU5aZm94MzlISHZUNDZQRS9NblZ0d1hSenlRMUt1alpLRFdl?=
 =?utf-8?B?cUFEMkYrVkZ3bGk5WHFpZjVlZE5ucGZNYXV6d3NQcFp0QWEyb1RncGFPMWxY?=
 =?utf-8?B?dk1OM1RhejRsVGlsSFo4S21oZjF6K0hpT2xuQ2lOb1lybDRvYVNtbWFKdElE?=
 =?utf-8?B?OUE2T0xaM3NNMXE1QWc3VWVMR2NZblF0WkN0TURCYVFwbkpyM1hyYlhRQjBj?=
 =?utf-8?B?M0g3MVNTSDNPTXBZNDFCdkpDZUorT2xlMWlQR0hxckJZeEd5RWNoa1ZxRVZX?=
 =?utf-8?B?UHUxYUVPS2NwSWhaTkNTVlJaRTVOczRKUFZ2MzkyTmlMVHdLYUliRmQvS01G?=
 =?utf-8?B?a2ErU3JtWmNhRzdnM0ZsNjZ2NG9wYTlscnFCY3VuM2NwQ3VQRWhueHFwQmkr?=
 =?utf-8?B?ZmtKTnduUVBhUHpPS2paQVpwUWdia3BuMDcvNlZPcVFaRDlsZFcvUGZtS1gw?=
 =?utf-8?B?dnZnbm8rQmZkdkc1OWVFcGNDeTMxbE1wN0ZHMk9FNUVlWmwyYnhMeURuRGhR?=
 =?utf-8?B?T1RYazVIY1NjRTJYcmw4ejRmNVhXdE14UkFJck5WNGE4TjhvTlBmSlJYL3BI?=
 =?utf-8?B?V1JEaDA0amZoYXdhMVltUGJ2UkZldEc5OTdSTnVPdk54cE5WUDNXd3hQaVg5?=
 =?utf-8?B?eTNhWEI2WENmcjlsMnF2YmNJNXRCdU1FRlZCdXBmMVg0dml4TklER3VkVTZu?=
 =?utf-8?B?anpoakNVMEJZd25wSDIyTUR3V3NYOTNmWkVGSlZPa0cwM1BnWlhvZFlLc1Rx?=
 =?utf-8?B?VWkxd05CTDlCcUZiOE1OaGdoM3JiRnk1Z2hWaUxQRW5IWWVSblJYcWU0dUtv?=
 =?utf-8?B?T2hmWGRKbFBoT0pGQThFMVNjekx6ZzBqZFh0VFBGQjFGM0dPVjZiQmtoM1Np?=
 =?utf-8?B?UEduREMvcDE1UmRvdVRvUDdGTzcxS0xjTC9HU0ljajIyNkQ2cTlGVk9QMzhT?=
 =?utf-8?B?anhLRy9DcldkeFM2Z2dlTkNBb1poMUEyOXN5NjFqWGpVU2RWak5OcHgvMWty?=
 =?utf-8?B?ZzNHN3hOeENNVHhLSmt2dVh3dkxNMkFqSHdtZ0ZwWUlwb2Y5NEJENjFPTHB3?=
 =?utf-8?B?MWNuTFJXaWRUMWJkdytjSUlDcjBrVnd6ZFc0Z2RndHp6ZTBjdnB2bHVydW0r?=
 =?utf-8?B?dHpydTloaUVlSjZYZENUdm5rYmpVbVBDUEd1elI2aUpqL3h3YzhmaXZwUTZK?=
 =?utf-8?B?Y2o4aHlEK2Z6VkswdWVNcHJ2dU13Q016OVJXVVEyYlpPYU0xbmpLU3BIcTJQ?=
 =?utf-8?B?cEVRUEpnRTRoRzN6SDhZemt2aWdhMm5wSWwzSlRGM3FOcU9iZmlxWjhEQWcv?=
 =?utf-8?B?dXB5ZEp0Rzg5aFBrRldSRUFySDVjZFcwbmZSMlJ1TDZHZ3NiU1d4empZRmY2?=
 =?utf-8?B?RlNsREVDcUdHTENld2M0TDQxVHcva0FJRVNnZmRaN1c5NUVPSlZSVlR0MEY1?=
 =?utf-8?Q?08FyNAzb7KTf8UGx2Bi+o+X8DVz7sQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0RRQVRvOTZlbUhLc0RRSHhQY08wTksrMUFJVTUxdTlWV2VrSWk0N2tWdlcz?=
 =?utf-8?B?VHIzNGxKK1JRR0dCcEtQUEFqaHJiWHc5YlFLRWNMVGVLRjRwWkVNSEUrN1dE?=
 =?utf-8?B?SExHNEo2SThteS96L05rdkZqSm10WGk0YmcrTE9jeWZBUDFLZ0kwQktmNnBv?=
 =?utf-8?B?eUtvdlFubWRWeWFBazVIWldZSCthaSswbGNuZWdXYjc0RXUvYUNhbjhZOUpR?=
 =?utf-8?B?UEFXVjR2QXlWVnRoWjg3QURlRW5FYVI2ZTNiL0Q5dXRNSm01STE1OHlTd2Zt?=
 =?utf-8?B?UnRmVHpHQmFjYk5mOVhxTnczem5kajBHZGFEZ2luZUlxQzdxRE1YNnN1ZStY?=
 =?utf-8?B?SnVGcHo3RW14WExRbzlzN0ZxMnB5blBLbGFWalFWWDV5K3o1SEdKb0hCcXIx?=
 =?utf-8?B?QjRIY0lRcE5Ya21QaFAzc0pucnY3SzNqTDYvWXpEVEpteG85Vm9QSERhYkc0?=
 =?utf-8?B?MEp2b054R1RFR1NuMTZjaGd2R0pLdXltZS9RYkJIT1JHZmRybG5oaVNpM1U5?=
 =?utf-8?B?RGtzOWFDWUVZSmJMa2U0anJTT25FVG9FS0VKQmxmbmtvUFI4QlNiMmNoWVVz?=
 =?utf-8?B?amNOY0lOM0JybldQVXhUckZWZTlMRStNNHVTeUFPem9QbG1NT0hpNnMyc3JO?=
 =?utf-8?B?MVdKZFdrc2tOUkFaemVsV2R4WUNkMWUvbFpkYzZTc0JCMVpQY1Foc0NQN3BK?=
 =?utf-8?B?cXE5b0tQdTVNcncvd0RsbWpPVzRVK25nbWdNMmp6SEIzblR4ZHcxdm9Cc1Vi?=
 =?utf-8?B?WklpTVhpUnZMa0gzKzFxanFSaU5QVnhjWXFRU1FJOGJDL1VWSHlrcWgwRkZx?=
 =?utf-8?B?UXV0SWs3WmRPdVdKSUV0MFRLNXFTQUpGM3R2TjNFdnl0S3d3ZjdVeXVVVVZ6?=
 =?utf-8?B?Z3dBUmJGR0l2ZGhBSFIvcFI5RjhZRTV1UlNCZkxSMTcvcXBwREtyTFBKMzd4?=
 =?utf-8?B?Y2UreVlCRDhkYkd1VzIwUnJ5Vy9GWDh3cnNjRmpUYVB5MTlna1lZRUtWSG1z?=
 =?utf-8?B?N2tkSnlha0xySDNNZ2ExekgxQWJHemx1bFQ3SmNHdC9Ma0NKWmRLZ1ZEdnRt?=
 =?utf-8?B?K0hiUmx6YXFHVkF1Y0h4SlREampRalJjY3A0Qk14c0o1OVBLZnBLU0xzZEkw?=
 =?utf-8?B?NWRFRXVZcGkrRkdoOVp2Qm9GVDlUU3c3UVZGVHdxYVVMQkVYQy9abFdNWFU3?=
 =?utf-8?B?ZG9jQkh6THpvMUJlM2FHNDNuS0JwQkx1REFYOVdhS3IrWnhKY1cxWEVla2Vk?=
 =?utf-8?B?ZGpaV0VUTVFocXdrTGs4NUFUQWVKeEhBRXo5c0ZRaDhIaTQyeVpzN3JMU0ly?=
 =?utf-8?B?Q3EzbWdWdnlIZDM2MU84U3pCcHVncGNDSCtFd3o4SlQzWDJ1d292WVJvalpZ?=
 =?utf-8?B?ZHlMcVFRNlN3a045VjZSVVc0eDJvSUVVUkdaSUlNSTd3QjQrVlpSWFNMb1Mz?=
 =?utf-8?B?NkU3bUFFT3dvR3NYWU53TzR0R29lZmt2SHFFdCs1Q29vaEdkZ2tNamtwOGFM?=
 =?utf-8?B?QnJvV3JZOHR5bXB1U28wbHlCRGgzMDFURUpqRHlUME11aEIxUlBOZWxzVFli?=
 =?utf-8?B?QWpYdFZGRUlYZUVMaFFydWJvak92cGc2R2FqTHlYQUM5T3dyYk1HM2trVHhk?=
 =?utf-8?B?bG5ibk9wY3k3K2RVTko4U1hJWFEvMjhIQkRVOGI5bEJpOVFKMHVwc3pndmVH?=
 =?utf-8?B?SUhWV0Y2U2Z6VkJTeHovNDhFTmk0M29xNDdFR2V1WWNITDRiOHVBZWE0dVBr?=
 =?utf-8?B?cUp5ZkNBNUJ3QUdiTjNzTkRrd2RlOUZ6dFpsVkc0K0VWOU1lVjAxc2t5MzZZ?=
 =?utf-8?B?ays5dHlZNi80d204U2xBcVlidnhaN1JlSFRLVG9WVjNrYThNbUhSRXdiWElr?=
 =?utf-8?B?S1Y0UnRqQ1ZlbzEzVHprU2dFRUxrWmI0eW1BYU1LaEY2bVNsWi9SdFJwdmsz?=
 =?utf-8?B?MjNrVUNPNncrQ1BiN3EzQW54Zm9VMEt1U0toNXJQVFl6Smx5ekplVkZtS1hi?=
 =?utf-8?B?OEZmTzFaZ2t5RzJPdllSQy9KVFNCMTc4eW1CbWpjaUpXV3Z5UzB4Mnkxb3hX?=
 =?utf-8?B?NElhMy8yT0xKRDd3OGpaS0ZPdkJyTzZOUDFjNW9MODN6MUhZQURUNWZyNWtn?=
 =?utf-8?Q?Nb0K8ed6fXh4Y9PE5Z0QvQd+q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e825240-5a6b-4531-c498-08ddcb8dde79
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 15:13:54.1573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kC47mJFJyh6ID9RQFCvnQxryIP93+SWRkDVfgikgMPrk5UxRGYFGxXemxhy7Pu9HsBQCPFp4eFUhW/sTEc0WQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7918
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_081401_576308_E77CBBD8 
X-CRM114-Status: GOOD (  31.15  )
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

T24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgMTA6NTA6MzRQTSArMDgwMCwgU3RhbmxleSBDaHUgd3Jv
dGU6Cj4gSGkgRnJhbmssCj4KPiBPbiBGcmksIEp1bCAyNSwgMjAyNSBhdCA5OjQ14oCvUE0gRnJh
bmsgTGkgPEZyYW5rLmxpQG54cC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgSnVsIDI1LCAy
MDI1IGF0IDAzOjAzOjEwUE0gKzA4MDAsIFN0YW5sZXkgQ2h1IHdyb3RlOgo+ID4gPiBGcm9tOiBT
dGFubGV5IENodSA8eXNjaHVAbnV2b3Rvbi5jb20+Cj4gPiA+Cj4gPiA+IFByZWZpbGxpbmcgaW4g
cHJpdmF0ZSB3cml0ZSB0cmFuc2ZlcnMgaXMgb25seSBuZWNlc3Nhcnkgd2hlbiB0aGUgRklGTwo+
ID4gPiBpcyBlbXB0eS4gT3RoZXJ3aXNlLCBpZiB0aGUgdHJhbnNmZXIgaXMgTkFDS2VkIGR1ZSB0
byBJQklXT04gYW5kIHJldHJpZXMKPiA+ID4gY29udGludWUsIGRhdGEgbWF5IGJlIHByZWZpbGxl
ZCBhZ2FpbiBidXQgY291bGQgYmUgbG9zdCBiZWNhdXNlIHRoZSBGSUZPCj4gPiA+IGlzIG5vdCBl
bXB0eS4KPiA+Cj4gPiB3aHkgIm1heWJlIHByZWZpbGxlZCIsIHBsZWFzZSB1c2UgY2VydGFpbiB3
b3Jkcy4KPiBUaGUgb3JpZ2luYWwgY29kZSBkaWRuJ3QgY29uc2lkZXIgdGhlIHJldHJ5IGNhc2Us
IGRhdGEgbG9zdCBoYXBwZW4gaW4KPiB0aGUgcmV0cnkgY2FzZSBvbmx5IHdoZW4gdG90YWwgd3Jp
dGUgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gRklGTyBzaXplLAo+IG5vdCBhbHdheXMgaGFwcGVuLgo+
IEluIHRoZSBleGFtcGxlIG9mIHdyaXRpbmcgMTcgYnl0ZXMgKEZJRk8gc2l6ZSBpcyAxNiksIHRo
ZSBsYXN0IGJ5dGUgaXMgbG9zdC4KPiAxLiBFbWl0IFMrQWRkci9XCj4gMi4gV3JpdGUgMTYgYnl0
ZXMgdG8gRklGTyAoRklGTyBpcyBmdWxsKQo+IDMuIE5BQ0tlZCBkdWUgdG8gSUJJV09OCj4gNC4g
KHJldHJ5KSBFbWl0IFNyK0FkZHIvVwo+IDUuIFdyaXRlIGxhc3QgYnl0ZSB0byBGSUZPIChkYXRh
IGxvc3QpCgpZb3UgbmVlZCBkZXNjcmlwdCBjbGVhcmx5IGF0IGNvbW1pdCBtZXNzYWdlIGFib3V0
IHRoaXMuCgo+Cj4gSSBqdXN0IG5lZWQgdG8gcHJlZmlsbCBGSUZPIGluIHRoZSBiZWdpbm5pbmcg
dG8gbWFrZSBzdXJlIEZJRk8gaXMgbm90Cj4gZW1wdHkgd2hlbiBIVyBzdGFydHMgdHJhbnNtaXR0
aW5nLgo+IFNvLCB0aGlzIHBhdGNoIGFkZHMgYSBjb25kaXRpb24gdGhhdCBwcmVmaWxsIEZJRk8g
b25seSB3aGVuIEZJRk8gaXMgZW1wdHkuCj4KPiA+Cj4gPiA+Cj4gPiA+IEZpeGVzOiA0MDA4YTc0
ZTBmOWIgKCJpM2M6IG1hc3Rlcjogc3ZjOiBGaXggbnBjbTg0NSBGSUZPIGVtcHR5IGlzc3VlIikK
PiA+ID4gU2lnbmVkLW9mZi1ieTogU3RhbmxleSBDaHUgPHlzY2h1QG51dm90b24uY29tPgo+ID4g
PiAtLS0KPiA+ID4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgMTEgKysr
KysrKysrKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkz
Yy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gPiA+IGlu
ZGV4IDdlMWE3Y2I5NGI0My4uMzRiNmUxMjViMThhIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJz
L2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gPiBAQCAtMTA0LDYgKzEwNCw3IEBACj4gPiA+ICAjZGVm
aW5lICAgU1ZDX0kzQ19NREFUQUNUUkxfVFhUUklHX0ZJRk9fTk9UX0ZVTEwgR0VOTUFTSyg1LCA0
KQo+ID4gPiAgI2RlZmluZSAgIFNWQ19JM0NfTURBVEFDVFJMX1JYVFJJR19GSUZPX05PVF9FTVBU
WSAwCj4gPiA+ICAjZGVmaW5lICAgU1ZDX0kzQ19NREFUQUNUUkxfUlhDT1VOVCh4KSBGSUVMRF9H
RVQoR0VOTUFTSygyOCwgMjQpLCAoeCkpCj4gPiA+ICsjZGVmaW5lICAgU1ZDX0kzQ19NREFUQUNU
UkxfVFhDT1VOVCh4KSBGSUVMRF9HRVQoR0VOTUFTSygyMCwgMTYpLCAoeCkpCj4gPiA+ICAjZGVm
aW5lICAgU1ZDX0kzQ19NREFUQUNUUkxfVFhGVUxMIEJJVCgzMCkKPiA+ID4gICNkZWZpbmUgICBT
VkNfSTNDX01EQVRBQ1RSTF9SWEVNUFRZIEJJVCgzMSkKPiA+ID4KPiA+ID4gQEAgLTI4MCw2ICsy
ODEsMTMgQEAgc3RhdGljIGlubGluZSBib29sIGlzX2V2ZW50c19lbmFibGVkKHN0cnVjdCBzdmNf
aTNjX21hc3RlciAqbWFzdGVyLCB1MzIgbWFzaykKPiA+ID4gICAgICAgcmV0dXJuICEhKG1hc3Rl
ci0+ZW5hYmxlZF9ldmVudHMgJiBtYXNrKTsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBzdmNfaTNjX21hc3Rlcl90eF9lbXB0eShzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIg
Km1hc3RlcikKPiA+ID4gK3sKPiA+ID4gKyAgICAgdTMyIHJlZyA9IHJlYWRsKG1hc3Rlci0+cmVn
cyArIFNWQ19JM0NfTURBVEFDVFJMKTsKPiA+ID4gKwo+ID4gPiArICAgICByZXR1cm4gKFNWQ19J
M0NfTURBVEFDVFJMX1RYQ09VTlQocmVnKSA9PSAwKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiAg
c3RhdGljIGJvb2wgc3ZjX2kzY19tYXN0ZXJfZXJyb3Ioc3RydWN0IHN2Y19pM2NfbWFzdGVyICpt
YXN0ZXIpCj4gPiA+ICB7Cj4gPiA+ICAgICAgIHUzMiBtc3RhdHVzLCBtZXJyd2FybjsKPiA+ID4g
QEAgLTEzMDMsNyArMTMxMSw4IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfeGZlcihzdHJ1
Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwKPiA+ID4gICAgICAgICAgICAgICAgKiBUaGUgb25s
eSB3YXkgdG8gd29yayBhcm91bmQgdGhpcyBoYXJkd2FyZSBpc3N1ZSBpcyB0byBsZXQgdGhlCj4g
PiA+ICAgICAgICAgICAgICAgICogRklGTyBzdGFydCBmaWxsaW5nIGFzIHNvb24gYXMgcG9zc2li
bGUgYWZ0ZXIgRW1pdFN0YXJ0QWRkci4KPiA+ID4gICAgICAgICAgICAgICAgKi8KPiA+ID4gLSAg
ICAgICAgICAgICBpZiAoc3ZjX2hhc19xdWlyayhtYXN0ZXIsIFNWQ19JM0NfUVVJUktfRklGT19F
TVBUWSkgJiYgIXJudyAmJiB4ZmVyX2xlbikgewo+ID4gPiArICAgICAgICAgICAgIGlmIChzdmNf
aGFzX3F1aXJrKG1hc3RlciwgU1ZDX0kzQ19RVUlSS19GSUZPX0VNUFRZKSAmJiAhcm53ICYmIHhm
ZXJfbGVuICYmCj4gPiA+ICsgICAgICAgICAgICAgICAgIHN2Y19pM2NfbWFzdGVyX3R4X2VtcHR5
KG1hc3RlcikpIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHUzMiBlbmQgPSB4ZmVyX2xl
biA+IFNWQ19JM0NfRklGT19TSVpFID8gMCA6IFNWQ19JM0NfTVdEQVRBQl9FTkQ7Cj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICB1MzIgbGVuID0gbWluX3QodTMyLCB4ZmVyX2xlbiwgU1ZDX0kz
Q19GSUZPX1NJWkUpOwo+ID4KPiA+IGlmIHByZWZpbGwgdG8gRklGTyBTSVpFIGVhY2ggdGltZSwg
c3VjaCBhcwo+ID4KPiA+IHJlcGxhY2UgU1ZDX0kzQ19GSUZPX1NJWkUgd2l0aAo+ID4KPiA+IFNW
Q19JM0NfRklGT19TSVpFIC0gU1ZDX0kzQ19NREFUQUNUUkxfVFhDT1VOVChyZWFkbChtYXN0ZXIt
PnJlZ3MgKyBTVkNfSTNDX01EQVRBQ1RSTCkpLgo+ID4KPiBUaGUgZnJlZSBzcGFjZSBpcyBTVkNf
STNDX0ZJRk9fU0laRSB3aGVuIEZJRk8gaXMgZW1wdHksIG5vIG5lZWQgdG8KPiBjaGVjayBUWCBj
b3VudCBhZ2Fpbi4KCk15IG1lYW5zIGlzIHRoYXQgaWYgdXNlIGFib3ZlIGxvZ2ljLCBuZWVkbid0
IGNoZWNrIGhlbHBlciBmdW5jdGlvbgpzdmNfaTNjX21hc3Rlcl90eF9lbXB0eShtYXN0ZXIpLgoK
RG9lcyB0aGlzIG1ldGhvZCB3b3JrPwoKRnJhbmsKCj4KPiAtLQo+IFN0YW5sZXkKPgo+ID4gRnJh
bmsKPiA+ID4KPiA+ID4gLS0KPiA+ID4gMi4zNC4xCj4gPiA+Cj4KPiAtLQo+IGxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKPiBsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCgotLSAKbGludXgtaTNj
IG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
