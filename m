Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A0ECE8D6B
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhqUKBD3rkVnI8xkdqji6IkKSL4iEo2zu2bfAe8V7wQ=; b=pr1jFOypRtLYL1
	RQCh11yWHPPKWaCBz6hSlMqH4QlQg74HLuvpif6aDEi8pUhFSLCPeS6+hlGeSamcghazW6BoERG/2
	qEWaVKoSgvwdPI3mQCTe4YpqNzaa+JyoTcMWMURGH+NiOS2BUzw8oK7SSWuYEYfuYEI1HPo25vcyV
	xVOVrjc/xNmQwlR6wfLd3PPW9qkw6pM57gLj0ssC2AmBL2HReFrxDek+3F9PImp8j6PF2pYeaJrNV
	gHycT1B3n+tP7Uo0lpgRjJk4b3/aWRMzIKNYxATSPMGbXVrucLGsxJ6RnCwiwao7HRuZ6l3WOp1xP
	3RMZQl5c0+jZ+SlySXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4PU-0000000GgCu-14HX;
	Mon, 17 Nov 2025 18:57:08 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4PR-0000000GgCV-3tmH
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 18:57:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYQZrxAFkWRRfc+5JUzjgltidU7g29PyoEVhReNG8jwi6GQo5REdt7sSyhx4fSJ/21DDbKPbPexyiInGyPfj6ib5hc54x0Ro2FUoih4hVPfLOu9rqvxfG+dvVd24WbqFUhG1SBn1AGSzsX/kWcFSYnnWM1VtSr3i6axIBgZkiw09KmwqSAJQPeUHf9wc73PtPwrYzVyTs+dLPbbX5hy2BXMbHJGtp4fzDlak512ziBPeUdqFgJ0TT+E79mLFBUVlW1f/mswPHcdsfBezaEz4JFZOgtL8y18LiL+TIDyzaau0Ql8Yb/2BMzH2Z9zfS+pkmh9uhXsMwV45ocdOhQtexg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qp5qdgTY2RntKDCH56ZeZ2wwVKl+R0w1/+o8bS/Zq7Q=;
 b=tRBd6xvSW1K8ZhSFhYrLacgkbEMYRt15ZlBsNOZDiIDbGwmPyGM5S4TdcqB1UCJukNShoAVHmDO+zyrpfxKlhOQNXJo+Ph1kS27YjxGx6oirzy70Cq+atfZ6DJ0U11QKzfKaYk97gMOyI6q1uwq8xlSt0CNlHXW4RMBLHQDmgPN9VuHPcMUJfJiz5grdV+DAM1kz7veALWX73MjeBjLYYCPuzOyVuy9FmPFsEBlHVoiWTE6CH/YnS88YY8gLHu+EP5yIYva2slCzv1bwy0aWNLETpKEng5Iz+4qKJ2m8DJhciCTteY5JI2o+HgE3eiSaIBgHep3HoxCaJcBe1erlqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qp5qdgTY2RntKDCH56ZeZ2wwVKl+R0w1/+o8bS/Zq7Q=;
 b=ZzXVe1biHkkiOlDt6TALXz48nipczQd5uQZTm0o8PwJ1I6v8QWg+4nCI2V9rQ58fKNDLb2gnbLGkI1mylZsiC4RQjpz7jT1ic5N/0yoygrWov62i7ak7kMYxRjDJ4a4sX0915JGdd78vz0HFKtzjvdK4CJFIT2yWUrGxkIvUoocLNu/UBzCMMn9cgWkXT+5t03iKstpK81eUlv4jkY2QmmPQMWQ5m6ZAakXrZLtVLqzCj9PQ3H43XlA4UUn7MR0HsBIjCT3rVrjLe9i3/NZnl3H4MjRHtk8rbRBsmYpN+KPgjf0w6WVWwpIUaf4N1DDAUK5P06Cnt5kalU6Xkn//1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 18:57:01 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 18:57:00 +0000
Date: Mon, 17 Nov 2025 13:56:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 12/13] i3c: mipi-i3c-hci-pci: Add LTR support for
 Intel controllers
Message-ID: <aRtv9G3tD5D7EcjP@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-13-adrian.hunter@intel.com>
 <aReMbhYuSCT5RNnX@lizhi-Precision-Tower-5810>
 <e8d64938-9e9f-4899-bc37-dd78f02adc78@intel.com>
 <aRtGSstGcooM6mCs@lizhi-Precision-Tower-5810>
 <a5528063-176a-4646-ba0e-19d663b6ff7c@intel.com>
 <aRthVIuxnJHBEe/a@lizhi-Precision-Tower-5810>
 <387c55f3-1ea7-43e8-aabd-1ff320a99eae@intel.com>
Content-Disposition: inline
In-Reply-To: <387c55f3-1ea7-43e8-aabd-1ff320a99eae@intel.com>
X-ClientProxiedBy: PH5P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PA4PR04MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: d39b6679-84d9-4cce-96c4-08de260b16be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|19092799006|38350700014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FD8wmZSA4OMmhCNynPMvLC/gwG0rN4CCP5zGtMrXpiEEgpnKS5PXdSV1Ixn/?=
 =?us-ascii?Q?xWc3nPPWCKAU7IdzT8+mxibODr2hIKFKVWkhAPMlj9bmMIBMgrIjC/KJIbCR?=
 =?us-ascii?Q?kZVL3XK2O/4CXxWZ1rO/JDXcmdtTyWfanUQnllNu2qMWxggotZAd2v4AaHnV?=
 =?us-ascii?Q?RwmIesQ6CV9QZmfr860ObedcY8/xC+wBbFp0bO52lG6gq3WLATw8Hm3UMKhL?=
 =?us-ascii?Q?ZwDYr9t9MWCgALI4GlZnc139jcxZycTFVvJKQzepY52JKRPXZWAbfuzKQ9xC?=
 =?us-ascii?Q?mHZhd7wqbGQbJnop32V4j19QH9lUN++r6Skp+LjS8CKHNw9zsmKeWw8ivd+Y?=
 =?us-ascii?Q?bLVOBZNvBe3zAG0GoDau/NeH1roMn2G8kFNHyXhQb5tr6klquJBFfO9gTu7f?=
 =?us-ascii?Q?m884fXBV4Zt4DiLWOpe7KbycigFgyqhtC5NIZTzlQ7YgUDKO58Aq5t6LfhLg?=
 =?us-ascii?Q?0wFNhVCnOtmfCz2SXxUFNbvDrinYsWZWqVJBkmUsdIvOoN+ANzq3DBPJNPKg?=
 =?us-ascii?Q?00DTVZ94uUB/YIzzbGmrtvPgL0W3KlhgLrzzW02PCoKD3KR2g5Pjesh7nG90?=
 =?us-ascii?Q?HYJLQb5opJ1eMFU8hx9OLzjfIy1y+COdh3+p1e6alWgoYxrd9bXE+lhnUutY?=
 =?us-ascii?Q?+tha5+k5pOt907Kh8vpIBtwH0uoDLOoQS1x6nt2NvzxGZCl26NNYxQCCdZwT?=
 =?us-ascii?Q?yW4lg7CxkyCLJ2Dk+YgRiVjYE93Ye1OxyyD6BbGqUaczwak9cN7x/BgOsypw?=
 =?us-ascii?Q?ISdv5eoCdZiT7tPqQmX94scXwuuWWzG0+xyP34qHtUrHC6tvEOhSWCiRLNCJ?=
 =?us-ascii?Q?a062DusXfb4okty+bZ7WgVh1METM8me/JjHfs+7eMeEQPgmGHbmOkDg1XHD5?=
 =?us-ascii?Q?CQpmSIzkkmt3WoyNDdyS0JflIuPA/pzuXpayH8aiMzW22201p0JzSYKhtg0T?=
 =?us-ascii?Q?g8Y863hfYylpKgPGJefrg9h2xgg6qCJKTWlVWxDrLcvZMI8zeCJUFd4ALQrY?=
 =?us-ascii?Q?sJkKzTsIfwJSPhXb5q93/xSyPb1kkFzNfFIQcHMskVXJdqGOugcfteS1x1VU?=
 =?us-ascii?Q?flJIdpkbyJeC6R+Hg512SdEp2nLTB1FHqVKvGXTjJP7WKWxdtT9SDNBf5QJg?=
 =?us-ascii?Q?FZkIFfXasGwADtgkbv+bEiuzD/e5e3qqB3OLybDl94gqM0s2e5UnN2Expd4k?=
 =?us-ascii?Q?zS6POmFir0m/OBm45GZu5HtzF32U3uE6hdPhKu6dLnZFuCxnhm/Z3T5APMp5?=
 =?us-ascii?Q?B+0jNEIzd6iiGDyjf1GH+UMT61e8C/dlueFGvyZMDxwvGyu/ogzSslpY0/YV?=
 =?us-ascii?Q?NA4GYAlcFqRbx7PhU/4q4b5S76iprNY6NH/J0dZJkwVoTvmv5js4N+RB8MZI?=
 =?us-ascii?Q?Iw6pCm3WQu7nufavUahitEkmL6oSD3B0075fjK0S0XYMZvBaHyl+VSZe3cxH?=
 =?us-ascii?Q?+ujXB+u3EaDaufISqxZKmEC/mnkWYDWjiO3rOVI3VM7zL156EdRQ5LCWiSGS?=
 =?us-ascii?Q?VSO3eYXwUpEJ4Ogx+2/5RBa/3FlalmkeiIfN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pSke08PCCq1HguR7XltccfkNMhQbMBFD9jfT9p082UPpxjT0PEiUMbLFt9Np?=
 =?us-ascii?Q?UHMzIt6x7OsArEKb+u8nWBH5BOP53IvpOMXqTNGQY+xUHJGRgnTF4l2YrssF?=
 =?us-ascii?Q?OpdBslzfHeOnw9TvRn2vXhDs4RAlHFIqIr12bmWysOTrtUCAPbfnXn07GrJl?=
 =?us-ascii?Q?6tEuxlvL5E/ZpHLb537fKma+El0qDOkBrDWCpfmf5mT0J6YaK84PCrvf79fe?=
 =?us-ascii?Q?cmC5CtWCJnPAuUbX0X6VUUgfOa4rbRQfEwPfOvhLTNTRRlgNjhvvjkG+YtIw?=
 =?us-ascii?Q?R6RkZxR9XJDfJ9EyCQA5QyAtPGrauKVgzQ8wizzOenjH6hxBuZugSDvt3ERe?=
 =?us-ascii?Q?Baqrgje8VKjJgW7NelI0IsFS8xRAGN6Ff5z0cZ3SAmneN1M0+TN64p/ABgpp?=
 =?us-ascii?Q?irSwCyUJYLUmRrT2lw6FojyjxXtkUgKwiAgwWEedxjkBDOS7MK0yZiLmdGW9?=
 =?us-ascii?Q?j0Q+rmr1l8W4iMqm+E/Py/OMrAN6Hy1aJqlKn6HfSjtS4hR8O1KRAjuong2c?=
 =?us-ascii?Q?eMlp1uFhuCQ0qphFFJ9pT/4PXpXPO3I8CqOygft3HgENHmPSfth1yKkUfL4j?=
 =?us-ascii?Q?2VfS7f29RlHdwmeBs1uwuaWR2PkSReUDObR1xZwmAarKYUoZZhmKOZBO6yvk?=
 =?us-ascii?Q?jxPqZvUkxeA/WDCYpCLkhPArfre/SF2+0lCCdIiOWakZAzuK3mx/7uyn6IJS?=
 =?us-ascii?Q?/4+7JN4QeorlfEEf9AguIrx5nVxMeYW7UDnNOXiIP1cEXcIkAIM1yU6Fkjws?=
 =?us-ascii?Q?hY97z7IizTCLFp6j5R7Wvu+BQyYzk9yxELboPLxhbFccIvAbh9A/UaRLvilc?=
 =?us-ascii?Q?UGUbN9OcCr1h6ksDrkEicwElWGv9D5tI4RwuHaSLWx+rYYJopb4gwbi6EspU?=
 =?us-ascii?Q?80XiMYD98LrQDMghhzO+si1rHQYQPMy96EZgXh+bpXjUh1thCQDSAWxHJKn2?=
 =?us-ascii?Q?4A+65b907uatVvOGYnE3EQ9R+845S/H593c0Zxh6i05A9esk/vDYbQP9U1/x?=
 =?us-ascii?Q?eOkg5GCR9sv+ZzOWVH0W2dNBgOCdcj/YDfiBg2kLsmLvXNwT9Dar0/AtSZsL?=
 =?us-ascii?Q?qZii/8G5FcrclcDCwUaXktEg1PTXqzKdWq5xwpsuX875frIs3YUmlMduB0gC?=
 =?us-ascii?Q?e5kFW9mC0drW/2I+OiYNTdkoP1lKp0Tj1ws6zqUeGTKqaZER79r63mY++awm?=
 =?us-ascii?Q?z/gUCX7FXHMSRBgw5E+vhgv42nyp9yJ3q6hxtUpu6v8tw++ag9Zng5In/Rrz?=
 =?us-ascii?Q?LzU/C+cCM7Kmmocg6rAuPkugZrRC4Y+TIyJax7Vr8IenQZml04qnmDYDwJ5x?=
 =?us-ascii?Q?rZ/ea0FxsBvk2p4Ke8jOVGHzG2NZCTCX5kBoTpahzWNrw5s+3+yePhclmlV1?=
 =?us-ascii?Q?Aa0jlJdGbcp0WWOwN16IejNnIkO28bkgP68eYFcH0tF5KG2tdX7S+g29EmAb?=
 =?us-ascii?Q?BQmumagFv0o2W9FA54Ub8JssGWbEGbBmLKQmad9r+l2cdrxKgoHmiK+8YjNF?=
 =?us-ascii?Q?U3YwOCyLgioZsRFXZgnKUoNy4QAZQcSYRDNdNvU7UFeSzPeMXub042fECp8X?=
 =?us-ascii?Q?tKPg+wRoOtF56QnQCDA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d39b6679-84d9-4cce-96c4-08de260b16be
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 18:57:00.8510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /X88CiaBQmW3iNWCOGIXLbXwaj1nj9ctiS1NINN6fgM/Ucar7rJ4PUNUypHe3+xuHVOLPMVwMuiKYZE0Vi0UXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_105705_990558_6B15372D 
X-CRM114-Status: GOOD (  30.37  )
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

On Mon, Nov 17, 2025 at 08:09:41PM +0200, Adrian Hunter wrote:
> On 17/11/2025 19:54, Frank Li wrote:
> > On Mon, Nov 17, 2025 at 07:47:05PM +0200, Adrian Hunter wrote:
> >> On 17/11/2025 17:59, Frank Li wrote:
> >>> On Mon, Nov 17, 2025 at 01:36:36PM +0200, Adrian Hunter wrote:
> >>>> On 14/11/2025 22:09, Frank Li wrote:
> >>>>> On Fri, Nov 14, 2025 at 08:13:55PM +0200, Adrian Hunter wrote:
> >>>>>> Add support for Latency Tolerance Reporting (LTR) for Intel controllers.
> >>>>>>
> >>>>>> Implement PM ->set_latency_tolerance() callback to set LTR register values.
> >>>>>> Also expose LTR register values via debugfs.
> >>>>>>
> >>>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >>>>>> ---
> >>>>>>
> >>>>>>
> >>>>>> Changes in V2:
> >>>>>>
> >>>>>> 	Make use of FIELD_PREP()
> >>>>>> 	Improve handling of values that exceed the maximum
> >>>>>>
> >>>>>>
> >>>>>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 125 ++++++++++++++++++
> >>>>>>  1 file changed, 125 insertions(+)
> >>>>>>
> >>>>> ...
> >>>>>> +static void intel_ltr_expose(struct device *dev)
> >>>>>> +{
> >>>>>> +	dev->power.set_latency_tolerance = intel_ltr_set;
> >>>>>> +	dev_pm_qos_expose_latency_tolerance(dev);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void intel_ltr_hide(struct device *dev)
> >>>>>> +{
> >>>>>> +	dev_pm_qos_hide_latency_tolerance(dev);
> >>>>>> +	dev->power.set_latency_tolerance = NULL;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static struct dentry *intel_actualize_debugfs_root(bool add)
> >>>>>> +{
> >>>>>> +	static struct dentry *debugfs_root;
> >>>>>> +	static DEFINE_MUTEX(lock);
> >>>>>> +	static int ref_cnt;
> >>>>>> +
> >>>>>> +	guard(mutex)(&lock);
> >>>>>> +
> >>>>>> +	ref_cnt += add ? 1 : -1;
> >>>>>> +
> >>>>>> +	if (ref_cnt) {
> >>>>>> +		if (IS_ERR_OR_NULL(debugfs_root))
> >>>>>> +			debugfs_root = debugfs_create_dir("intel_i3c", NULL);
> >>>>>
> >>>>> I think it'd better to create common "i3c" debugfs root. So your device
> >>>>> use debugfs_create_dir(dev_name(&hci->pci->dev), ...) under this common
> >>>>> root.
> >>>>
> >>>> The debugfs files are being created for the PCI device to contain PCI
> >>>> LTR information.  The i3c module has nothing to do with that.
> >>>>
> >>>> Also, currently, there is no module dependency between this PCI driver
> >>>> and i3c, but a dependency would be necessary to coordinate the creation
> >>>> and deletion of an 'i3c' debugfs directory.
> >>>>
> >>>> The extra complexity can't be justified.
> >>>
> >>> Don't post new versin before we close open discussion. I see your post
> >>> patch before this message.
> >>
> >> Sorry, but it is late in the release cycle, and it saves time when we
> >> are in different time zones.
> >>
> >>>
> >>> So, I think not necessary to create to root, which cause complex, (need
> >>> lock, and refer counter).
> >>
> >> So you are OK with V3?
> >
> > In v3, still create "intel_i3c" root dir, how about direct create dev
> > under root
> >
> > 	debugfs_create_dir(dev_name(&hci->pci->dev), NULL);
> >
> > to reduce unneccesary complex, (like mutex lock and ref counter).
>
> Could do.  I added intel_i3c to match intel_lpss which is also
> PCI devices with LTR e.g.

You can use similar method to create root at module_init.

static int __init intel_lpss_init(void)
{
        intel_lpss_debugfs = debugfs_create_dir("intel_lpss", NULL);
        return 0;
}
module_init(intel_lpss_init);

Frank

>
> # tree /sys/kernel/debug/intel_lpss
> /sys/kernel/debug/intel_lpss
> |-- 0000:00:19.0
> |   |-- active_ltr
> |   |-- capabilities
> |   `-- idle_ltr
> `-- 0000:00:19.1
>     |-- active_ltr
>     |-- capabilities
>     `-- idle_ltr
>
> 3 directories, 6 files
> # tree /sys/kernel/debug/intel_i3c
> /sys/kernel/debug/intel_i3c
> |-- 0000:00:11.0
> |   |-- active_ltr
> |   `-- idle_ltr
> `-- 0000:00:11.1
>     |-- active_ltr
>     `-- idle_ltr
>
> 3 directories, 4 files
> #
>
>
> >
> > Frank
> >
> >>
> >>>
> >>> Frank
> >>>
> >>>>
> >>>>>
> >>>>> ...
> >>>>>
> >>>>>> +
> >>>>>>  static const struct mipi_i3c_hci_pci_info intel_info = {
> >>>>>>  	.init = intel_i3c_init,
> >>>>>> +	.exit = intel_exit,
> >>>>>>  };
> >>>>>>
> >>>>>>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>>>>> --
> >>>>>> 2.51.0
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> linux-i3c mailing list
> >>>>>> linux-i3c@lists.infradead.org
> >>>>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
> >>>>
> >>>>
> >>>> --
> >>>> linux-i3c mailing list
> >>>> linux-i3c@lists.infradead.org
> >>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
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
