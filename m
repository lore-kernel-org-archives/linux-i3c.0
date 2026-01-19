Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0F8D29C40
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Jan 2026 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oT5sWnxyie2p+TRpvvqED4pdO6AQNVrAS7/Y3mF7HZs=; b=IV+JW/nZ/WP/9O
	qVYZl/pECr53txji/Wozs/pAoDcrOZJCbKpVgAi3oWL3yVZXgj44R+U+cM9hUFRgW5gUu/Ctr+1z7
	gfGJsu3IO6jY9cWkyZpo1tEpYq5WoRHe0Nkoo6pOvbCU2EYBCNAfyuPGPJisOOWk8aKR8tDBwTcV8
	dP/6bQCMM9un03uhPw9ClMvX6RB1FXtYBJuuqcy7k1q6cRzJNm4YNatLTmrdBa1I3E7lOus5etO7d
	EwFh5rihHpKqCR+KO7gS5cFeqwJSURKXrUrhTNht5HD+6KKwvOcIafgorhRxpbB2G0bgA8SpiIGNI
	9UYhsNv9esfUQFbQvNGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsBZ-00000002Vuk-0Y17;
	Mon, 19 Jan 2026 16:33:01 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsBW-00000002Vsm-2jFP
	for linux-i3c@lists.infradead.org;
	Mon, 19 Jan 2026 16:33:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcg8YJKNeeHkRkIfLFGwjR584SJJgDsGa2mDCIhYXYGjiALzKRCc8NakIVVz/a78j9dGDkf7K5MEBfP7d9cybMaubO3oXembXH4jX1yM9ARg8j5A0sU6aP1p/BWHLH703uh77+my1GB0kBO5ZBZJope9dVzGxLdjXOWNgaz2yLOfLjOt+c1V4yt8M1Z19s+HJ3SgZfh/mzhNBDkkjQDM5XTlsiFFFl+E7uEljsrFYKyLkKkYrYzevI52hPjkAKabj3PfaiYVRoGO5wuMUz+ifjAvSNIGo/DPAPAq2w5J8WAgUgoANCmQXRtsaGNtT8JlqYeQ6xqFFdUwUSagF/ytuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IQuqmLcB+vEYWEAkE3hmwfIGJhZAdiBs+pt6GCEA0M=;
 b=S8xHbdlJJagAAg6Jg7rnLH/CzRGzi/AWaBqCRnhh7g/F0L7B8A5rzdj2LWaNriWLQMSiJhSJCUcbRdj1k/mFXjCJBMs7xhlFe3xpfRph2k0bsYe4OQYqR8rsjo0d5nToA0N5wVMObuYHzu9yjlmcTYqVAxswX+V+yWIO/vUkeZrKhmx8F2SdrtkybIxahkljOAI0I6j8N6CFcMepKptMfsczsCVAVOX0iEgutDFOVBJR3IROGPlS35seUL/JzoEuRQurZUssWVxi+AYxKFOKUoRVIsd3nzTvaKRm407IbHwIJ96d7plnvdKB9SPHA5XVpnluVr/ga/gel0GO6ZnNjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IQuqmLcB+vEYWEAkE3hmwfIGJhZAdiBs+pt6GCEA0M=;
 b=E4mPlPrUcx8PY8MNdwlaDL4QDUrUKyuUF/kE60xf5WtpOstkvkm5EFCJPnXWWShFkQ7myddtGPypadAT7pt3qSNhvmAMD8Vw1XJ5K9Nu+XgxAqAezxcnqll68q3eT74wDQQmOA42lDeQeP9S5H5IHXObpA8VLdE7ccibTl7eipTwbAx6fyRpgj2ZLRuJ8kwV7RjGSuDiy8QKp/jnGHXZd+UfJROrSNfsTJCs7yEj2Y8gXoQRHvF6scZCdEGitektTuHNy/BPvC5nzQv9oHF3S4iEADsTBTWtRMsgym2+TJK8b5mtexxrps51uRlRWs/bTthru9hRipdiVkWblkrZkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by AS8PR04MB8200.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 16:32:54 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 16:32:53 +0000
Date: Mon, 19 Jan 2026 11:32:47 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 2/3] i3c: mipi-i3c-hci: Add optional System Suspend
 support
Message-ID: <aW5crzig4AEFV/kT@lizhi-Precision-Tower-5810>
References: <20260119100212.29607-1-adrian.hunter@intel.com>
 <20260119100212.29607-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260119100212.29607-3-adrian.hunter@intel.com>
X-ClientProxiedBy: BY5PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:180::36) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|AS8PR04MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ebb6ee-b879-41bd-e7d9-08de5778650a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|19092799006|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z0NkwiSORHVNpTVSrROxiMvbO1EWGsU7yA1uJv9DBYrwdYEh/sp1xu2fuaRM?=
 =?us-ascii?Q?o2tqCYpne8M5fwddVH94YYFhyEbtK+J+E1vZ22P6gfZedQjMPfr3UpNZvNQ9?=
 =?us-ascii?Q?tx1v2h6f2xFB7Y48SFOCiNkdHrgRYQZGcBdLX/DTCFht6RY2xPucz6icFspj?=
 =?us-ascii?Q?h/KiPK/hxYYP5j6sWGeLrflHCI2VnTgZmR0YdmqQJ5dtphZ48rIhXr5kDl7K?=
 =?us-ascii?Q?IdaEQ7KYGDFPfhuWEEGHkkM9jWH79t0bEu5Dqigo3UIUXK0UxUCfudwLSq47?=
 =?us-ascii?Q?L8fHVIKyX+mqJ5aMprxn/hh+26SdrNyeThObLelesn4Y5erVXfjVhM0ZqtFv?=
 =?us-ascii?Q?3zuVUUoXj9JpJ3CRWqhQl40AeuX9OFMkm5YFL9EOkabuJqUz0b+puBpE+MuM?=
 =?us-ascii?Q?FFadA8jRoRC7aaTbZosVrgAC1qN/8LoLgTyncICZi+wc1adlOqWkXSTsx64G?=
 =?us-ascii?Q?YH7/disw35PH+W+xts9aWSJAMQIVldpKILJFDHmxP5NVwcInMSDmDIvYqhDN?=
 =?us-ascii?Q?B+VbVaJi+XMFhbHmLIUYP/6ybPQ6Mml9dd/+Cgwh/4uMlspPDEjN0pdnbh+b?=
 =?us-ascii?Q?lfp20Uptja7HeXJsy/tI066G1SYXXYjNhxrQDGFuHQuKAVvHWFuWDkVirKTs?=
 =?us-ascii?Q?E5MWDKkfjQ6R8eiU1995xmIm/C5KbuEfZJlAKNI84XU5pz33aP7hDAfqvLkr?=
 =?us-ascii?Q?pSAiL4c38n966ZIcwFxvrZlAglaJrGwUuJED+ICiWBMK/QmdChQXxcSlmUhN?=
 =?us-ascii?Q?3RSsO5rRPfHgCZFZQo+778OZQaIgTlCIowEy5N5B2/Vlbt4HJuBn7Z9UQ8Eg?=
 =?us-ascii?Q?gIlGsSy6HdwUl/2p58Xwd77/as3VDyrxxZNBHsLQuBbkQEHXRkinNPGh8flj?=
 =?us-ascii?Q?d2HWzM85tLaYttZ0IDwfVy6EGJFGKRTScn6TYgAQfeyyObS2t80hqUZI+UTe?=
 =?us-ascii?Q?MQQ9pQSD8YyTjxUek7etyNrj8nii7s+qqaVbOy3SJRNhSZK4y0l4T+ICCnRv?=
 =?us-ascii?Q?Y2vapP2jVZyax5ALx+AZcr463ta70Vl5zJu0Rvnh7Ho3A73HxFiJvqMpaNiu?=
 =?us-ascii?Q?FJnUoVgOXPb7bMo/PNw1QwsN2lnIuQhtX6sWCaYO3/EoMwzs+ud139t2DHHC?=
 =?us-ascii?Q?JH2gOjOjGJO/BoXh8kZsWQG8w/n/GQfxe15ZFLOzH+/WiVIDf709MgN7H2lD?=
 =?us-ascii?Q?94SSQcBT2Yct/A86FPfVPUAfMAuG6E3T19ohSB29IEH1b8/ZHANllS3bjfVJ?=
 =?us-ascii?Q?IyAIFGLSZN9H4LSr5HfGBbpDzWsu1UoH3ZRzTCV4cLs+/QMRIzyfWNoHaXv5?=
 =?us-ascii?Q?q3r/ksSdw1W1p1dW+9g7NJoT1jIJzP0s8tqd2iUQYvGIDWCGVJmzu6QF3yqc?=
 =?us-ascii?Q?k3pN5/lgS1g43TZejY1p85toZEy5wr3mG1A7OUQ+bNrmRd5h1KAEgtXVP4fa?=
 =?us-ascii?Q?R3v5aFTtJCzveYBPC1HPdHkPNlobM9PpbVDZCpvpDLOtZlJR2TmRECs8/thI?=
 =?us-ascii?Q?9V0NpjItsixCMLqxRV9PNyO0OKuQH3jhYFf+H7lcRhSpPOouw0q7Uy8tT55+?=
 =?us-ascii?Q?Q9MHw801MRQfaEeknjh6T75VsrTnwoORTfR+p4CFcjAcIKGT1u1VnZ78O3rW?=
 =?us-ascii?Q?g6Oc2gOd/jWGFtHhg/0ONW8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sxFDQxsbpMTXEt4T14nKmgC+tUaSk/St1TjSqx0z9QeEe3JXsYOR5YQa2bNY?=
 =?us-ascii?Q?F0YlVRGbNCDK2UmGz57cnAs0ehIQiuhwu/OTzA2/rizb4fSaWwSyaruEx+vQ?=
 =?us-ascii?Q?wd8/3SHUjvxnVbVz8W6ZDNO1h97DmLMhYU8atCt+LXn+QgHqV6ApOpNoVYDW?=
 =?us-ascii?Q?aZ9n8uq0Argisbt5HOqlKP+zsZIqswKxRMRpW1g2WMV/bFRVHzwvmTMUlgS1?=
 =?us-ascii?Q?Zqffy7eWbSqHqq8/Nh2aLCBhk+qDbGowoNSVrJ609RudNuAQwwuGzxmZLwmU?=
 =?us-ascii?Q?wMOs9HgXFazyBUmbrjKNm7lhpmG+hD8akeSibFS/5b/GabV/E41izfgpKF0I?=
 =?us-ascii?Q?h1/ZiOI7INNC0vjk1UH2+nGkgWUYw5Jrn9u10wPR7SXE4K0Kn2WdfDOOj7AJ?=
 =?us-ascii?Q?tKgFFPELsPrKfD1KfeKEThB87JvxcIKT/bu9YAO3Xc3cUlg1wdExv31++hwQ?=
 =?us-ascii?Q?R1w7J7xVD/5MJK9og3AP1pApJQx73xVLolDswtj40M2vgEBN4ukywpQOdkAX?=
 =?us-ascii?Q?cszJKv10XmBV7s7Nv5QKXpp6b0MT3MmhKVbljav4CsQND+SQR4UV2wv6v18v?=
 =?us-ascii?Q?gi9m5bGtarAjoFJIK0U5SJlvkKShcO4cR1AepRkhjPGqw+bm2LAtK+nO6d97?=
 =?us-ascii?Q?vbHBfxW1C2rls3Nz5vjDvOGh+Ac1ldFmxcRtsRYgqoCJZMhR1PI6c/oT88kt?=
 =?us-ascii?Q?TSWbhvq2t039y4VE5ywUZztQ/vdS862aOHpWsg0VxNisDbKv3IaxAYu+Jex1?=
 =?us-ascii?Q?EN3/q8Z+mOQlxMHmyAuPDIx5r6fDdLsJooQTMz3FhVHDBrwJGbMcJvuMd1sX?=
 =?us-ascii?Q?zLxBXIOxHt4NufLN9tY5mCTvLhN6Lotwfku9xFGqo+4nAP8LOAicPLG1Xoii?=
 =?us-ascii?Q?U/2Q7ePrtg47alos9TTK/UljpBJjgAE+578n7QY3fhZru5b9NvywNHhp5vbq?=
 =?us-ascii?Q?AuSDpNBk75Xtw60f9/Kc60nzQPHZfudnVHKrLUnueYE+Wf3sJOOrqVicUMpw?=
 =?us-ascii?Q?S/NgM0ZpIzAp+HKpSn2quoRlWHzi5bzD+ehGBqaWbkHm0VkoKNU1MdUSDQr+?=
 =?us-ascii?Q?xCOVUaPkqWuArPR64XSxsS1o2VqmMWikl8rf6tPejzJPSlbGuyi3lQxG6cLk?=
 =?us-ascii?Q?++JEe+3Yzfb5oN7hR+UHOGqIY75zfNlV3k9BJtpGHxU19O1iv8Ql19tag835?=
 =?us-ascii?Q?eZNA/vrEQk1km+gxnlHgVGtaHQl7TcLokwDq33G3ibvtUkMYbjgJXOxK3MGj?=
 =?us-ascii?Q?SgvOVGjWBb+ZxFb4Ui66wGS0tfyEd0Ehat4o7pKuYvnQaZLBzqGvimgkwAB5?=
 =?us-ascii?Q?MVaYgiJOk5DNeImOcNJmBy+PwA27Lw/utiCAJne2FjT3TckyN7FRXIxSC3Ze?=
 =?us-ascii?Q?VnArvh6LRoSHLR+84FjsvGqoVS/kUdA+tYVYwUDPyRboPJGfjWvzvoQkObGO?=
 =?us-ascii?Q?vsmIE0YJ90WQAwe6dU0MDqqnkLs1+IHpcFoeNJI6Q4NqJ+umr3kUxbrYdkqz?=
 =?us-ascii?Q?E4xPUiwC7ymDqGodvaYNmFZ4Kx/vBhSRHHVYp1qbvkv8iUf7GNe1Z4MNAgOc?=
 =?us-ascii?Q?JgsPEaYXtByPd8RhSZw7468cuNmPD7ZSGJiqdo5KhyqZa1MpdfpUzw0gmnHK?=
 =?us-ascii?Q?oFcdLceP8xUcgrsO7F5dxcNq5yBmiiCsvi27FjhWdIy13jVAYVelG2WlGolH?=
 =?us-ascii?Q?2XjJJYpDGcnCGNzd5ttKmr3Zn7aDfaenpy+fWr3lsjvLDihC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ebb6ee-b879-41bd-e7d9-08de5778650a
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:32:53.8569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1cdv2Y3QzVLRnV3/nvVRYQEiZIFJCmRcvpUf/GFmGpjT5IxL6e8+iHcJ4BG5te0PdeBvy2+UcvZVsbYFYiHLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_083258_876457_36F58F48 
X-CRM114-Status: GOOD (  24.64  )
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

On Mon, Jan 19, 2026 at 12:02:11PM +0200, Adrian Hunter wrote:
> Add system suspend callbacks.  Implement them by forcing runtime PM.
> Consequently bail out if Runtime PM is not allowed.
>
> On resume from System Suspend (suspend to RAM), rerun Dynamic Address
> Assignment to restore addresses for devices that may have lost power.
>
> On resume from System Hibernation (suspend to disk), use the new
> i3c_master_do_daa_ext() helper with 'restore' set to true, which
> additionally handles the case where devices are assigned different dynamic
> addresses after a hibernation boot.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Helper function is now called i3c_master_do_daa_ext() and takes
> 	'restore' as an argument
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 49 ++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 02c5a133e329..ac8cfec1ff9e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -769,6 +769,49 @@ static int i3c_hci_runtime_resume(struct device *dev)
>  	return 0;
>  }
>
> +static int i3c_hci_suspend(struct device *dev)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +
> +	if (!(hci->quirks & HCI_QUIRK_RPM_ALLOWED))
> +		return 0;
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int i3c_hci_resume_common(struct device *dev, bool restore)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!(hci->quirks & HCI_QUIRK_RPM_ALLOWED))
> +		return 0;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = i3c_master_do_daa_ext(&hci->master, restore);
> +	if (ret)
> +		dev_err(dev, "Dynamic Address Assignment failed on resume, error %d\n", ret);
> +
> +	/*
> +	 * I3C devices may have retained their dynamic address anyway. Do not
> +	 * fail the resume because of DAA error.
> +	 */
> +	return 0;
> +}
> +
> +static int i3c_hci_resume(struct device *dev)
> +{
> +	return i3c_hci_resume_common(dev, false);
> +}
> +
> +static int i3c_hci_restore(struct device *dev)
> +{
> +	return i3c_hci_resume_common(dev, true);
> +}
> +
>  #define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
>
>  static void i3c_hci_rpm_enable(struct device *dev)
> @@ -945,6 +988,12 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
>  MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
>
>  static const struct dev_pm_ops i3c_hci_pm_ops = {
> +	.suspend  = pm_sleep_ptr(i3c_hci_suspend),
> +	.resume   = pm_sleep_ptr(i3c_hci_resume),
> +	.freeze   = pm_sleep_ptr(i3c_hci_suspend),
> +	.thaw     = pm_sleep_ptr(i3c_hci_resume),
> +	.poweroff = pm_sleep_ptr(i3c_hci_suspend),
> +	.restore  = pm_sleep_ptr(i3c_hci_restore),
>  	RUNTIME_PM_OPS(i3c_hci_runtime_suspend, i3c_hci_runtime_resume, NULL)
>  };
>
> --
> 2.51.0
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
