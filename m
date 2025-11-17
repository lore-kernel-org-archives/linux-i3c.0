Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81731CEACEF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 15:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sM+2Bv2crJA5inruXuNmBhLBQeWXenIOcW6Wwt0s7R8=; b=DS0kniPW1vD4HD
	zZMU95BbCMnY+403q93OiD6NC56sE0dJu5FXnnq9wiEtHdwfGhoC0s6RWJTacYieB09tnbjEPGB4z
	KdRKYXKCj3Akmje04w6y380xUkl8UG5YcA/H8zs5i7khHNoWIajGYX4IskTS60KNIfQkxXV0/SgX4
	jOVsT0qREXRAGFEUco1K26t7F28bhnmdQbzhcmNxrJfNVnwmpW2DSfINZuL4iyJz1JReH63nrWfUl
	zH9YKtvaQ4k7QPNbIrTxIMUmwlrP7znGD6UZ9v7w5p0lNVE8lbcw8IHKh6KQhzuPOZmGyG7L2kNNw
	6KT6R36tcLkOgApLvWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1dS-0000000GMNN-0lxe;
	Mon, 17 Nov 2025 15:59:22 +0000
Received: from mail-francesouthazon11011012.outbound.protection.outlook.com ([40.107.130.12] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1dQ-0000000GMMP-2yTK
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 15:59:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVfOl1eepZ85vN4MuE2cMyNlm0sQ+gSxtl0K8Rdm9dztdmveuDmXM3m88CiYwYNgRyZ0aYiyGCPnGOJWg4UoeChXmi7cLZgO5fwsVCsRXRn9DuwFvbljHQtl6tsyVftjPNhZGbQi1k95BmLLnVVqDXR9p6+zz4GrW3fx2AQTA3cZWSs9ogMDn6x0aWT9pPZr9UzGIlXj4P5TGM5/1x7ZfFnY25sh8e9d+wRvDEzWjqftafDmenI9LcYtQQ/ZpTlKmzPR3aSIIb8Uga9THG8heztnUDdTr/3IFR94Ngt8DUl3+y1/0d6ZOSKFn7ITIV4H/S8xVXnlsfo6vgxNoUgF2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ktK4Nn5qYTnlvDPyKPohJYSWqtOi/hoP9BYOLS8TLs=;
 b=gwRpYCWdB6gkeUnu3YjzCsX671qgALD7VzQpr3pUUtek3I2zop0UcosuLEIkitt1742e4gt5V3NfwwiQ/vmtwz2kTIzm85iqrNmOnxHBbLWi7sCJetaRqARmhxDJrBYABoE5YJUqYF6L4ZW7Ic32JnGnMJjpN6+w2PuvnB2XEyX00QJcj4d/d8f5dooK1Chp6K4y6R5Tat2hn891NVrOc2QFinXDLpf2t7N1LAWWV71rvf5K/lA1YuP8K2QoFX+Ui3tth+eVEmr4KgnSJypS5Ms5uevkOVvjc8VclMm0ikJEH2N/TENa9f+aAi7zDncqqMtDlqGmZFPRDZLh5c95+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ktK4Nn5qYTnlvDPyKPohJYSWqtOi/hoP9BYOLS8TLs=;
 b=FUFG39JfycP5z/1TXcD3hnOxlWItV3wToGKml2ZZ3utS/t60Y2aGam452hhtnkKzT/DMtTZNdE8txsRy9a508WAY/Nfv8jQhocHTFFoJEWEk9OpScdqsY1A/6eHtgINzuJ5lIVwEzyNg3yEeI/cuIi+j6xrjDC5miYu4XU4brEf0aDgVbxpSjG7zWW4F8y37Mq/dzFDTlNELEwIwnwA/KM9BWgC4B03c9mqC7+4KFgidfsfsejnTQnmlpV9c1QVWcuphEIEirPDISqhf1ZNrrYKvgWnJyo8CAknXp9tSqp3dSoGPZvbbvHtdEV0A8+mdiHYIyTKDnO1wf4mkCnOBQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV2PR04MB11681.eurprd04.prod.outlook.com (2603:10a6:150:2a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 15:59:13 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 15:59:13 +0000
Date: Mon, 17 Nov 2025 10:59:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 12/13] i3c: mipi-i3c-hci-pci: Add LTR support for
 Intel controllers
Message-ID: <aRtGSstGcooM6mCs@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-13-adrian.hunter@intel.com>
 <aReMbhYuSCT5RNnX@lizhi-Precision-Tower-5810>
 <e8d64938-9e9f-4899-bc37-dd78f02adc78@intel.com>
Content-Disposition: inline
In-Reply-To: <e8d64938-9e9f-4899-bc37-dd78f02adc78@intel.com>
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV2PR04MB11681:EE_
X-MS-Office365-Filtering-Correlation-Id: 3661c1e3-92eb-4a0e-118a-08de25f24074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|7053199007|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ktJ/YD5oJbsvi41cnNf/x5T7L++g6dAyeW3tNoy/NhkJ4HS8KmO9/aMS61re?=
 =?us-ascii?Q?RC5+gL9tBzcbtl35puXfFpJXISV//Lt2U+IAH5HtPz2W8GnNGLtEItZVAKlk?=
 =?us-ascii?Q?0B5+li8mbcDF52KDckzz++oVZ3FI51KpaiI2a4DAxgCk7D+4T7pg4bTy5f5+?=
 =?us-ascii?Q?EIWVH5YuDYeNqMpNf5hKe4JZfEffVHfbJYr+5ZMd/VV81d0FUCsUOElLTr7k?=
 =?us-ascii?Q?GjSOc3TlvQV0ci2Xjdd4lszV87zwq3O+/nleGc6oX0eUk5nJI2TKjg0j35bU?=
 =?us-ascii?Q?i25U4ePH5ol9ACV83tmpAmkQKVW6kDXVpWm8nAF3Pu24hXu19fd6GMpso4+Z?=
 =?us-ascii?Q?fvMrjCsR/mtpuc4EyATzlaLH728/vsDd91ncwTJAfX0Qh4p6gHvoy33DiBpm?=
 =?us-ascii?Q?ybPQhABIGabKkenIaI0XsU57sQ0LuBi05vL/bZ0crwe2cE6KxRQUvStM/bGR?=
 =?us-ascii?Q?3a/FD85323O/KGmcPnlhL1/aqlPMBvrCWZjvaiDPAOxloMxkthO0xL09nnqL?=
 =?us-ascii?Q?r5GE/dKLy1pSQiqEmAV3eLrGz+aFV51PXgV9/Nd1JodtVf9LRg3jbjDoK6xt?=
 =?us-ascii?Q?g/XAw7BK85lrH4eK9ZprdasezSA/bpjLbbuzHyVN38hgv9JiQFelldXAAgjb?=
 =?us-ascii?Q?g6iNI0Kubpag0WMvs8rlzHZmF8gpV7b55mkRRtfuvPgj5uwjLTftpbXWdS2l?=
 =?us-ascii?Q?PjgK3p2Wamc1r9+XJYUStGBvsnZVsCV5VHXPvGzHRhY3+zrTaKWDbPq4+brY?=
 =?us-ascii?Q?gOKukL1cum19pAkC8IoKv+I/a4EQ0UAJjukyLXSfHw8ICSfamJuJl+rbcc0M?=
 =?us-ascii?Q?CabjXkIQPHAiVDJ4WGwbD0LsGi4UbrPPWcb23y7uYcaWNp9Pdqkap8xy/hVp?=
 =?us-ascii?Q?MnH6B/6wIXnC7/rihZrv4akCtx/8B2inqucuc7gy6D6zdJjf4GIJtplO6/TW?=
 =?us-ascii?Q?frvuitcPHWIeKRcMonfqvFaCJ99HZRkPKggvWJTAEIKgQBQWuDFgkfwDyHIe?=
 =?us-ascii?Q?fC6ZShwdCAAQJRDNLEgYF6FDl92P/LF6VWQjI/Ah/sq/cfQ+9YGzR9QfEalA?=
 =?us-ascii?Q?D4+5Tdq+jm6dT51V4z3W7W5qhRuzjVLNQr3pR033ZPQ4ZMFiTuKcASt3ufmW?=
 =?us-ascii?Q?ir2QOIyk0Ow8K3tSlpmrjcaKID2dw6brHUNlreEXpaSm7jE1HTqQhK5H8jJW?=
 =?us-ascii?Q?C0lygxYWwQ6uqN34AGiCrfzUpFX4JSwLM4rzyozoEx7bWfPjK3DA3HUpp5w0?=
 =?us-ascii?Q?UTFgvviIiTpWRDGpfggkmNZPIXquQ3CNqSqfUu9/zrdhQHf/WIYTovCuiIcN?=
 =?us-ascii?Q?GHpXtJA6XuSFOELlHHryZ4h0OblJXZku0eS9rJbWDrjrKoaLpKeyjoJSGeLu?=
 =?us-ascii?Q?rb2nZsQ5jRNw5Wa0Py88m0kWZ42HANyvQ+snFqQKB13IFBklNHgMNX4AKe42?=
 =?us-ascii?Q?s5uUZa+ij01JUzyHjWoztBHfubECwVVNYxLOWX/tRcYfiMgvSU2oyNXsjUVR?=
 =?us-ascii?Q?0hw5HBhgJRqwxTVDT/4mhAC4dd3YU2gN+IaO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(7053199007)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8r9LnrOHQab6nu31Ha2W8bYKCY8fhe8MCXpjVvntT7fYawXpe5weslEHee5S?=
 =?us-ascii?Q?JsPQH9oN/nNOdBV3QF2RmNFwqo22DWeS90Q75aMTaVH32snkjcbUBjjrsWsB?=
 =?us-ascii?Q?/Vbg4hM0JddHhb5v/8c7RweLKPvD37W/obw4bZ+S1lNKjzaLA2aBHCYXXRv6?=
 =?us-ascii?Q?87aihxvbqD8G7Kr6wIQHgK9z7zXb7U7eTfBzC0i1f0Mbks3IEnP/EiAU35Jy?=
 =?us-ascii?Q?JI9se902rYMviDwZlAr505BOw4nBcL5IFZet6Bed3UkEDFXbgmUj+tOzytR2?=
 =?us-ascii?Q?7kaJOkjOqseURf+PZMlosQq6K9jtNkhDPtSTEDP0zOGpJ/cjR2uLt+rN9Mmi?=
 =?us-ascii?Q?efjPbmXVR/M72m1P6wxoyKaScywf4kk6KPvwvA1JU7zVq1s1g1VDwrDdi71z?=
 =?us-ascii?Q?mH9u/BwA7CFd4wzMCUWtLwYlb1MXDD0VLl7Tm7NTjqVYm18SjaNeuqsZrDq9?=
 =?us-ascii?Q?qaaxJsV/1cUblRPFGO2qfn/Q+f+qwO+WMXDGN47dmRUX2vk5/wLpnYxHhuG2?=
 =?us-ascii?Q?jTRPvx32+VKJpnZjfyMF88XpKbxB1A+rEuMLQIb/+25N4qB0x71kfhTWCNk8?=
 =?us-ascii?Q?gpzCUsBKLalFFKlOY/ntlQFovyuyTZSKJ6MhNkfzNaa3a1M0kGj5hGlu//g5?=
 =?us-ascii?Q?8RXLJHlk53M2TPe5v95wToDGfBfkUzzs+XrTg4JxlHizUwDofl+/Sq8wEHLe?=
 =?us-ascii?Q?uqvZnjYk4WDNNSsu4oSS+iJK10D3aFL+bDdNTmbpq+Se49ThGMzjfK4EMeqp?=
 =?us-ascii?Q?/3NIaiivEIRu2oGW9gxgALeM9CQS3ulfV+4KCW5v9guiSx+2hRUqJBW4UK1A?=
 =?us-ascii?Q?jNTn0RMS5gi+U11rxbc2yacS8/OGxkbLp5g0hNyDLTw4xxYgKrM0z3cfQlqH?=
 =?us-ascii?Q?CR7PcJE2dS6OEYpZDTZCZ9/bVpxtkVlcfuq5tzHZKxE+0VDz6MX1FB26J8Q7?=
 =?us-ascii?Q?slquK/kjdX11WaINqZEJ7dPj3I6qo3NFjiI9fHX4sNH51faqGhTcwGysgxE7?=
 =?us-ascii?Q?No6cVaDUKDBZKharH4TWRNgN4Ivh/9j/sYCo2N+VDQbq8ZmYDeKLB/M+FgS5?=
 =?us-ascii?Q?tnMORL1CF6R/vuE6T9BCXx42/AWTl8FnqzYMWzjDXNHo4bwKsaSARz5jxNhO?=
 =?us-ascii?Q?FdulR1vc5ri3Bxr8goXuK0LIsQr5zpzeesKKGmdVYyNrS5yo4YCwAe8xAmNy?=
 =?us-ascii?Q?h0dF29pe6zQsP6oKu1AZFm1Fd8qzZH1IVrWQ2WJEsfGshsrFN4ou5rbdNVJw?=
 =?us-ascii?Q?7kWCQ0QZpCl2YIqzpra+d+3l7tDQCIX5N1T6PVc+MlXH/ombPCKP2fH9FTB7?=
 =?us-ascii?Q?pebSwMP51r/tohlD8u3marnM6bFAaQzogGzJHvaKLcum7Pw1R0+CSSup7c85?=
 =?us-ascii?Q?ZWNwSw+Fzr4rl9nOpCpWrV/diKZ0awsU10ugdQPgffGrByIpHjNm4n7Lxw5K?=
 =?us-ascii?Q?9naslMoxFXIpQEEvjuMxKH4rRDTsW/ta4Y0vxCbXTYijrgxrIAq4uMWtwBBC?=
 =?us-ascii?Q?lP3YUekMJZXaoYUfsHcfKWdTb5/TSxeCRnM6cAdCRoV0iSFLihiwf8rLSOq4?=
 =?us-ascii?Q?S2CDOR2nU3tpe+2ARBY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3661c1e3-92eb-4a0e-118a-08de25f24074
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:59:12.9556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjbMXj+7kQmFqQunVlsFI3cm7C8k1Tx750GGZ9U9OYu0Lx8s7VApCdd0dBhaWuxTEs4n/f3EdPkFacVJGvEfMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_075920_752372_E6A7CF53 
X-CRM114-Status: GOOD (  26.89  )
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

On Mon, Nov 17, 2025 at 01:36:36PM +0200, Adrian Hunter wrote:
> On 14/11/2025 22:09, Frank Li wrote:
> > On Fri, Nov 14, 2025 at 08:13:55PM +0200, Adrian Hunter wrote:
> >> Add support for Latency Tolerance Reporting (LTR) for Intel controllers.
> >>
> >> Implement PM ->set_latency_tolerance() callback to set LTR register values.
> >> Also expose LTR register values via debugfs.
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>
> >>
> >> Changes in V2:
> >>
> >> 	Make use of FIELD_PREP()
> >> 	Improve handling of values that exceed the maximum
> >>
> >>
> >>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 125 ++++++++++++++++++
> >>  1 file changed, 125 insertions(+)
> >>
> > ...
> >> +static void intel_ltr_expose(struct device *dev)
> >> +{
> >> +	dev->power.set_latency_tolerance = intel_ltr_set;
> >> +	dev_pm_qos_expose_latency_tolerance(dev);
> >> +}
> >> +
> >> +static void intel_ltr_hide(struct device *dev)
> >> +{
> >> +	dev_pm_qos_hide_latency_tolerance(dev);
> >> +	dev->power.set_latency_tolerance = NULL;
> >> +}
> >> +
> >> +static struct dentry *intel_actualize_debugfs_root(bool add)
> >> +{
> >> +	static struct dentry *debugfs_root;
> >> +	static DEFINE_MUTEX(lock);
> >> +	static int ref_cnt;
> >> +
> >> +	guard(mutex)(&lock);
> >> +
> >> +	ref_cnt += add ? 1 : -1;
> >> +
> >> +	if (ref_cnt) {
> >> +		if (IS_ERR_OR_NULL(debugfs_root))
> >> +			debugfs_root = debugfs_create_dir("intel_i3c", NULL);
> >
> > I think it'd better to create common "i3c" debugfs root. So your device
> > use debugfs_create_dir(dev_name(&hci->pci->dev), ...) under this common
> > root.
>
> The debugfs files are being created for the PCI device to contain PCI
> LTR information.  The i3c module has nothing to do with that.
>
> Also, currently, there is no module dependency between this PCI driver
> and i3c, but a dependency would be necessary to coordinate the creation
> and deletion of an 'i3c' debugfs directory.
>
> The extra complexity can't be justified.

Don't post new versin before we close open discussion. I see your post
patch before this message.

So, I think not necessary to create to root, which cause complex, (need
lock, and refer counter).

Frank

>
> >
> > ...
> >
> >> +
> >>  static const struct mipi_i3c_hci_pci_info intel_info = {
> >>  	.init = intel_i3c_init,
> >> +	.exit = intel_exit,
> >>  };
> >>
> >>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
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
