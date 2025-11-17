Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFC9CEACEF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlwlzEO+vc6m58+VrbgM838nx21fwWYHU/Viv+fhiEQ=; b=b442JG4dVv6AgB
	QppSgescprc9V0mOTZ2N3151B+nh36amxV9VUX9OEntacC90VjDzcxMkveqC6iw645PeeQ9BCw2h/
	2vyTnMbB0THRKGW5J5B0dYApEILnLMpwGdhOz64i9kJQ0JzODyO2Lu9eC02T5HOxp7reXmY+bAePi
	SrGHl68DOxFUj/s9mls46LSeuFW1r5r7k7SUoDZBUL/eCWVKd8U4igWVvgZFtO/RSn2b19SVPCCT5
	Vdmnfh/Dj/kU/q3PSiLdtgDJLicPzpK8n/BqfbDuSXz3u7gbxKUYTB4b64/EbVlO/qnjInii1vKo0
	TcBqfVJ01ygZm9t8kU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL50V-0000000GlXA-00s0;
	Mon, 17 Nov 2025 19:35:23 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL50R-0000000GlWN-3yNG
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 19:35:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWLyHD1+NDvQEAEMZnqjUVRTJg84kaW2gvL7k53WtFnhw6wp7GrGfqD5iCCAnhSM7LV2m1zB+dr8v7Irm44R8W+fWIWFXcsxLzoGFIMGPCBXI0nQdYSJ6nZQKbnxFKcNGQpera4hKktxYLdmORVTviCkfjo6bQY/Dho8O98KVKcJB8avuJikoVh5W4lY2s3tNmuSF7TLEYHA1f7XtZFQZOhYhTfiIm9q8zDYhrlM/rtcwI4YNOX+BDVEbVgliecXrYjK55qU0JyGGwmVDvpubZtv+a1lGx6CabKbJjvetT9ABatmGJHu4wdC0qlCqEta8XChFYgjWbyl89N8icwOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAj67uigw4kW8du01wCnTGMOT73eexqMsePNvZnL/2o=;
 b=iYkievyENcpgXNG24sXUGaO5kwrt03AwqpCqdR1/e6leuEG9B4Tp6M+0y6QgeoxzTu825cQtvS0r7A1zRI9sE9lmmXCmDrpnnRVsjtV+d9A57e7SajQj2GKEDW07bX3pAvpiE2EfTRXoiG7bzM43exq7hMK/nKfd1kOGqUITXPKAC9keTya6eHNN97Ce4bZi1Ymwn/xaViEEkyUE/mB+k7A6TQQxZa65UcGyNyjnHUE3Zzqj8isp8T6y6lXFn8ZGVvx42ssSAXopHSpsvZ2XcnA3pViC0xDjpcJqxLLD+LwphuigM/VMYCfwkzSPD5ojllqVZGs0vIyTSeC5Jdfr6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAj67uigw4kW8du01wCnTGMOT73eexqMsePNvZnL/2o=;
 b=CLUMSXtoelhqQnWQnjvacJ0nqcJCmdSLrrqytpFW/kj5CGS1nQxVApDqRWFs4tDG2iQ8lZPY8LaRXeRCZSNG1cv9jiwyERNP/I3OrS/YTPz6lAWEMJnYMtIuTIDsDUZ+73HyL6i5VGrcOevXV1KFixL6vESh1c9fxqYeZo8VV5NtxCEW4+zv3w72r9pEd4LBEsgzAuomAjQqbyMJbLf8JgyNQ9DQwoJGsNywqDiIiMn4MXZ9NFDdkWMc4cBjpGYW45JKL6jVIPEA9IlHi5l3clNqA2n1huPiWbRxp8EDtzDfEuwkGDuBoJIcKwubVT+4XEjMlwSZJ306gE1Mivvrug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GV1PR04MB10427.eurprd04.prod.outlook.com (2603:10a6:150:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 19:35:13 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 19:35:13 +0000
Date: Mon, 17 Nov 2025 14:35:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 12/13] i3c: mipi-i3c-hci-pci: Add LTR support for
 Intel controllers
Message-ID: <aRt46nztIkIAC28I@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-13-adrian.hunter@intel.com>
 <aReMbhYuSCT5RNnX@lizhi-Precision-Tower-5810>
 <e8d64938-9e9f-4899-bc37-dd78f02adc78@intel.com>
 <aRtGSstGcooM6mCs@lizhi-Precision-Tower-5810>
 <a5528063-176a-4646-ba0e-19d663b6ff7c@intel.com>
 <aRthVIuxnJHBEe/a@lizhi-Precision-Tower-5810>
 <387c55f3-1ea7-43e8-aabd-1ff320a99eae@intel.com>
 <aRtv9G3tD5D7EcjP@lizhi-Precision-Tower-5810>
 <9b060456-cbb9-40d0-b2d0-a52d1f08addb@intel.com>
Content-Disposition: inline
In-Reply-To: <9b060456-cbb9-40d0-b2d0-a52d1f08addb@intel.com>
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GV1PR04MB10427:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aadb04a-6e52-4b7e-1e25-08de26106da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CAWYnLdWsNx+gFR4FWZIQy1wtXWO0R/593rXjwq7/UOLvAHXUzRjk9/dxaYN?=
 =?us-ascii?Q?su3HyPAAJsfuBUceABe4bDCMcoMQ/no9tYDT4/POOLN96xn0PY0kmWSqOQd+?=
 =?us-ascii?Q?3o6qRtWpCjXlUSVIoXDOvoOB1MuOxprqu3jtW7weeao05RQOwhU1IQ3E1T7z?=
 =?us-ascii?Q?1qkp4supQAEniU4RWzHpklZ5BemEC8PPAYjT34O5UmSPtn2wIz9d2kCIYyzi?=
 =?us-ascii?Q?cWIZ/9sM7BgDHlnZkG4muZVqb3FWkAtSVmJ8FOkHqo3UK3kvEUHgrcBzMKQg?=
 =?us-ascii?Q?67GUVsK5f6mWWRB6KO/MlJLg43H0JnhTv/Q850FEnYIasNpwWJocLcLmr3sS?=
 =?us-ascii?Q?AmqWgGIxJRbAypqZ7RCukFMkAkUgVFfFIOuEuboN/UYJNcaQ5PQzcTnIOJmT?=
 =?us-ascii?Q?JewoH0ZUAQVHCHijxrmNBffgkJO6fGc/uT1wYLO+dZQ2692GwZqoHpBlcSd8?=
 =?us-ascii?Q?rxkC38aTqv4jxfl/XOUF+Q8JNpciY9eETP7Z7N0iipcn14GUO9yR/20Lv8pb?=
 =?us-ascii?Q?D4M/OVgtZ83TrasCEe1zayC8MT4BgknpK58JA1bgh/xNhQh9NY1sZLo/hxz8?=
 =?us-ascii?Q?sI3k1RDlfgIc15v22g7BLQWug01QHFLXJIuvvRQNobMuM4yO/gm58qZjYpGR?=
 =?us-ascii?Q?w2WOEDMTaFOYyvtCHTmJ6VGGmejVQQ3hjhwbHhvQ9lYiWfoW5qGkxFiu1eoz?=
 =?us-ascii?Q?jyZbTqf2xLZ5ZTfH5zoifpIjutr+DR+Jl4z4zWyGNZg4dpzwILzQU8QLHLV2?=
 =?us-ascii?Q?bGzFhsXPJQdkm3jtBtJGovc6LDduxF0aGysayBr8rq5qlchNfjYeJ2oLFi72?=
 =?us-ascii?Q?IgA5XKBTnDjLysDf/FxvaMZ3HFlx09MaBFGv1WrHPpjngSL6Hvv4wi2D3M74?=
 =?us-ascii?Q?eEb0pB+EgRhsqorAyZHNJH+2EK+jpzOwSHKWyfiDLaXOvG77iXYqguDAXJjy?=
 =?us-ascii?Q?OxVgQfz/URubepbGwMDS9pP2Vp0aH3MGzFx3VYZ1DbMXVElU1SnfdiNhRjAE?=
 =?us-ascii?Q?T/6BNSfUdYjtoVMlfgGaxCuQD//Li+GhBkTUNqpJm9tPMS024y1pgQSPxF6b?=
 =?us-ascii?Q?ZvxvUswZ4HNhNsSzU2xqeLubo0QotQgHKm3RO5Zv7hI0MO05x9RwADULrp0V?=
 =?us-ascii?Q?EM4tVhQ3sRX4jWjpBfapQ5ynIv0KQajS1GdT7t97F69JQVddEyih/8nuJndW?=
 =?us-ascii?Q?7qBVCAjcg5mTIGn5bBFPC7bZig1P2S/Ndmdz0/mK1r/KzbEjybCRYTgpuKrw?=
 =?us-ascii?Q?s1uO2G/YKUhEJX41vrbDBWPJgYHq9xyWvvPeNWC4ACIj02EKB1LR3C271xvn?=
 =?us-ascii?Q?SyrIALdaS2PYPQqpvs/w/iQvRxtPxh5gqvITKbhlOJiVc8ffW2kX1E3XWnw2?=
 =?us-ascii?Q?E98Gb3WolKxsS8qYIoVUf89Zxvk8cGqZPsly0zh6zbc0oTyqCSCtJNw9CCw1?=
 =?us-ascii?Q?6Wqc5JALtKeE8a8hOvnG0jHBj0LPj8ys9up8NZOWnwCPmNsuNWDd44OGVaOM?=
 =?us-ascii?Q?bhDBkFZfSDy+czoKUSp6pQhmevRT5E4PZErK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DXeGQKZzS1nX24+PFWySJXHbY1yPGkar84jmhZitKRpk8VmEYn3ud/zc4ioX?=
 =?us-ascii?Q?H5kf7f3PHB8KAsgHrLKp1PZG/FcEL04ARefI646ibAJoheLK0R9mbtUzvbuU?=
 =?us-ascii?Q?DdyKWag0aMHazQJaL2VPDE6qhAOBFr3AnzL7bb3Meo89JFL1wDugi7xD8ReS?=
 =?us-ascii?Q?YRrmkTo9IPEmczezfQIxVhaUwDJpDvehJis7aBb6FwxCWykSP0WsNjvOB6Gl?=
 =?us-ascii?Q?QRSX3IWVA6DID0QwIHVVFR99355RS5dyDgc9QkCzL1owukEMww+t3BNmZQyK?=
 =?us-ascii?Q?oTf9YrURmZzlKHu4qoIr4a1m4GY7AKnLQRSFFwc5MYelnrX1TkQoe9CePZR9?=
 =?us-ascii?Q?XGZgzFg6mAlYNsbf2V6Z14VD7lYipNZM6Cdyd1mzh3FGEoHd1uA8ckKu95ca?=
 =?us-ascii?Q?wHM3nix5Ruq+7H1nAPiyp7e1cdffnpFoVuAn/oX5QzrJ2QzqQUbz2SsEJ8JM?=
 =?us-ascii?Q?E7ApA3ECMYL+GupEuD4N/RuOsEKPbEzR6yPBU4lOkoEm+ommc4qQsvOfxYmy?=
 =?us-ascii?Q?C8LBQAJ4mXuhOlOR2l7LjAXTnY92eLqkhOy1S19WWrKOLzxk0SB60pO7pybJ?=
 =?us-ascii?Q?PSTOUSDH9CK0/sUWBpqZsDSZsaMSid/TvI0yjvUBG+5SO7FyqVsYoEFo7j7j?=
 =?us-ascii?Q?zQr/smW9wUPGKrrJtoZP/UtEMHfrkCHFf8Gw6cOlLI+mTInvqfr1ml9Q+0Z5?=
 =?us-ascii?Q?p3xsAYral0IV+jNApOMszHr6FU2AdhW+ndc9FimBpJYo02sCt0qJjNNds38F?=
 =?us-ascii?Q?uh8pC5QRfD6aed5cl4YBOLecrURtBUf1mSW4ERdrrm8uSyICWsHrW2QXVj9I?=
 =?us-ascii?Q?yarFs0dOZsyCPAE2yDz2k72HuzTEnRI5v2toWuFvjtO4jWebmfhxPo46wJf+?=
 =?us-ascii?Q?BkZMu6Lf2t/aGkKdafMcPyC+rz/eYo6Pbpw0iAmbvn239Jcw5+BDSl2g0TTE?=
 =?us-ascii?Q?1SN1vdrqHJJCCv9DWgqmm2BczaJns9dra7EE2OsWMrXix9bb7HeZuU3pJD+G?=
 =?us-ascii?Q?FkBR6BdLS1Qmsuzunb6L9MeitFdxglyxkwmdu24V/PDpZjvAysWrRbHxhKw4?=
 =?us-ascii?Q?TuBF6xhgqvn1Ogqx+u8HaCiJC2eOzVApB67u1Rljuk8uVwrAwu7Ig25xWmTD?=
 =?us-ascii?Q?8hGIMVPLEZuIy3kP9lvuJWzR/WfZVceMpLwW1BF5+K4qb79lPlNRoWIMGK6v?=
 =?us-ascii?Q?VTuoQJwTJAziAlqB7TmYq3ipDqw7WbR8MbrNW0/bRKIcP27BL+3XTbZItUYi?=
 =?us-ascii?Q?2dZXY98yvJzLluoBFEU7l91YzZICSUznIC/ZSySYm282ZgENlY80O4veKfXu?=
 =?us-ascii?Q?z9o+LPE1yjn3Vhk/FMO3rrDJ9mjHXEHrIQDUjS/oDmKoI+IGYBeZ75U598o1?=
 =?us-ascii?Q?L4Uj6mwi6tBEzLWfnLbSZ/BvdmKI5tRZXkJHZphz3FBjfvbh3PhCEr7704U+?=
 =?us-ascii?Q?TxGfL/U2GEP6btRScJnohIm5P0v+1m3P52YDRYo4nM/cKw654UgKPNN4uW8y?=
 =?us-ascii?Q?q2uml+xjLVrbw93F8RJaYDyHqBtynZM8lIxpmsloPvXcdZSC0jt7tVBqfqDY?=
 =?us-ascii?Q?5FRhCj2L3flD7KjhmcOwYXSy+OKqMS3DFIsV9Q7g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aadb04a-6e52-4b7e-1e25-08de26106da5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 19:35:13.5334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12pAmzFrugSZ566DnJg09+AJyVeavuC/LDgu9Zrp+RnUDFwI9gr9cellIyyM8UHiImUVxpbgMjhcRB3Gq7gBng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10427
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_113519_993139_0AFD1E0B 
X-CRM114-Status: GOOD (  34.32  )
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

On Mon, Nov 17, 2025 at 09:07:05PM +0200, Adrian Hunter wrote:
> On 17/11/2025 20:56, Frank Li wrote:
> > On Mon, Nov 17, 2025 at 08:09:41PM +0200, Adrian Hunter wrote:
> >> On 17/11/2025 19:54, Frank Li wrote:
> >>> On Mon, Nov 17, 2025 at 07:47:05PM +0200, Adrian Hunter wrote:
> >>>> On 17/11/2025 17:59, Frank Li wrote:
> >>>>> On Mon, Nov 17, 2025 at 01:36:36PM +0200, Adrian Hunter wrote:
> >>>>>> On 14/11/2025 22:09, Frank Li wrote:
> >>>>>>> On Fri, Nov 14, 2025 at 08:13:55PM +0200, Adrian Hunter wrote:
> >>>>>>>> Add support for Latency Tolerance Reporting (LTR) for Intel controllers.
> >>>>>>>>
> >>>>>>>> Implement PM ->set_latency_tolerance() callback to set LTR register values.
> >>>>>>>> Also expose LTR register values via debugfs.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >>>>>>>> ---
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> Changes in V2:
> >>>>>>>>
> >>>>>>>> 	Make use of FIELD_PREP()
> >>>>>>>> 	Improve handling of values that exceed the maximum
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 125 ++++++++++++++++++
> >>>>>>>>  1 file changed, 125 insertions(+)
> >>>>>>>>
> >>>>>>> ...
> >>>>>>>> +static void intel_ltr_expose(struct device *dev)
> >>>>>>>> +{
> >>>>>>>> +	dev->power.set_latency_tolerance = intel_ltr_set;
> >>>>>>>> +	dev_pm_qos_expose_latency_tolerance(dev);
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>> +static void intel_ltr_hide(struct device *dev)
> >>>>>>>> +{
> >>>>>>>> +	dev_pm_qos_hide_latency_tolerance(dev);
> >>>>>>>> +	dev->power.set_latency_tolerance = NULL;
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>> +static struct dentry *intel_actualize_debugfs_root(bool add)
> >>>>>>>> +{
> >>>>>>>> +	static struct dentry *debugfs_root;
> >>>>>>>> +	static DEFINE_MUTEX(lock);
> >>>>>>>> +	static int ref_cnt;
> >>>>>>>> +
> >>>>>>>> +	guard(mutex)(&lock);
> >>>>>>>> +
> >>>>>>>> +	ref_cnt += add ? 1 : -1;
> >>>>>>>> +
> >>>>>>>> +	if (ref_cnt) {
> >>>>>>>> +		if (IS_ERR_OR_NULL(debugfs_root))
> >>>>>>>> +			debugfs_root = debugfs_create_dir("intel_i3c", NULL);
> >>>>>>>
> >>>>>>> I think it'd better to create common "i3c" debugfs root. So your device
> >>>>>>> use debugfs_create_dir(dev_name(&hci->pci->dev), ...) under this common
> >>>>>>> root.
> >>>>>>
> >>>>>> The debugfs files are being created for the PCI device to contain PCI
> >>>>>> LTR information.  The i3c module has nothing to do with that.
> >>>>>>
> >>>>>> Also, currently, there is no module dependency between this PCI driver
> >>>>>> and i3c, but a dependency would be necessary to coordinate the creation
> >>>>>> and deletion of an 'i3c' debugfs directory.
> >>>>>>
> >>>>>> The extra complexity can't be justified.
> >>>>>
> >>>>> Don't post new versin before we close open discussion. I see your post
> >>>>> patch before this message.
> >>>>
> >>>> Sorry, but it is late in the release cycle, and it saves time when we
> >>>> are in different time zones.
> >>>>
> >>>>>
> >>>>> So, I think not necessary to create to root, which cause complex, (need
> >>>>> lock, and refer counter).
> >>>>
> >>>> So you are OK with V3?
> >>>
> >>> In v3, still create "intel_i3c" root dir, how about direct create dev
> >>> under root
> >>>
> >>> 	debugfs_create_dir(dev_name(&hci->pci->dev), NULL);
> >>>
> >>> to reduce unneccesary complex, (like mutex lock and ref counter).
> >>
> >> Could do.  I added intel_i3c to match intel_lpss which is also
> >> PCI devices with LTR e.g.
> >
> > You can use similar method to create root at module_init.
> >
> > static int __init intel_lpss_init(void)
> > {
> >         intel_lpss_debugfs = debugfs_create_dir("intel_lpss", NULL);
> >         return 0;
> > }
> > module_init(intel_lpss_init);
>
> mipi-i3c-hci-pci is not an Intel driver.  It can be used for any
> PCI device that supports MIPI I3C.
>
> At module init, the driver does not know whether there are any
> Intel PCI devices, so it does not know whether to create "intel_i3c".
> Nor does it know whether other (non-Intel) devices need debugfs.
>
> It would be preferable to use either the current approach, or as
> you already suggested debugfs_create_dir(dev_name(&hci->pci->dev), NULL)

Okay use Debugfs_create_dir(dev_name(&hci->pci->dev), NULL).

Frank

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
