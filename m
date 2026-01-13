Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899E9D2F349
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 17:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Hx+OXX1EmqHA6/kp3mRKxinu9ZKIQs2g8m2aE1kAHs=; b=PpDkIWDic4kHLl
	pHSd8Q49x924eBqz1+EcYx8Hfz4olrXHvSsktD7SD6zXi4FNBBmDBUyMS3RRNm9cLXoWfz1/gscJo
	shONGraM8IzqLMSkbFUjsSwibSDhL3bfgdO3wAI4hMChilSAH/Vlq38P14PIXqRMhYukANFydpoRm
	IaP/wHIQ4mi/mnwG/aeQlcPUjI9PYeiCwMBgHKSH29AMI92hrPqtpyYX9HetWhPqHIc0rfLkBY5lT
	3ULkSLrWZtBkFsSmVrrhViktzh7nkYpY3hymqNB7EPgUXAwbH1A4uaQxquBoth7AfQZjaXfzTCdnh
	cPrEqjzoncsO37fqk21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiVq-00000007YoJ-17nG;
	Tue, 13 Jan 2026 17:49:02 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiVn-00000007Ynu-1dUE
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 17:49:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spBE9XR0xuyqaYvB4/EPOy5gAps1beM8f1LwwwIvaeC6uwXC7LgqmWx/rQhO+eU1OAH0la0who+kdrrwtsLm4/s5/eCaiby70PU1Nq1cXMm0fLtCMXD3Om0nRkgIUnAa8w4PuZ8/NP4/xRzFSH8eFmI7ybsvtjaF3OdYQ373Aal4B4+gox8LYLuNI373DRqXld+NT5q+3T9BYF+2rZFwpfCS1Q22/Yty3r40+Ah3w2kfWOz0fwBG9X6BRcfS1Fbebwp10H1awGElXWvlEJOlIf7Q93Y5RH9DFVw9pDFh/X3wox72SfH2osxbFwSLBHrYoDIgxpEGpbSRbr7SWPtPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppPHj9zlTWEOckkuFi1ApuFbFrTwy8spPuaOwkwBjAU=;
 b=McVI64WiQKjVVqLLnTP4TuQJWSe9PB2Ybd4eGu/H79EGBxbLBdZewEEDqaXyuRIjtV3jKZQhLzN7f14wU++RL00jYiz7DNC7X6rAW5XpDcDQXNYJtVa8GkInjjv2pn3rT9TZm5PxkIxnXzUBccWO+q5UxSOzaeOFl4o2R2/tMG8pqQ+EzURJBbrBY27Ava3/2N7PV3SCRFLXnSCs1/777acbKQgGqNW5NBK6AITsfTdDAvsnT5pULolJURo6wccVo5wuFb3fM1orK71NrFMyf3AT7ipaI4XfKllx8qyJPfS2Kp17e4JB3PrSiGT7Nr75W7gmre54rZiecXv03JwSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppPHj9zlTWEOckkuFi1ApuFbFrTwy8spPuaOwkwBjAU=;
 b=L0FkbBeMLxaOWevHjr8ESCLCwpbVJffUEs4UzjO17V2p3qvPM1o8845BGvGb2apNTGdeX7doaLAzQYas9TBWNcR+IafiVj1HFquBhjAjefYAAe7xQuxH9SXMJnhpJGFrnm1c60LtA6RaO6rP3R4hKHsBz+nXl16QxwFWbqOsBG1eyq5/oaNDksKmwSzEWTOiQQ3NmCiefImKGhwxZIhVlU+M7SKwbMx/gMH4msJNDwlhVaD8bkNrl64ASapvYnJnvITjKYCYmE3zMjBID+97/o1XRiT6MmBaiYFo1H8sLIrJvew90lgmqLUCB3S7c0+PBdEMt7meugurlFN63jszMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by AM9PR04MB8601.eurprd04.prod.outlook.com (2603:10a6:20b:438::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 17:48:55 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Tue, 13 Jan 2026
 17:48:54 +0000
Date: Tue, 13 Jan 2026 12:48:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 16/21] i3c: mipi-i3c-hci: Factor out core
 initialization into helper
Message-ID: <aWaFgDdDk7KoutMw@lizhi-Precision-Tower-5810>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
 <20260113072702.16268-17-adrian.hunter@intel.com>
 <aWZyjxkuXEb2CH11@lizhi-Precision-Tower-5810>
 <e23f5cbf-7a1f-41d0-88fb-b8e4b9426113@intel.com>
Content-Disposition: inline
In-Reply-To: <e23f5cbf-7a1f-41d0-88fb-b8e4b9426113@intel.com>
X-ClientProxiedBy: PH7P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::20) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|AM9PR04MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: 2852daed-74c9-4109-af00-08de52cc0501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|13003099007|38350700014|18082099003|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5f4Dj7OIbv49HspgYw2K0Mui1cPIUIHF4CjJONUjYsTb+5Bso0cd4fljETm1?=
 =?us-ascii?Q?amzA08nsAMKZL0WH+lN6U0UsZ522hdPIJ80Pgr56POuyGhGkdT2OFHTkr5i1?=
 =?us-ascii?Q?jbhiHo+ia7wti51KDuDd9cdyAziw4jtZTts51cWooPwvSl1Ikuxhz+2LWOZk?=
 =?us-ascii?Q?TqBS0EJTrhNbAeKuUQZZfzof1/3WOZgmJZuUCpD3ljODwKkD4kktnns7M1f6?=
 =?us-ascii?Q?0rq7TpLJ3z9Z9szNPZ8jgIS+yggCAfCHag/f4lH82DdA09mgWL28BB2rLNJ1?=
 =?us-ascii?Q?DhvWRMImYZMdGxxcpifXhzXCGrFN3GfHvsiGn+WD4CB3tOZ6/WrIGUSbUk/R?=
 =?us-ascii?Q?69JzdX0A7cjnHJnpiqfUCSAjdIKh3dubgnKNO/TjVaMJBtpRVNxfqNzlkADY?=
 =?us-ascii?Q?f1bMYvE33iJwGTjfEcBzy3bqteaDvZjROWcXIdZ9e5p+Ww/GAv5syRWtOhVL?=
 =?us-ascii?Q?YIwDq7HAWPUs3/nGPFJVYNOIpJCKyUiAoQof9h6UV9uOqo92OPmxZP6FSMEd?=
 =?us-ascii?Q?1OZ0dTievTAYImB0B3gWsmSbmDQa2wIbgSXG84mf1acwYKtsSO66L9102y26?=
 =?us-ascii?Q?tuAK4nG9OfyjkkQ9gr3wKFe7H2iuDHsR60tpej0a0B98Ic41QBYG8HmTcDnv?=
 =?us-ascii?Q?n5gaohxOeWB5+ZgwHYeHrgmyuB79RSjm/90ipwp++zI0r+7bD30Zfv5TspLK?=
 =?us-ascii?Q?yjBzZP0kw+eTSqPHM0LDzhVpIdtOTo+K+gQHCjgL5OHey81qX9ceEcTuO3HM?=
 =?us-ascii?Q?gDmcOuERe8jvz5/5ac9TeJnrD+DoeXSaoDZj0jdAaxIS6WjWbpqgMngJ77RE?=
 =?us-ascii?Q?ayJEncblkasqSYZMPd5H9zRtoYDwTrBleBKqI9Gkh7aAhMlAEDBC7eFl9C6n?=
 =?us-ascii?Q?dBS1EA5jXgnZRnBEly6AZgLWBaP06kJ8ucWiQdz/XZBedEKFY01oP4yhD3s/?=
 =?us-ascii?Q?ji9/+ljQ+e5ksAPI3lcd71TB8fAWo4n99IhkZkglizGRW/FOBtMhJx6rKmEW?=
 =?us-ascii?Q?1sywNu60xy2TEb3F1GIU0+/S/d/Mk7/nZHqciEUpxXGL1WS4x+X02lblMQVx?=
 =?us-ascii?Q?ffuXeoltTRfW4kfiN+COGJ0qyao7gwmuaRnHSYTT3gH8bbhEa/leOApdA1HF?=
 =?us-ascii?Q?mTSZgkNDqeG1cnAzJahJ/YXBpEXl+GhFDzJXzjG3BCyxqeIFCBcQJbvpDoU5?=
 =?us-ascii?Q?HB+BDYvK/xLNpCY3MlCUuSmeWgRZ/wvNQABrhyqMsm8ZuTbsnrYpow1NsQXx?=
 =?us-ascii?Q?6thBHffzpxEiuZJeHgwrFJZKKkDT/3BQPQYpHphoMvCBLR+Pc8ZG0zz07yPC?=
 =?us-ascii?Q?GO3j+IDlgB0+e6TkmhMGNgSxPZjWNLeAqbxCZlzIbV5n4i+1mSFa//kKHMr0?=
 =?us-ascii?Q?acPoIA1i9ti9DH6iYqdJuLm/R7a0NE9+ij38VDadZrIy6Am7yt9VkuHATOHn?=
 =?us-ascii?Q?c0XMvLEv5Wil9Rvcq+iKBWw7TRBms7kYmAa1SdpXCadjRFbl4XMe1izIJV2r?=
 =?us-ascii?Q?WhytgodxHcMyWFkk9LRaAvbNrZOcCWxhg6DX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(13003099007)(38350700014)(18082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1cBu6ASJi0WRQDbkxDTt+iANB765cinSs6xlvq/btAfjdCW+x8DGhU/Z1iB8?=
 =?us-ascii?Q?tpCgb43Fc7VVJcHT3IACjloLloubTNoSLtVHv+wrekmE6IPq50VMC+5P/kLv?=
 =?us-ascii?Q?TwiIoIBLlKwPEKhYX6CPhwXMYeOV+nt5zQmHIAkOOn4IIe7UfOZAWYBvRHsI?=
 =?us-ascii?Q?9IA6Lx/Y9bR3F/5UtWTW5zhxQy0p9yeI6If22nLz4QSo/JizEG4ekEaxVSuC?=
 =?us-ascii?Q?gEmKGUtXuoLBkXIBeO7mP8RVe2PtntHOVVX49pNswSE9GNVvcKN578BefnNK?=
 =?us-ascii?Q?vAxvkbe9VKM+Wek7s7y9Ocvo7lPoQYBtsJhRbYsn2IPC4TwaWF3grRuevMoi?=
 =?us-ascii?Q?TZDR71eafbYLLbfpTbOji/CKZxHHsbDIl/Tf+vGXO4yB2aQnifhTc0TcKNuS?=
 =?us-ascii?Q?Tr7nMRa/X38s4gqscEKp5vWUIS/RgClmDF4uByJM/sjl1IPXjVUtlPzu6ud5?=
 =?us-ascii?Q?F1J4H7Lk7TMrbTjXV/UHmsfs9VnLCejiPBomGpo+Wgw1pXUuChPvoNEnQmhU?=
 =?us-ascii?Q?aD7ic3e2WPjV2+tV+9OCX6SiorQS67up+mJBbsZXI9DOoKJEprJ2yajWaKHM?=
 =?us-ascii?Q?d+0ELp5M4K8l1vbntbYXxcUdbf2DmftTpuLTZZGksUDl8M0S8pNUQ9/YchgH?=
 =?us-ascii?Q?deYdDlJkJgATqJ7rdG60jmlK65jaxPevNaGpR7GosfJ+tg2RRC76fDID0Bhv?=
 =?us-ascii?Q?LFl2h3Vm6s2UWdO1y2WhtyKGf+SrEw3qf4Q5zPzO/lqvG9d6tBmiTSs+F8At?=
 =?us-ascii?Q?GRN+TsygmsQtHtPKdMgyznujtDp/p1ROoPNvicjU+QdQdi88UGUpuXWXDNUj?=
 =?us-ascii?Q?kcJWhZ1EI2LNVqv0T7BTT9A2GMKZ205ihOVdm5DtKbRmrGFDJlXIUAP8odFM?=
 =?us-ascii?Q?UddavS7L/ErK8GJGdRrcGRbk5E/P7eaK1CIqHBaAuPIFgCewi45OJZuG0CD0?=
 =?us-ascii?Q?qLCrwtxF0MCJ2GJVN636/2jNOQwY1XtnqdAuSquVtY6b2/lV/5Trh6xDuDWT?=
 =?us-ascii?Q?UihhzQyQTM3zoIQtNyNQ3agUzmpB2Y3LK1zQNO4IaTudIV8sny2xR2UzhGsV?=
 =?us-ascii?Q?yWB8+yv5frRoXoisMwqSiTwiq7OTx7Y/lGCIW7mjoYtzRQCYA2TLGT0g5q9s?=
 =?us-ascii?Q?Xms7NBOicnb/kPXNE3/VyDhvIYeQl/GuXwqOtGmV0wk7MUI9wPX8B6kTcJnj?=
 =?us-ascii?Q?G4SyUDjOsTZRIXLoHf0gxwUARBmvYl+E2MMymNg+/63CZgERKe9v4ZJne4q4?=
 =?us-ascii?Q?BTI7b4vgLMqaIN/DyKlEioWene7uAsiRyIG41+K0O9vXF8OOBocKpR9xGeLd?=
 =?us-ascii?Q?z/6S5+hFxU69bmu94sItCvpIez9kR80he5VUmkvDtFWgJxoRnI/5F4ZCFtVf?=
 =?us-ascii?Q?9Io6y6XT9M/T0ffTNnqq2R/zC6DwR80AmrmMDxXy48xuNJpVDcR8Omre54tA?=
 =?us-ascii?Q?dQqu3nyOcVafGdYVcwX8MfvesINv1dhDQruoilnkAzqU9QWctjkraFH30p2a?=
 =?us-ascii?Q?GGuzyUamA/xxn42QLeOcYMsq6QzwlzlANEROEzJGSix0FAbQ2seyeErNgGkZ?=
 =?us-ascii?Q?xrV+XZqUa6x7jO9r4iClSXyUnwNXYnV9Esb0OJgIQD5zMrd0Lg1JUJlgYZZh?=
 =?us-ascii?Q?76gGoacjmr4NixqJsLA1PsN9ifpvoOi9Q0+pk3u7ncx9kRzpFkiyNhQUlqTj?=
 =?us-ascii?Q?nG3Hh7bJM54GcisIjzVmW0qFQrJdkBFiNyvgbhHg0GrhpW/K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2852daed-74c9-4109-af00-08de52cc0501
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 17:48:54.7904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taXpEeV2bpfJjxySP3Dkd/oXp36NzxyvgqQVy5MBx82asynOy0rt31zFZQYhDSdIjE22mc+p878CD3mn+73eRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8601
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_094859_646027_397FCB7C 
X-CRM114-Status: GOOD (  28.20  )
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

On Tue, Jan 13, 2026 at 07:27:05PM +0200, Adrian Hunter wrote:
> On 13/01/2026 18:27, Frank Li wrote:
> > On Tue, Jan 13, 2026 at 09:26:57AM +0200, Adrian Hunter wrote:
> >> Prepare for future reuse.  Move core initialization logic from
> >> i3c_hci_init() into a dedicated helper function,
> >> i3c_hci_reset_and_init().
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>
> >>
> >> Changes in V3:
> >>
> >> 	Move I/O mode setting if I/O mode already selected, to a
> >> 	separate patch
> >>
> >> Changes in V2:
> >>
> >> 	New patch
> >>
> >>
> >>  drivers/i3c/master/mipi-i3c-hci/core.c | 142 +++++++++++++------------
> >>  1 file changed, 75 insertions(+), 67 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> >> index 569c8584045a..8b8e3952d41d 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> >> @@ -639,6 +639,80 @@ static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
> >>  	return 0;
> >>  }
> >>
> >> +static int i3c_hci_reset_and_init(struct i3c_hci *hci)
> >> +{
> >> +	u32 regval;
> >> +	int ret;
> >> +
> >> +	ret = i3c_hci_software_reset(hci);
> >> +	if (ret)
> >> +		return -ENXIO;
> >> +
> >> +	/* Disable all interrupts */
> >> +	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> >> +	/*
> >> +	 * Only allow bit 31:10 signal updates because
> >> +	 * Bit 0:9 are reserved in IP version >= 0.8
> >> +	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
> >> +	 */
> >> +	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
> >> +
> >> +	/* Make sure our data ordering fits the host's */
> >> +	regval = reg_read(HC_CONTROL);
> >> +	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
> >> +		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
> >> +			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
> >> +			reg_write(HC_CONTROL, regval);
> >> +			regval = reg_read(HC_CONTROL);
> >> +			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
> >> +				dev_err(&hci->master.dev, "cannot set BE mode\n");
> >> +				return -EOPNOTSUPP;
> >> +			}
> >> +		}
> >> +	} else {
> >> +		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
> >> +			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
> >> +			reg_write(HC_CONTROL, regval);
> >> +			regval = reg_read(HC_CONTROL);
> >> +			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
> >> +				dev_err(&hci->master.dev, "cannot clear BE mode\n");
> >> +				return -EOPNOTSUPP;
> >> +			}
> >> +		}
> >> +	}
> >> +
> >> +	/* Try activating DMA operations first */
> >> +	if (hci->RHS_regs) {
> >> +		ret = i3c_hci_set_io_mode(hci, true);
> >> +		if (!ret) {
> >> +			hci->io = &mipi_i3c_hci_dma;
> >> +			dev_dbg(&hci->master.dev, "Using DMA\n");
> >> +		}
> >> +	}
> >> +
> >> +	/* If no DMA, try PIO */
> >> +	if (!hci->io && hci->PIO_regs) {
> >> +		ret = i3c_hci_set_io_mode(hci, false);
> >> +		if (!ret) {
> >> +			hci->io = &mipi_i3c_hci_pio;
> >> +			dev_dbg(&hci->master.dev, "Using PIO\n");
> >> +		}
> >> +	}
> >> +
> >> +	if (!hci->io) {
> >> +		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
> >> +		ret = ret ?: -EINVAL;
> >> +	}
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	/* Configure OD and PP timings for AMD platforms */
> >> +	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
> >> +		amd_set_od_pp_timing(hci);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int i3c_hci_init(struct i3c_hci *hci)
> >>  {
> >>  	bool size_in_dwords;
> >> @@ -708,43 +782,6 @@ static int i3c_hci_init(struct i3c_hci *hci)
> >>  	if (ret)
> >>  		return ret;
> >>
> >> -	ret = i3c_hci_software_reset(hci);
> >> -	if (ret)
> >> -		return -ENXIO;
> >> -
> >> -	/* Disable all interrupts */
> >> -	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> >> -	/*
> >> -	 * Only allow bit 31:10 signal updates because
> >> -	 * Bit 0:9 are reserved in IP version >= 0.8
> >> -	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
> >> -	 */
> >> -	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
> >> -
> >> -	/* Make sure our data ordering fits the host's */
> >> -	regval = reg_read(HC_CONTROL);
> >> -	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
> >> -		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
> >> -			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
> >> -			reg_write(HC_CONTROL, regval);
> >> -			regval = reg_read(HC_CONTROL);
> >> -			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
> >> -				dev_err(&hci->master.dev, "cannot set BE mode\n");
> >> -				return -EOPNOTSUPP;
> >> -			}
> >> -		}
> >> -	} else {
> >> -		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
> >> -			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
> >> -			reg_write(HC_CONTROL, regval);
> >> -			regval = reg_read(HC_CONTROL);
> >> -			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
> >> -				dev_err(&hci->master.dev, "cannot clear BE mode\n");
> >> -				return -EOPNOTSUPP;
> >> -			}
> >> -		}
> >> -	}
> >> -
> >>  	/* Select our command descriptor model */
> >>  	switch (FIELD_GET(HC_CAP_CMD_SIZE, hci->caps)) {
> >>  	case 0:
> >> @@ -762,36 +799,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
> >>  	if (hci->quirks & HCI_QUIRK_PIO_MODE)
> >>  		hci->RHS_regs = NULL;
> >
> > these parts have not move into helper funciton.  Is it safe to use
> > "hci->RHS_regs" in helper funciton?
>
> These parts are initializing things that never need to be
> re-initialized.
>
> RHS_regs is the MMIO address of the Ring Headers section
> for DMA, if there is one.  It is normally setup only once and
> never changed, but the quirk above sets it to zero to prevent
> DMA from being used.
>
> The I/O mode (DMA or PIO) is selected during probe and never
> changed.

Okay
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> >
> > Frank
> >
> >>
> >> -	/* Try activating DMA operations first */
> >> -	if (hci->RHS_regs) {
> >> -		ret = i3c_hci_set_io_mode(hci, true);
> >> -		if (!ret) {
> >> -			hci->io = &mipi_i3c_hci_dma;
> >> -			dev_dbg(&hci->master.dev, "Using DMA\n");
> >> -		}
> >> -	}
> >> -
> >> -	/* If no DMA, try PIO */
> >> -	if (!hci->io && hci->PIO_regs) {
> >> -		ret = i3c_hci_set_io_mode(hci, false);
> >> -		if (!ret) {
> >> -			hci->io = &mipi_i3c_hci_pio;
> >> -			dev_dbg(&hci->master.dev, "Using PIO\n");
> >> -		}
> >> -	}
> >> -
> >> -	if (!hci->io) {
> >> -		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
> >> -		if (!ret)
> >> -			ret = -EINVAL;
> >> -		return ret;
> >> -	}
> >> -
> >> -	/* Configure OD and PP timings for AMD platforms */
> >> -	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
> >> -		amd_set_od_pp_timing(hci);
> >> -
> >> -	return 0;
> >> +	return i3c_hci_reset_and_init(hci);
> >>  }
> >>
> >>  static int i3c_hci_probe(struct platform_device *pdev)
> >> --
> >> 2.51.0
> >>
> >>
> >> --
> >> linux-i3c mailing list
> >> linux-i3c@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-i3c
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
