Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466A3CD8CA8
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Nov 2025 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aG6kpLq0lWUWTNLMRaT52nLBtnotgX24KFRb1A60gPg=; b=U3CmKOWRiiqfwG
	jJzSi0xKTEvO1d1fOOtw1RZN6lQ9R4LWHGWqAjrLjyhamot0iOIBViuwpWYiDsa1+TS5OYmYY1uSr
	26konwegys1BjvNdMPhvMjCPEu4bR8QLCoP6YMMq6chfkytHzdXTrKebopvYo7dbxiENLfpX8YEw2
	/PAIwqaaaOcJQ7p7Igx/UHCw9bqzTx73axu6lwQViZV3qr+xmYo9PD4M0iERh8NXHKLQGbN6YmtS2
	oE4Aq7ETfCmvsuyi4sL+j31Ljd4jgncw/SGKDT6hfVia3E0dXTnLIxRAyq3Bb7gCRabAgRYQRHrFB
	CB4d4lYnO6SvSCn/QvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJaTJ-0000000Ap3J-0BZF;
	Thu, 13 Nov 2025 16:46:57 +0000
Received: from mail-westeuropeazon11010016.outbound.protection.outlook.com ([52.101.69.16] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJaTG-0000000Ap2R-2iDt
	for linux-i3c@lists.infradead.org;
	Thu, 13 Nov 2025 16:46:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Knd7NWb8D1y/5a7d8kV46QpQQxp0xJ7jDMUT4xXVqcjhhq/zq4Cy3oi7TkzjBBr6ySbq2sGVoXkTEJL5vhcY7jGd5/GsVog2l1oimnhKL0Beeckt0DKr3P2DaDwDMRzsgO/o1vgbne7BJKlCckqBuohHICrnSZJBBR+SvmjPc4lmRVlKdt+taFqPiDF8eo1+jo5/4rC0DW3+bbG4j0ZvLxx9rC0EgwxdxtmjQbggOZ4emk+bbbrT5nAzj5bji+g+GRjJVjixix4EuOAd4jUT8vmhv/Z/3VPgOF+sLXKbwUKe8ogRUZQ3kbFDXejW+ieHMk+n9CtFyPfr7QkcrAoMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3+gRF1uA2WlFx60lyG3dyn95PsTvQ4PW/yrPw+qLfM=;
 b=TZUQwebR8AvT20eM9nltUj5bZEGBLCsRvFKLD6W7KsHOJfsQ5476BIWVVZ/wIU4FiNN9yLFHXEwVk9oapWjAxFybNQ4mZ/oD1tepb6URn2sDlpvrArM9WGlfbJiO5N2l4Txlei4A1sYCkZ175BFbzKo+k8vTrZjcQ349mM/7/gEiGAyMnRkjGBgwhgSsM0ydEjc0cmNtBiRNG3Vn1L+ZTP8QPu5Gzm9Yo71y0b0NUhlKmsxEEHE9vuW1txtzlAnYMKaI+cqcnH/H8ZyzXE7dhgqixnvOJHWrpuEVtxpRbkQPBYdKxGERigZVO4RopYqEzS8y75lk8XC3eh5PcvLVrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3+gRF1uA2WlFx60lyG3dyn95PsTvQ4PW/yrPw+qLfM=;
 b=NXh+IRS2Ev3hSw/HjwciHQEr7cC2cIQzTA6jYE84d7yuB1fnhP6Pc8JiO4PG0/psWzqSFZmLbvwJPeJMLt9yCDv2Nw7o9dxKDTKX27tsSy3H19jJFUnIeQ2iP85RRsNUTU4w2i09JHn0DKAb65PJoEC4NBjTaEc7b/MTk7L9a8dMVgmCySWey16N7YazwDaIPDAn8pqo5Oqkzwp7KyCZFAW78XtsJsJ3ClHeaUkFgr6shWTZKzw+ffPxFjaMuuGKvXo0Sr96BIHBKmhE6pzQV+e381Odds2IpWx9RMK/rJFRG5fFcuZkaBzeDgVzLaCHpmwvI1Koyl/zuMK/+fJcYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA4PR04MB8046.eurprd04.prod.outlook.com (2603:10a6:102:ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:46:50 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 16:46:50 +0000
Date: Thu, 13 Nov 2025 11:46:43 -0500
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	gastmaier@gmail.com
Subject: Re: [PATCH] i3c: master: Remove i3c_device_free_ibi from
 i3c_device_remove
Message-ID: <aRYLc/+KAD13g7T7@lizhi-Precision-Tower-5810>
References: <20251112-ibi-unsafe-v1-1-d8454db22613@analog.com>
Content-Disposition: inline
In-Reply-To: <20251112-ibi-unsafe-v1-1-d8454db22613@analog.com>
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA4PR04MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a072802-bdc8-4add-3e30-08de22d43e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NURzVHFvMkg3bjl0Vm0wZDlNQkFCK0luc2laVVRXU1dPbGQwcTdkRlRKd1BX?=
 =?utf-8?B?alBEcnNGVmIySlhwZUxCVThYSEQxMmFOUVVIeEZWUzczREpncFdzN05HZzF1?=
 =?utf-8?B?OUppZ3F2TmZ1cHhQLzJGU0FzYUU1cSswZ0ZyWEtUc1I4dUZSUXV2TTlpSXhV?=
 =?utf-8?B?ME9XdEUvTVdKOXN3MlJpNFhUSlBWZnpIcDFldlBEaS9URVZqbFEwbnBTMlRt?=
 =?utf-8?B?Wm9hbVpOV2JTcmNiZE94eU83K2Y0Rm1aNWFtTkVGbllFcXdqYmhTN1llM3dj?=
 =?utf-8?B?K1dwUnJKVENTZkt5bk1pbktOZUNaYXoyZ2FJcllmV09wWURCQlFXSnJybmRl?=
 =?utf-8?B?R0xLc1duenlJc1hRaldpZ1Y5bGd5SWFYTndndmRuYzhDeHRsS21RcEsyUFNY?=
 =?utf-8?B?SS9WeFdVckpWZlowOFpTQ3VHQkFyOWpNbFp1a0NiSHJ6amF0bEY4MjdZWk55?=
 =?utf-8?B?Uzg0NkFSQ3pWTW0wV2xINHp6alZUbGN3Q1lFYU9leHpsTlpCTmFwaVhBYndm?=
 =?utf-8?B?VlcxR09JbWlsTkovMnh5NUJ5Y1ZjRjNBZWpqQXcwTk8vM2pNVU56SXBPQ3JN?=
 =?utf-8?B?eHJPa1dvRkZQOVRsNmtvQWF5S1Jxa2Y0czV5ZlExME1KWCsvTXE4MElvZXJO?=
 =?utf-8?B?Z1NITWhjRXNXbURsRXhPQjU1ajVwd09pLzhSMGhDUTVBbWVGMUNGOTNRYjNy?=
 =?utf-8?B?WXFETkQyRGlzZEdqOFl2TGxPWC95VUUySEhjYmVlaDF2TjY4YmszdzNud0pk?=
 =?utf-8?B?YllpMStTK2VuMk51WVRTMmhsMENkK2pZeDVNZy95NXB1bzdvMVNndnc1a1Ri?=
 =?utf-8?B?Zi9rR3NlSEdBdTBQV254VVlSR3UvL1J5bE5mRlVEcGxqeE9laGFVajBqZkZB?=
 =?utf-8?B?S3F3TVV4dWQrRDY5Ny9HUWZyZEI5b1Npby9PeXEvamw2MFppSHhjS21yU0JJ?=
 =?utf-8?B?VmpheXhIQXBua2V6S1Z4dVlLMzQvaEVHcEJwcURCaXcxZ2sxSGdkbmRmcmxF?=
 =?utf-8?B?WW9IWWZBOW1mYkFOcWRCNDdhRXlMVWpkbFdiU2NzeVJ5allqR0RYQXYvRFdB?=
 =?utf-8?B?d21YOGF1eGhGclBiZlZpZUgweVZWd0FhaXpCTktQd1oraDVKdXp2U1I0cE5m?=
 =?utf-8?B?eDlFdzM5Vlhsc3hnUHBDdnd6TUtLaUF5VFNEYmliQThtRlBLcmNVQmkySXEv?=
 =?utf-8?B?dWFsYTJzQUVLc3Zad3FRZFVkOHR3SlFmZHo3cTJMQXpkM3ZCZ3VQNGl2dnV4?=
 =?utf-8?B?bjlzSWdkNjRsYVRZSko4WEg2cVBsVWpEdDYvbGhKcjExVlFzbFRGYzAxV2x0?=
 =?utf-8?B?Q0JqYnkxamJsSkliOERMZ1lLS0RiNWlJUzdFSGdtR1FJelA0OFp6RG5mK1Na?=
 =?utf-8?B?cStIRnd3aGlESmtPZjM3NlFsU2JmaEZnRFRwb2hLMVBEVk9RRU10Q0dFdFF2?=
 =?utf-8?B?RklWUlF2WFRuOVp6NExlQ2JHSzBhcWQrckszcDJrNlZsWThUektsZCtpa1l2?=
 =?utf-8?B?d0p0cDJ3dHgvOE1IWEFHT3NTQVBpQUNoK3RlVXl0VHhqVS92OEsvZ0xvQ3BB?=
 =?utf-8?B?YXdGejhLZU80QU1qczdSMVF4TE8wbEdkZ3R4dFlhUjBXbWk3Rko2UVFYU2ND?=
 =?utf-8?B?VzNQZ21maXhBbjZsY3BITnVoYXVoUEZ2QUZSSXRhRFhJT1RqOVpzbHRPZ2tp?=
 =?utf-8?B?Yi9DTzh1ZFpZUFF2czdaZGljWHAyZ3lMTERBN1Nya1NJdXU5SUo3UlV4Wi9O?=
 =?utf-8?B?YjZXV25qVTFVeDVtVTVjV3RYUWx4WE56ditjMjJvUnZrWlJDMzJ4VjNUYnZj?=
 =?utf-8?B?b1JtV2xZbStXR3NsYWMvaG1uYzhwOTM5cGlrVzR3MDZtZHE4R0Fva21GNUFO?=
 =?utf-8?B?VVE2VUF5Y21sR3NZQXBjZFZPQnpIeDhKcktRV0J1Z2ZTdkNFdDJURnVtOWsx?=
 =?utf-8?B?VVFsSkI4T2tTOE5QQ1hubGJpenlWZm1yYTZjb25XMFMyYWg0UG45djBkWmkw?=
 =?utf-8?B?d2gzbHAwRVpmTmROWGNnTHBGcjRoSlRVNzZBdnU2a1BBZy9keDV1eGp6VHBZ?=
 =?utf-8?Q?S0yfHk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU9nRDAxS3MvYWVaemJOYm1YL0xKZEZXRkZTdm1CclczVjVJbGdiZzRzVGZX?=
 =?utf-8?B?U1lWcDd2N2VLWG1zd2k0cGdzUTRrbGkwRlNVUUZiYnhtdXZhMTBwOHBDNUhN?=
 =?utf-8?B?YjZOcW53VktHdlV4VUYvWlpqTEVsSXd3aTNNdnpoRWxjWSs5KzI1b2dFMWxZ?=
 =?utf-8?B?K1VRUXN2a0hTZE52bDAzR0FTVUg0RTEwMnh6cklEZ1dDOE1lUWZEK2lpc09s?=
 =?utf-8?B?QWp0QXQvYnQ2aXRud0Q5NG5keCtyL2J4L1BPRXpWZkpjL2ZYekJHUTlGWGd1?=
 =?utf-8?B?WHFPN2FyVm5IUVR4c3l6bGlSNjltMjZoclhRSHhjcmxzN2s1N216SmRvYXJu?=
 =?utf-8?B?L0NRaVlIUXVuR0pNVjAzR05KL3NUbzVrRk9mUE9BVVZJYVVIRU5XUEI1Ykd5?=
 =?utf-8?B?Ylp2NGJuQ1FUamo1aHorL0czWEJ1Z1VMK1FvTkhrVVlFK0NxL1dYMXFNc0FK?=
 =?utf-8?B?VE1Dcm1xeWtvMVAwb1RVRGMwbEZYbW1lODU3bG1UcnpXdytKNUZHOWJwL09P?=
 =?utf-8?B?SHRoa1BndDgxNUlnTjYwQW1jN2ZiYjF3ZjFTUDBPa1k1blNET2pDNTdTejdx?=
 =?utf-8?B?VjJCSVV5d1BxRFVVQTV0TGV1QzVnVm9WZnlKbFgvdEVVa3M4UVFheWx0cGJQ?=
 =?utf-8?B?WVc4YlB5bVRnT1N1amlqL1RUVEFscjFLT0hvZDV3Z1N6LytVdWI1Rmp3VWhO?=
 =?utf-8?B?Mmhhd0xJbUpLd3BMbzRSZG55eEh2YnVtVmRCWGZtblNrNGVXVkJXaXZhRUVT?=
 =?utf-8?B?VjE5VWYwUkFGMzZ3bm5yUGpMdVN0R1I5MUlTWlJYdFlrL2xFR2VmVkd5MWw5?=
 =?utf-8?B?WmxwRlZCdUdmRGpxRXA0MTVFNUpiemJPOUt1UW15S3ZscWpQWXdmeFdYNmk0?=
 =?utf-8?B?dnVaQUJUVVY2VTZPMDNsUHd5d0J2aWRYRzNLYjlNNzlCOGV2R2xsKzlzMTh5?=
 =?utf-8?B?QXloNWRxSkk0OUNEOFd3UkdKR0ZWYitKUkYzUndEeXVxUkNWZHRJMTZjU0Ix?=
 =?utf-8?B?QU9lZXJuQjZmUHR0TVlZWnB5VjEvU0pIbFhwZjVXTUFaWTR2SWs2eVBiekFk?=
 =?utf-8?B?TE1BNm5mN2FFdnZ4SkpldFpoSTRVSWZsSi9MSVNmMzF1SjVZMUFsNStDM2Fj?=
 =?utf-8?B?d2F4QmNZbHkzQVo0SXdOVWx1L0k2RWVxcmZ5QUJzL09LMGdkUWpRQ3YvWTVi?=
 =?utf-8?B?dTQrQjY5MGJ0TnlDWWJDSFQ1MGlTbmxNWG9kcks3YW9makJnWEIvT3BUb29W?=
 =?utf-8?B?K1ZHbjhGd3kyTXBVT1lYTUVicFVKOFZ0MkVLWndYeU1zWUpMQVQrU2JVZHFQ?=
 =?utf-8?B?b1VrdVRwdVNqWlgwQkkwdS9sYmxib2NSYzZZdDVqZDE2R1FReG5sWlIxS1BK?=
 =?utf-8?B?TkwyU3FlV2VJaTBjcVB6U041b0tQd1d3Q2tQOFVWN1lRVXdSK2FHVTNoUUFi?=
 =?utf-8?B?SElPaXdjeWQ0VlAyQTJyQksyZW80WFBRVFlySTJJOE41d0w4UlVwTElNS2NI?=
 =?utf-8?B?bjFIckZmZm54QkNRdnh0R2sxSFNuU2RDVVlCVDhQSWxwZ0RPdDRLZ01hdGhr?=
 =?utf-8?B?cWw1S003djVtd3NvZ1F4dXlUZ0NnTkF2S3NZL3J6cjZJR3Z2MWp2cHFUa2My?=
 =?utf-8?B?SFhvd3JEL0tSaDJVMEhzQkVMUlY5QTVsOUtDTXJxamlRZS9ERVB3L1pIUEtU?=
 =?utf-8?B?TEFXakNWUGw5SnhrcGJhRThZZXR6OTJsZkRDMFBXRGllOXhkamYxWkNpVW93?=
 =?utf-8?B?M0p0c0hZZURYSkp5YnJFSjVZMEgxd3liSnhmeTFGVGlqVk1HbFhyZlcvK0o1?=
 =?utf-8?B?dmJ1a1d6ZTNkWnE4TjllR0JoallGbmZGYlhoQnlET2hTN0VGM2E1YkRUak1a?=
 =?utf-8?B?MWY1ZndKUy8vdGJ1V3o2Q0tYMG9DenFiZyt2RFFYaUJOYlNNVlhLb21oaDJj?=
 =?utf-8?B?ejQ2YTV4YjlqcHZObzZDOVVPYWR6MS9nRjRzQnIxdktCKzJJeVJscWFGYXBM?=
 =?utf-8?B?UTYxY1dJU0k3OE4wZHg4MXhmMDR1VTN4S1p3L251STdVeEZsTUpXK1JNVXdX?=
 =?utf-8?B?elVEV1p1cGY5RXQwTDlVOURjY2RGcytvZ1FINEtNNHFqZmlNRW9hbWd5b0xy?=
 =?utf-8?Q?5iHbWoBf3Md1M7Sa2nbnQ0s12?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a072802-bdc8-4add-3e30-08de22d43e27
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:46:50.5915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8eX2CLILHcQ3i8awUo5WXDoYcZinpO3T9ULAt/i/8PxlzFnrOGiIpg7tCOYB6NoVetdDeI2UfCeIiksBKQ/Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_084654_712616_3C2A23AA 
X-CRM114-Status: GOOD (  27.92  )
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

T24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgMTA6MzA6MDBQTSArMDEwMCwgSm9yZ2UgTWFycXVlcyB3
cm90ZToKPiBpM2NfZGV2aWNlX2Rpc2FibGVfaWJpIHNob3VsZCBiZSBjYWxsZWQgYmVmb3JlIGkz
Y19kZXZpY2VfZnJlZV9pYmksCj4gaG93ZXZlciwgYSBkcml2ZXIgdXNpbmcgZGV2bSBhY3Rpb25z
IGNhbm5vdCB5aWVsZCB0aGUgY2FsbCBiZWZvcmUgdGhlCj4gYnVzX3R5cGUucmVtb3ZlKCksIHJl
cXVpcmluZyB0byB1c2UgYSAucmVtb3ZlIG1ldGhvZCB0aGF0IGlzIHVzdWFsbHkKPiBkaXNjb3Vy
YWdlZCBmb3IgZHJpdmVycyB0aGF0IHVzZXMgcmVzb3VyY2VzIGFscmVhZHkgbWFuYWdlLiBTaW5j
ZSB0aGUKPiBvbmx5IGNvbnN1bWVyIG1jdHAtaTNjLmMgb2YgdGhpcyBtZXRob2QgY2FsbHMgYm90
aAo+IGkzY19kZXZpY2VfZGlzYWJsZV9pYmkgdGhlbiBpM2NfZGV2aWNlX2ZyZWVfaWJpLCByZW1v
dmUgdGhlIGNhbGwgZnJvbQo+IHRoZSBpM2NfZGV2aWNlX3JlbW92ZSAoYnVzX3R5cGUucmVtb3Zl
KCkpLgoKaTNjOiBtYXN0ZXI6IFJlbW92ZSBpM2NfZGV2aWNlX2ZyZWVfaWJpKCkgY2FsbCBmcm9t
IGkzY19kZXZpY2VfcmVtb3ZlKCkKClRoZSBJQkkgbWFuYWdlbWVudCBmdW5jdGlvbnMgImkzY19k
ZXZpY2VfcmVxdWVzdF9pYmkoKS9pM2NfZGV2aWNlX2ZyZWVfaWJpKCksCmkzY19kZXZpY2VfZW5h
YmxlX2liaSgpL2kzY19kZXZpY2VfZGlzYWJsZV9pYmkoKSIgc2hvdWxkIGJlIGhhbmRsZWQgYnkK
aW5kaXZpZHVhbCBJM0MgZGV2aWNlIGRyaXZlcnMgcmF0aGVyIHRoYW4gdGhlIGNvcmUgZnJhbWV3
b3JrLgoKQ3VycmVudGx5LCBpM2NfZGV2aWNlX2ZyZWVfaWJpKCkgaXMgdW5jb25kaXRpb25hbGx5
IGNhbGxlZCBpbiB0aGUgZnJhbWV3b3Jr4oCZcwppM2NfZGV2aWNlX3JlbW92ZSgpIGZ1bmN0aW9u
LCBldmVuIGlmIGkzY19kZXZpY2VfZW5hYmxlX2liaSgpIHdhcyBuZXZlciBjYWxsZWQuCkFsdGhv
dWdoIHRoaXMgaGFzIG5vIGZ1bmN0aW9uYWwgaW1wYWN0ICh0aGUgZnVuY3Rpb24gY2hlY2tzIGZv
ciBOVUxMKSwgdGhlc2UKY2FsbHMgc2hvdWxkIGJlIHN5bW1ldHJpYyBhbmQgbWFuYWdlZCBieSB0
aGUgZHJpdmVyLgoKQXQgcHJlc2VudCwgb25seSBtY3RwLWkzYy5jIHVzZXMgSUJJLCBhbmQgaXQg
YWxyZWFkeSBoYW5kbGVzIGJvdGgKaTNjX2RldmljZV9kaXNhYmxlX2liaSgpIGFuZCBpM2NfZGV2
aWNlX2ZyZWVfaWJpKCkgcHJvcGVybHkgaW4gaXRzIHJlbW92ZSBwYXRoLgpUaGVyZWZvcmUsIGl0
IGlzIHNhZmUgdG8gcmVtb3ZlIHRoZSByZWR1bmRhbnQgaTNjX2RldmljZV9mcmVlX2liaSgpIGNh
bGwgZnJvbQp0aGUgZnJhbWV3b3JrLgoKPgo+IFNpZ25lZC1vZmYtYnk6IEpvcmdlIE1hcnF1ZXMg
PGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNvbT4KPiAtLS0KPiBBcyBpcywgaWYgaTNjX2RldmljZV9m
cmVlX2liaSBpcyBjYWxsZWQgYmVmb3JlIGkzY19kZXZpY2VfZGlzYWJsZV9pYmksCj4gdGhlIGZv
bGxvd2luZyBleGNlcHRpb24gb2NjdXJzOgo+Cj4gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0t
LS0tLS0tLS0tCj4gV0FSTklORzogQ1BVOiAwIFBJRDogMTI5NTAgYXQgZHJpdmVycy9pM2MvbWFz
dGVyLmM6MzExOSBpM2NfZGV2X2ZyZWVfaWJpX2xvY2tlZCsweDg0LzB4YjAKPiBNb2R1bGVzIGxp
bmtlZCBpbjogZHJpdmVyKC0pIGF0MjQgcmVnbWFwX2kyYyByZWdtYXBfaTNjIGFkaV9pM2NfbWFz
dGVyIG52bWVtX2F4aV9zeXNpZAo+IENQVTogMCBVSUQ6IDAgUElEOiAxMjk1MCBDb21tOiBtb2Rw
cm9iZSBOb3QgdGFpbnRlZCA2LjEyLjArICMxCj4gSGFyZHdhcmUgbmFtZTogWGlsaW54IFp5bnEg
UGxhdGZvcm0KPiBDYWxsIHRyYWNlOgo+ICB1bndpbmRfYmFja3RyYWNlIGZyb20gc2hvd19zdGFj
aysweDEwLzB4MTQKPiAgc2hvd19zdGFjayBmcm9tIGR1bXBfc3RhY2tfbHZsKzB4NTQvMHg2OAo+
ICBkdW1wX3N0YWNrX2x2bCBmcm9tIF9fd2FybisweDdjLzB4ZTAKPiAgX193YXJuIGZyb20gd2Fy
bl9zbG93cGF0aF9mbXQrMHgxYjQvMHgxYmMKPiAgd2Fybl9zbG93cGF0aF9mbXQgZnJvbSBpM2Nf
ZGV2X2ZyZWVfaWJpX2xvY2tlZCsweDg0LzB4YjAKPiAgaTNjX2Rldl9mcmVlX2liaV9sb2NrZWQg
ZnJvbSBpM2NfZGV2aWNlX2ZyZWVfaWJpKzB4MmMvMHg0NAo+ICBpM2NfZGV2aWNlX2ZyZWVfaWJp
IGZyb20gZGV2aWNlX3JlbGVhc2VfZHJpdmVyX2ludGVybmFsKzB4MTg0LzB4MWY4Cj4gIGRldmlj
ZV9yZWxlYXNlX2RyaXZlcl9pbnRlcm5hbCBmcm9tIGRyaXZlcl9kZXRhY2grMHg0NC8weDgwCj4g
IGRyaXZlcl9kZXRhY2ggZnJvbSBidXNfcmVtb3ZlX2RyaXZlcisweDU4LzB4YTQKPiAgYnVzX3Jl
bW92ZV9kcml2ZXIgZnJvbSBzeXNfZGVsZXRlX21vZHVsZSsweDE4OC8weDI3NAo+ICBzeXNfZGVs
ZXRlX21vZHVsZSBmcm9tIHJldF9mYXN0X3N5c2NhbGwrMHgwLzB4NTQKPiBFeGNlcHRpb24gc3Rh
Y2soMHhlMGQwOWZhOCB0byAweGUwZDA5ZmYwKQo+IDlmYTA6ICAgICAgICAgICAgICAgICAgIDAw
NGEyNDM4IDAwNGEyNDM4IDAwNGEyNDc0IDAwMDAwODAwIDAwMDAwMDAwIDAwMDAwMDAwCj4gOWZj
MDogMDA0YTI0MzggMDA0YTI0MzggMDAwMDAwMDAgMDAwMDAwODEgMDAwMDAwMDAgMDA0YTI0Mzgg
MDAwMDAwMDAgMDAwMDAwMDAKPiA5ZmUwOiAwMDQ5ZmUxMCBiZWQyYjczYyAwMDQ3ZjBhNSBiNmMy
NjE2OAo+IC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQo+Cj4gRm9yY2luZyBk
cml2ZXJzIHRvIHNldCBhIC5yZW1vdmUgbWV0aG9kIGluc3RlYWQgb2YgdGhlIHdyYXBwZXIKPiBk
ZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQsIGR1ZSB0byB0aGUgY2FsbCBvcmRlci4KPgo+IEkgYmVs
aWV2ZSB0aGUgYmVzdCBlcmdvbm9taWNzIGlzOiBpZiB0aGUgZHJpdmVyIHJlcXVlc3RlZCBhbmQg
ZW5hYmxlZAo+IHRoZSBpYmksIHRoZSBkcml2ZXIgaXMgcmVzcG9uc2libGUgdG8gZGlzYWJsZSBh
bmQgZnJlZSBpYmkuCgpJIGFncmVlLiBpdCdkIGJldHRlciBhZGQgZGV2bV8qIGhlbHAgZnVuY3Rp
b25zLCBzaW1waWZ5IG1vcmUgZXJyb3IgaGFuZGxlCnBhdGNoLgoKRnJhbmsKPgo+IFRoZSB1c2Fn
ZSBsb29rcyBsaWtlIHRoaXM6Cj4KPiAgIHN0YXRpYyB2b2lkIGRyaXZlcl9yZW1vdmVfaWJpKHZv
aWQgKmRhdGEpCj4gICB7Cj4gICAgICAgICAgIHN0cnVjdCBpM2NfZGV2aWNlICppM2NkZXYgPSBk
YXRhOwo+Cj4gICAgICAgICAgIGkzY19kZXZpY2VfZGlzYWJsZV9pYmkoaTNjZGV2KTsKPiAgICAg
ICAgICAgaTNjX2RldmljZV9mcmVlX2liaShpM2NkZXYpOwo+ICAgfQo+Cj4gICBzdGF0aWMgaW50
IGRyaXZlcl9yZXF1ZXN0X2liaShzdHJ1Y3QgaTNjX2RldmljZSAqaTNjZGV2KQo+ICAgewo+ICAg
ICAgICAgICBjb25zdCBzdHJ1Y3QgaTNjX2liaV9zZXR1cCBpYmlyZXEgPSB7Cj4gICAgICAgICAg
ICAgICAgICAgLm1heF9wYXlsb2FkX2xlbiA9IDEsCj4gICAgICAgICAgICAgICAgICAgLm51bV9z
bG90cyA9IDEsCj4gICAgICAgICAgICAgICAgICAgLmhhbmRsZXIgPSBkcml2ZXJfaWJpX2hhbmRs
ZXIsCj4gICAgICAgICAgIH07Cj4gICAgICAgICAgIGludCByZXQ7Cj4KPiAgICAgICAgICAgcmV0
ID0gaTNjX2RldmljZV9yZXF1ZXN0X2liaShpM2NkZXYsICZpYmlyZXEpOwo+ICAgICAgICAgICBp
ZiAocmV0KQo+ICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiAgICAgICAgICAgcmV0
ID0gaTNjX2RldmljZV9lbmFibGVfaWJpKGkzY2Rldik7Cj4gICAgICAgICAgIGlmIChyZXQpCj4g
ICAgICAgICAgICAgICAgICAgZ290byBlcnJfZW5hYmxlX2liaTsKPgo+ICAgICAgICAgICByZXR1
cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCZpM2NkZXYtPmRldiwgZHJpdmVyX3JlbW92ZV9p
YmksIGkzY2Rldik7Cj4KPiAgIGVycl9lbmFibGVfaWJpOgo+ICAgICAgICAgICBpM2NfZGV2aWNl
X2ZyZWVfaWJpKGkzY2Rldik7Cj4gICAgICAgICAgIHJldHVybiByZXQ7Cj4gICB9Cj4KPiBCZXN0
IHJlZ2FyZHMsCj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci5jIHwgMiAtLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0
ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gaW5kZXggNjY1MTNhMjdlNmU3Li5hMGZlMDBl
MjQ4N2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJz
L2kzYy9tYXN0ZXIuYwo+IEBAIC0zMzQsOCArMzM0LDYgQEAgc3RhdGljIHZvaWQgaTNjX2Rldmlj
ZV9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+Cj4gIAlpZiAoZHJpdmVyLT5yZW1vdmUpCj4g
IAkJZHJpdmVyLT5yZW1vdmUoaTNjZGV2KTsKPiAtCj4gLQlpM2NfZGV2aWNlX2ZyZWVfaWJpKGkz
Y2Rldik7Cj4gIH0KPgo+ICBjb25zdCBzdHJ1Y3QgYnVzX3R5cGUgaTNjX2J1c190eXBlID0gewo+
Cj4gLS0tCj4gYmFzZS1jb21taXQ6IGRkYjM3ZDViMTMwZTE3MzA5MGM4NjFiNGQxYzIwYTYzMmZi
NDlkN2EKPiBjaGFuZ2UtaWQ6IDIwMjUxMTEyLWliaS11bnNhZmUtNDhmMzQzZTE3OGI4Cj4KPiBC
ZXN0IHJlZ2FyZHMsCj4gLS0KPiBKb3JnZSBNYXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5j
b20+Cj4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCg==
