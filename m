Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21724C5CFDB
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Aug 2026 20:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcL2hVK27s8RsKzSrPA6HZ3bEHyf1rwfFV6TFTRcFyg=; b=qmvdyGIZDzXYIf
	+2Pqm/z++3N/I/UmBt4DqAhj6C+7L2tpzCQ1gVM+HRjElJas3gPT4ihpn8zCaQPA4SGjx7+8Vyi0r
	IxdMFsbE+9GrM2h2j7mOxsCse4csSkSRWNgq8jdg8NLUPQTNX9N1J0Ap3GQ21qkO1g5PrIlJmsJ2I
	8YygGfKU8i/8x/uglxs+Nc9X15vHxnEvCsYLhbDHZFYtJQu1MgnHKmUvsbHDinh572dztI2RBwcva
	aJdmJUeO/F0CVM3I8sPHa3i6z6MCkoKU3rdov1bp+2bHeWGf7jA0D0DT23uXlYp+9P7N8lhbKJG8z
	K1BW8TN4h5hY0yzf4Vkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucCc-00000001WHy-3DAb;
	Thu, 13 Aug 2026 20:39:02 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucCa-00000001WGq-3DDu
	for linux-i3c@lists.infradead.org;
	Thu, 13 Aug 2026 20:39:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZtZZOM2VQiAJN3jvb182b6aONgBK5h+l1as5g7ZGQB6Lkwsm/5PSelFf5+vC25E017O/Lc8ePegPEiNywedbGg6NOKe3vqU0xlVF/JBOze2/aSoIBFPAfW91mvxEbA6LeN+31jQitDAG6M/Cd/kdlSuDF8qB4840WGpyMq01BouTuDYPAicuqo0nqf2zoDutvWfcVVZI7P+KUjHtcFln4vKqkShs7D7og1ohRYl10rljzf52Z4PTsZixSG+p4rz3DHDW43VVVcfxRYfPgHpCOisVDk8/SOovgljHhGoyf+NxG/eNp1OWvLdmN/o2lbXpQcqdtgFrALZ0RfPjXdtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGwy/UTFBeRuVeX9boDt4XC6gD+2AunZEpaAz2Ccaks=;
 b=vZVHhVxTZjKx+FmKrrDb07NAOVa8LYE7lPv2j+gkdbMdDUgKCb/phsh9ps5NnfsrcE9CTmJcoHQflPDD3xTniy7ZsX7dwCKLhIbir0hkiNlejybuSb+szVDwto+/URUXrLN6o7s4LvN1KdqJNLI4LKJxnEMnj+RvUp+MdgkW+bCvS3jRsE/2ZYIsB/fwxLMgH/8nYVpNluGeHnBF/zPj/nq6hwriwx9rV+Zon2ivHmV22hzRu6p75cb74Pt8h87J4EFV0VO7s+a+oIGPCUohWJPw6AzhBkLeFNO+Lv4zJk27RFd2OvlvCskJHPi4OCUbkDMU5g6s9tZt/oHeQB69YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGwy/UTFBeRuVeX9boDt4XC6gD+2AunZEpaAz2Ccaks=;
 b=EU5GZorpcCa3yT7fSCwUbUZB84FubgTfrZAfuYrTSwe//dv8aDF4bVc9AS9A5AOQi/pzLY/JFT7ESY/odNzICV/zzZw0Ex5Y5s9TgSkSyGccl2LfV/WOzEThRA+P7WDAnuhqlKH88OKx4aaRC85LWffR95K8WJaKkuf/NKafKEBzN7sJ2f0JKLRFZMmXlbO8nDgbCIuTZNa0NW82MRw5O3DIwj+3BFTLxxFn9RiIEYEj4LlGvuqz2i/pNMEbIqjX8l52/uv2uz5O+BeIgpjVD5CEud7hqHSrp20Bq7Abz/0lhztNa135r11HraG+z+xRYg2S+kVhd630a2Q1pXZcvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7048.eurprd04.prod.outlook.com (2603:10a6:20b:11a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 20:38:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 20:38:40 +0000
Date: Thu, 13 Aug 2026 16:38:32 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: make struct dw_i3c_cmd smaller
Message-ID: <an4rSDgJtDvudtmY@lizhi-Precision-Tower-5810>
References: <20260813044603.22425-1-jszhang@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260813044603.22425-1-jszhang@kernel.org>
X-ClientProxiedBy: PH7P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed0f8d5-2481-4ec3-0aa9-08def97adb97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: KtYw9lswMwI5WQcBnBkdtMUEfDWgVCINU6E1eSnKf5IYyW0oso+jtXqi+AHed681/tCaGMt/glXKg1/H+yAS3vRzQPXgDvesjrDvh/21VfoYmtSD65GrlsfaxslhHsMpRM1OzhmyWUFhIw88FN7QcNuwT9vxkru4rEvN0Eza3h9O02i993KAWd6UpTEoFNtpr5B/0m2jCjvGJEg6hlniZ9b0K5X0PQxQfBwyX77nAK6D0GwOJwbvVnlc916aX9nkFe4Wy2w2mHxwuDWD97VdLdPsiHWXiU1HWehOyuQF8HjKGCy0Gq2W0CVazGsxbkQQ45pGH7PSuGxqmiBHL3dYdv2tEB5NclRGoQFd89Yw+ILEqbv4Sn3tsJ7bnsj2URRtdL0L52o3JkGTeqa+PX2Jd02BLAoeKboVcoQD9ClvTEyN/0//1FW4VMYPl/RkeEM3xVGZXt7A/nJhugHTYKDnuWli7Y/W/CAjWVqiKhzZIPqVfQtYIhswj36vOgaWunA3EgG7hO1EQIXCUubKJR/HEJhrvDkdbNQkC8l/6l3KsvCYtX59tEQGJsNahIURv9kIZE9Jvp6tXnG3aRRdLqJ9XzTYe9eXKOJcKJn5L1ROoNKu2QM5ScRX3+9wD5hM+IJthzLgKvJAw7qXi0gQC3bWhPVu8AeiSbkUtb8h9S75OEI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xLzaojMa/ikj2YSnO4kaVpwdHMRk9nRHHbqjSpItvAeogY4cntY+dG3/3sW6?=
 =?us-ascii?Q?z/YUzLUPFXhoYHOo8N/A1RXjJyYFL4gNTWpUqN1/qntZ+xiVyzsX26/FNZZ5?=
 =?us-ascii?Q?7qQEVvv0ldSAgaxHLaou+JbOSM8nJDE6pKTlDKta/Q+ofccpuvdJCPGF6QVk?=
 =?us-ascii?Q?/HnSL2f7fFOcn+5E7og3DYuxpxd/71+z81JksPnmfI61cf18R0oX9NKLCnZE?=
 =?us-ascii?Q?4mvMDUqF2yheFO7LFvJ7c8I8GZ8g6QsUEm9AvWXenKhTWTQrzhUyhagEj0G6?=
 =?us-ascii?Q?nENagahKBHrTQGo8Eqlod2kXfI8TKSmKBqlLRZQzrA/lEPqyqP91nlxD6/yO?=
 =?us-ascii?Q?6I5Cl1EWBPWjDs9IUeTuKVe9uNV2rOxgc0Q9EL+wla0m3Pw8GOzIBPpcR761?=
 =?us-ascii?Q?9DrcwgK/Os5V/B8ovgtyIlq/5POIfqJReINklPHcdnE51w/HuxvjwyuP8gDV?=
 =?us-ascii?Q?4z2gzjNeASHJEQK6AElCjxVxsvbMIrYWD3xUmhlXjOKEe07j6sSRK/WebGvx?=
 =?us-ascii?Q?rT9WIsOaEU7PXI7HWjZ0xa+i6btKDXqGwMwgI55gXlI8bk59e0Jrpcl4TqYG?=
 =?us-ascii?Q?dFOfAUuI9kcqCZdQT9IQ1JbMi6jwhXQSwkrANES/G+hzW31i/+g2eG0Rd5i3?=
 =?us-ascii?Q?NgDE88A8hvI9pzy89lWR7KJrTKRBbLHAagZmyj1QpstP432FEMYSEin6QNiP?=
 =?us-ascii?Q?1YMCD8Xt8qkyfwbA8CpRAT+sJXuwMHMPWsqy6PWPRWcTfQbZt05jj1hiKzGC?=
 =?us-ascii?Q?+4N0ZiYhyw16iTKj99/JTCj6f3vcZpBW6EhB1622o4yya6ove9noNazd2d/E?=
 =?us-ascii?Q?Tu2I6DcFz985Px1SbK9538SXcdN0AxWZkdUgA+7P+4Pr7cyP8hGdlTgrucY7?=
 =?us-ascii?Q?H+G6eUfBIOVSSCYdCiILa9sledklxBu9VS06dTZyoxFFgEHxrbc69kW1pm49?=
 =?us-ascii?Q?zd/G43E4dA2yji/Z+w2Hjr9W+h++RBhnZmH7iNo5XyqpGOoBxxQTY8snEVaG?=
 =?us-ascii?Q?fYd1ZVFwg/fksC2iDHA+zl9s9QLdkxKsEoTrfDxavom+VvK6I4K/Q8vutPjI?=
 =?us-ascii?Q?TzwRweVf7J7ScaqvF70WQ0N4W1Sh71ao8kiSW4CL23ccrMNcBOYINjMdS/yT?=
 =?us-ascii?Q?/yw2w8jpU+fVDDLfuD+8przqJBo0p62eqFK1anSy3vZn4My0qQMh26vwO6Cs?=
 =?us-ascii?Q?jyrtwzO/qAuucR/pSrk2W3QLRnbtqFfs0nabe59WQdwHMVVv4FMFu0ZaRkE7?=
 =?us-ascii?Q?Lxe13z4yDcw3TkJYsGiQBdjTD4lKi4zD079EzaiRhYJBUzcIxbicjA6o84nH?=
 =?us-ascii?Q?xvJQCtd9NmfTiXCVCkrWkp9DjFepwrDmq4k15nk9Q1EpiZmAD0c7dZ+btYmx?=
 =?us-ascii?Q?EbfJXv/grYFzTTeuGfta0JCup4BbOJTO+qWe9nVRre5HshEqdHDv/BZjonE8?=
 =?us-ascii?Q?xzYdHzC5tN6Y6LF9PQC/1ii/cyoOotZ0m1rzkZR2wTEZ00LNcPIdpGfqadr6?=
 =?us-ascii?Q?s0eKx2eP+gDYEAQgH5wM2WqR4+1go6Fw0eSooXunr+GZB9njtYzAsW0chlIs?=
 =?us-ascii?Q?CPK+p8aQ1j691pfUXcad897QjlVV9IXxsb55OQWDxNVTY4Q5JrsF7cP4y5Ok?=
 =?us-ascii?Q?OWcAtDx8qTeJhKPJso4ORcZyh1TotkQMGOt1NdIGptpSO0phI31FtLdczTnr?=
 =?us-ascii?Q?mkIamP5VIs3aiYuU8EZe++7N1040CK+9v3y5wbk0wKqYQwtUMou8rnGHJbr8?=
 =?us-ascii?Q?HloOtmuBmBOn5ppo4dvPUmPQcaZuqYB7/3PBAHfQzk1s3A6/QDiX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed0f8d5-2481-4ec3-0aa9-08def97adb97
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 20:38:40.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTRCil2mgEro12FcLqtosI6MjQ+gny2g5/At8FKlzUd8/Kw/h3SNITmha0yhA8tHvuFsoWwmF/9ioB5McF+isoziGpa3ABQo6yzxHDi+FJbc+j3HuJhlw4EYaPdTAQcJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_133900_807066_785ADE87 
X-CRM114-Status: GOOD (  14.61  )
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

On Thu, Aug 13, 2026 at 12:46:03PM +0800, Jisheng Zhang wrote:
> The dw_i3c_cmd is dynamically allocated, make it smaller. For example
> on 64bit platforms, we reduce the size from 48 bytes to 32 bytes.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 6ba84a97765f..d6f84f0f4c2d 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -247,10 +247,10 @@ struct dw_i3c_cmd {
>  	u32 cmd_lo;
>  	u32 cmd_hi;
>  	u16 tx_len;
> -	const void *tx_buf;
>  	u16 rx_len;

only switch rx_len and tx_buf should be enough. otherwise there are data
pad after u8 error.

Frank

> -	void *rx_buf;
>  	u8 error;
> +	const void *tx_buf;
> +	void *rx_buf;
>  };
>
>  struct dw_i3c_xfer {
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
