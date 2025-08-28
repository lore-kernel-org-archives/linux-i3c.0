Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21105CA0FF7
	for <linux-i3c@archiver.kernel.org>; Fri, 29 Aug 2025 01:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3UX3WZupRjxVk0wGNS33SnBqYEEQeFI6o5KJA2FPso=; b=LhWwuhDYfN+Bev
	2w17kbDzp1A8bMgXTm1Yx4txYhmFLELt7EyAgGjX/+nglHEPT4sgXybbiBvOurT80Yp1pTTeZ0iJu
	2L4NaxzLhPn69ViKu75/NvK5Bt+lD/pGjkBqDX4fyif9KOaZr+BxTJwxG9Lutf57KyGoOBkNDyQbZ
	3y145MGTsCQkxb/Y9mg9HyI6AlVTDgzyzGBfUSVq2/5P0ePhMVfQtJFzet0nghTpr3b+dRXrcARHs
	C4VP3h0w1NCRH+0z6v4oxTP2MHQtJtlCt2MKIQd8/WMUrPMrsXahjDB3jJOI0Uw94QF2/BMz0inKU
	Y8rxpn6NSxg7074/xieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uro4x-00000004254-3pNw;
	Fri, 29 Aug 2025 01:38:59 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhTj-00000002nfT-3pco
	for linux-i3c@lists.infradead.org;
	Thu, 28 Aug 2025 18:36:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgVhdH0VgTpxH0/Zzer6TQlTH3+AGydfFN8XH2qjYdrw/NsAunfDY745JhBxWBSLsH4uSNr0vkRMQsIW6VrE7+JJHIzxMe9pJ5G4YHeg+lVWR/MdX8MrX9thwMzC/NCIBrtcvXszC8DvJWxElAvwelrWLGTbT0Q9wtG4gOSj56f0uX6ya8kayDnsrEHs9kaADCTQSBoCw9M6gTxe6UuxnwGMWMISmxCeHZS+khePKw2pfKJepi7+QnFsHXeHtwBJba6FFvEL6Hp28HzlnKhjGQZ3OgAYmfckusFUTcMPuCzcpigdOIHObjsM0qxmyCj1LENsuRdTeMX8mPlikEu59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5gWCUOihECVvLGylSuww3X4qnf2Ewv6PosTaAr01w8=;
 b=aYkbtwh2oo9qmM035bj9DQvV8fu77DmZ/Q7hQiCOPhU+d/NUnOlauir8Z/T8CXjNBeq557FWfAoJE6s2Mi0Vkij/5zd7l8E5gRN1seZE+apyxLaQAua5MezQAHk7ehPjjHpChmyiPFC3UR/raYoymLI0jf9Mc1gD5jQ+QSf8CQ0ZXyjpQhlrgP0PyQBpdytkycb5+vSbyQLZFkZ9vBkF/A6Bgfw/I9lLgMRZvXJdY2oZ7z79SVrDKUSoNaP6C138+iIl8A1gO/ckD61YxMeaAaHijpCcUr0BUybewMIiiwUy2MCWuBqAum+lpSksaeZwNobNVH1zQGXF4yPo/qSH7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5gWCUOihECVvLGylSuww3X4qnf2Ewv6PosTaAr01w8=;
 b=dJr+chS50NK+op8CDolDcQsF8TUVYj5mKhCag84hsPslKrnrRgx4TBdceM2JqSgQbJxddop+cpDh7/WQqCG6MGXyP7+if4OoWVtEtRFCnTw131Sn+O/Q3imGHIOmHYnbQtl/YmLd10c5FJOKoWeGsOl+PK/63aY65yNxyAVLh9doVCVn12Ha2QTbQaJtRfMk8rn1y53tAep5ahVsMDCuV0mbbLCpOKE3FQYC+jhrsUvhlSeOtiKkzmb5Fkrks7P4tnapdAh7hkwMWTFN/Yx10jQGDJC4jl3T+uqTBYla+t6U7iYzTrvfB8n1763MRQW11KI8A9Vyk24M7EZC+lBicA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB8PR04MB6907.eurprd04.prod.outlook.com (2603:10a6:10:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.9; Thu, 28 Aug
 2025 18:36:05 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Thu, 28 Aug 2025
 18:36:05 +0000
Date: Thu, 28 Aug 2025 14:35:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 1/2] i3c: master: svc: Use manual response for IBI
 events
Message-ID: <aLChjRd65DG/xG1R@lizhi-Precision-Tower-5810>
References: <20250828083225.3558100-1-yschu@nuvoton.com>
 <20250828083225.3558100-2-yschu@nuvoton.com>
Content-Disposition: inline
In-Reply-To: <20250828083225.3558100-2-yschu@nuvoton.com>
X-ClientProxiedBy: BYAPR11CA0071.namprd11.prod.outlook.com
 (2603:10b6:a03:80::48) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB8PR04MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b150432-7c17-4dd6-8f94-08dde661beff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bU4ig9ycWOta+Do/T+sn8o3ZzZ+GvwkkGAYJPRpp5P8agPd9B1NVVSwFRCE+?=
 =?us-ascii?Q?eauXrtHbhUrtSt/oeEd54RPgTlkmetJ/cN6MKb6scEQI5Phia8CFgd7SPiOV?=
 =?us-ascii?Q?GfDTcC1YHiP+CziLG/KM2cikjq+8abOxce+kfYffxLPmwmf5oM5CK3HAuIbH?=
 =?us-ascii?Q?p5X77qIxwFOnw1CWx4r1O+D2puMsQ3o/7e6yJlJEzoSrb3iwubrtumSYvzrw?=
 =?us-ascii?Q?i6Nn1HjeedUStfvv/aXIBHhPd5IqVxyOfrrSZkJFbAWZkQVg6556R8C9Z5o9?=
 =?us-ascii?Q?6WcHZ5OAph04jdHYeVaKfi3zCfyuNuPjENBPq9m3mVTqGSs4hByp+JiAv8QD?=
 =?us-ascii?Q?cLJ9aEScvsjKwmWDgDqLFV5/Kmg3wIFWFDEEw8tZ5yQR4/5AIrU21HqcrCbi?=
 =?us-ascii?Q?DYSyep2lVLRZe+x1QYD9S+bwp3Mg1V7NhdLvh/tb2hbO+bhQVvRpRz3hbPq7?=
 =?us-ascii?Q?I+lnjLyVEsua8HTtYEDchvYR7uO2vnSHlJyY011a2PSuomPdfoSIoNxRqy0O?=
 =?us-ascii?Q?xn6vvbqR+m2ysPSvs4ACRA7sexzi/DwF8+qhcGzaZ3yrVY6WtXHZG83RIrId?=
 =?us-ascii?Q?7mKh5KkkBBrAyMfbHwvw0Auv8iNo0MXlDvqmmiiM2wqRrD56/fQtjWdj8kkM?=
 =?us-ascii?Q?E9keJ1h2udMbECWnceG9h8CM1x16dIQ+8GOmqq87NvJL8P3ijBaTljdzTDlI?=
 =?us-ascii?Q?B4FVMR96rXmCgDL96C4kTBO6dO0kkm0yzrLnzgIOUg6dQpizBzKqelhLiH15?=
 =?us-ascii?Q?Kndz2DV5GZ0f/af5gjaT5P789H/NC5JHLpFAEHr5RleG6Z4htTRU6YFWsNi6?=
 =?us-ascii?Q?CrwU89oXdxooh0IFlMJWXs7ZEZ3sDI3SjIWNsoI50reocqnPx+IBnZ3LRJBi?=
 =?us-ascii?Q?U38Yg5dVJlgGEt4bAysLKsf4qnk9W2KTAS9aKJDC0jibfb+Uznu6uKAp8m1l?=
 =?us-ascii?Q?/LTeLl2aTXziK34+CKkQsyZxKtWWyBx3ngaTr9OpoUOFoOb95IY1WpfJRIRh?=
 =?us-ascii?Q?ELBLeX6MgBVrS8vJzwqPQ2pxi7PIvTIEHHl+FH3eAMt+vTZ6LOoVEGDngFxZ?=
 =?us-ascii?Q?v1WQ9JaX83UUTl2sUIe/e1pcf53wiBZv5ynptCt/3y7Vfemp/SoD3QLx2JJH?=
 =?us-ascii?Q?Mxij7ByZj2pCTXg3wDXcaTZAfoDkUEAlMW254jMEX67BBmYi0hAgu7nAuvif?=
 =?us-ascii?Q?ZKO9SpfaAfQepIfhisfxahED6c31c7OybvTlWaYehkyioH3DuqDKB3zlWbg+?=
 =?us-ascii?Q?x477v2GGcbhcijmcBql2fDrH9VotrouC6Cb2GoCciOsUgzkiLLrGZJM36lnU?=
 =?us-ascii?Q?rQoLTo5jkHoI3DWnYYyDTuQ9DLuzFiFpUMaGvnxSH5u9NrQGJyBoMfQM8GDC?=
 =?us-ascii?Q?vwHg6xgS+T7NeyLEKUTekL4570lfBaMtHODldJnGZE2PTyWDRCENYx1QMyGw?=
 =?us-ascii?Q?rGhasc2mKrP0Sfa9pxEhI9qaWNZmRUJ601anRcUKfeKmdSFNkriztHSEi1+4?=
 =?us-ascii?Q?EFyzrQE3FJLLCzQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?omyDcl7+KCFmrbivNrfbeQmIgQli0VjMHJXJAPmEnvj+c7yDzX5TNx4TH6Dl?=
 =?us-ascii?Q?a532tEjVjIegfaqXCT513nSdtx2AVE7rn+DJMWpjjUgNkRTQOn54KQ3IPmqE?=
 =?us-ascii?Q?JUl90xcUQxm55nZOtI+MGD2/NtYIW6LCKX+932gsbfh9BnrOaRnD5E8hpBKa?=
 =?us-ascii?Q?NxoDUucpSzWPPFuUx58nlPKb/B8jlJkovfzZvBnXeg+EpVQ1pM4tsoBjaedU?=
 =?us-ascii?Q?L1Xcmutf9soKBE1g66PjHBLX++PMOnN34RCJCkxJfoUzoe673Tos9A896VjP?=
 =?us-ascii?Q?5jsE6t5pE0n1P+1q+Zjjeh+DaTCB3fKe+CF43DHu5AhR9zl7viXNOzmxOTAE?=
 =?us-ascii?Q?q+CoXBcPAlUaozLiWawjzum6HkLNhgCrqnGwHLVcLu5N4btWLeqBCDQuRLZX?=
 =?us-ascii?Q?d/orlDGkK5w8sAuYQsOj6n7h6KGeho8hHuAFQ565+2sOlOO75GOs1RlVS2pp?=
 =?us-ascii?Q?hekxyUzikOklg6koJsBezC1xJZltyY2SNym7ge2ehI+eBgwL9bv83cIG0bs1?=
 =?us-ascii?Q?sHKTJTYeEaLtxJlV9D9uElROWEqpdevHHC6NVjk3XWrNY2qv4Y8DAIplWLx9?=
 =?us-ascii?Q?oVdgrIB454QxKoyoakvLWuHSJR2MBXo3CLfkAiQLh0DHJX87igMcaCrbufmT?=
 =?us-ascii?Q?xTBSUzIOBz4kBzMliIV/olswRJ46pSqDjGppeW6PNpGpkodummm/4h8JJTjK?=
 =?us-ascii?Q?84AK6GDZNLBi8qYLqstkYq+meh0SNJPZmSpeJNcstU7Y4m8QG6rfN9Vvk/6u?=
 =?us-ascii?Q?fkjaHnWC6ee5lx1D8vZhuVGbDaax+Yg+LypCh8J2IX6V4TSBah9ANrDMh3x8?=
 =?us-ascii?Q?6c/o/Vhe3u2wsaWBpa0AETlOBlnqVnn5oF5zars/fuZq2rhd/anmMuTYqJAO?=
 =?us-ascii?Q?PoOBU8YbKmV+pUYHYWTMGJ525MrNbY3iBP86wNPCNdCh4894PzlOsrNN3AiO?=
 =?us-ascii?Q?ZdF/zfDaLqaQU8O5+o5qL1eTv9WijHi39JrmIFp0D7TcXvEKE62ndFXObJNZ?=
 =?us-ascii?Q?MO1S0TuOJkSretdKk/MK3HtKdE80+90JZXsthCZ4k6JdHj3kSBmNvKC+runi?=
 =?us-ascii?Q?3zalzlnlIe8aFua87UPCWPxgrFRVPne8gKvBlEIsbV4ZT5ZBl36eAIAvsp1F?=
 =?us-ascii?Q?kQGtt61KaLrIgPOdpkpJLt5vwZGBt0oozfsCtWiB4hUSJd4Q2Ex6xkJs0sZa?=
 =?us-ascii?Q?L1U9Pjb8k3sYWI8kzyOJ5rSufmE8P36coj5OU5AGIstfHB+J3q+KxUVTJ+6d?=
 =?us-ascii?Q?QA7JR3Uh6v3S40D7uKeo2fdzA2Hw8P70Ec1/UumtiCA6B/M6oWofttfPYvVm?=
 =?us-ascii?Q?bfJyZt8BR+Q85tLDF/K1YXUTFcVZXVlOyKRI4/y9wmxeDJ7qbIFZqKSTb96s?=
 =?us-ascii?Q?U/sKT8B/ozAvNYezkOYyFyaV/F1gWdxl6I6XlCigqNEVS0iJ2+TqMfNs89ES?=
 =?us-ascii?Q?nfKBfpUvqT8nl5NqJArYvIUV3FMDlgc4P8qPRDraZMied2hn98TpvgycpfSe?=
 =?us-ascii?Q?IT0N7aOQMAdtogsKxzqHZh+HBYBFUFdbJErH1JgXlX9Hxv4z4n475di5QdHV?=
 =?us-ascii?Q?jXTTZ2oGljFbFb1at1c1ebcKZNSDj9zbn7LtrGXB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b150432-7c17-4dd6-8f94-08dde661beff
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 18:36:04.9613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPL7fL8W4H0BrhSVg7QoJ7/VwimmgokcMjNIgNk+hofiUo1VGMeZ4bs3gpFO79Bcxy/oxdap4LZFBCbP8zTxMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6907
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_113607_959072_156B5A98 
X-CRM114-Status: GOOD (  25.80  )
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

On Thu, Aug 28, 2025 at 04:32:24PM +0800, Stanley Chu wrote:
> From: Stanley Chu <yschu@nuvoton.com>
>
> Driver wants to nack the IBI request when the target is not in the
> known address list. In below code, svc_i3c_master_nack_ibi() will
> cause undefined behavior when using AUTOIBI with auto response rule,
> because hw always auto ack the IBI request.
>
>     switch (ibitype) {
>     case SVC_I3C_MSTATUS_IBITYPE_IBI:
>             dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
>             if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI))
>                     svc_i3c_master_nack_ibi(master);
>             ...
>             break;
>
> AutoIBI has another issue that the controller doesn't quit AutoIBI state
> after IBIWON polling timeout when there is a SDA glitch(high->low->high).
> 1. SDA high->low: raising an interrupt to execute IBI ISR
> 2. SDA low->high
> 3. Driver writes an AutoIBI request
> 4. AutoIBI process does not start because SDA is not low
> 5. IBIWON polling times out
> 6. Controller reamins in AutoIBI state and doesn't accept EmitStop request
>
> Emitting broadcast address with IBIRESP_MANUAL avoids both issues.
>

missed fix tag

> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 701ae165b25b..baf3059fd668 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -517,9 +517,22 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
>  	 */
>  	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
>
> -	/* Acknowledge the incoming interrupt with the AUTOIBI mechanism */
> -	writel(SVC_I3C_MCTRL_REQUEST_AUTO_IBI |
> -	       SVC_I3C_MCTRL_IBIRESP_AUTO,
> +	/*
> +	 * Write REQUEST_START_ADDR request to emit broadcast address for arbitration,
> +	 * instend of using AUTO_IBI.
> +	 *
> +	 * Using AutoIBI request may cause controller to remain in AutoIBI state when
> +	 * there is a glitch on SDA line (high->low->high).
> +	 * 1. SDA high->low, raising an interrupt to execute IBI isr.
> +	 * 2. SDA low->high.
> +	 * 3. IBI isr writes an AutoIBI request.
> +	 * 4. The controller will not start AutoIBI process because SDA is not low.
> +	 * 5. IBIWON polling times out.
> +	 * 6. Controller reamins in AutoIBI state and doesn't accept EmitStop request.
> +	 */
> +	writel(SVC_I3C_MCTRL_REQUEST_START_ADDR |
> +	       SVC_I3C_MCTRL_IBIRESP_MANUAL |
> +	       SVC_I3C_MCTRL_ADDR(I3C_BROADCAST_ADDR),

Suggest build full fields, although these bits is 0, like.
	SVC_I3C_MCTRL_DIR()
	SVC_I3C_MCTRL_TYPE_I3C

Frank

>  	       master->regs + SVC_I3C_MCTRL);
>
>  	/* Wait for IBIWON, should take approximately 100us */
> @@ -539,10 +552,15 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
>  	switch (ibitype) {
>  	case SVC_I3C_MSTATUS_IBITYPE_IBI:
>  		dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
> -		if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI))
> +		if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI)) {
>  			svc_i3c_master_nack_ibi(master);
> -		else
> +		} else {
> +			if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
> +				svc_i3c_master_ack_ibi(master, true);
> +			else
> +				svc_i3c_master_ack_ibi(master, false);
>  			svc_i3c_master_handle_ibi(master, dev);
> +		}
>  		break;
>  	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
>  		if (is_events_enabled(master, SVC_I3C_EVENT_HOTJOIN))
> --
> 2.34.1
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
