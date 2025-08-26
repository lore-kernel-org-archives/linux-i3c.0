Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7CACA0FE7
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Aug 2025 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3qPVew0pl9JolHmcj+ay7b4/ZxbNLF0oO9fq0EjaUQ=; b=KtNH9CKRxdtxSI
	cSdXnG/7i87kupftIlegcrsYLPvRQZhk1JMgn5+0wEk0cESLZiDNQLIVVCkMu2Xse1id3iAhuE5h/
	bCAzpCnQD7h4ETBP++knqXe4dO/tsd71tS9WFdDvm8Uy+K2ZbB4jsBvOfVuOUUtErt5s9ZS7ODupI
	ilezvdQ33gSOVK5k1hJxyYISLlJpCGXySp5K4leQ+h3KBhr4g+alAWhD+1XoFn6bXhZC5fnGCGgvh
	7bTlZSeVpHIYKJOWU1sdemYIld2M4EiRs3dnTmHsrfkLVRBIMHlWdefhTOC9skDkLHJH99Y59ncK3
	dO8SM+TUBkCTnJJQZsmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwMp-0000000Cc9b-3LeC;
	Tue, 26 Aug 2025 16:17:51 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwMm-0000000Cc8W-3wYX
	for linux-i3c@lists.infradead.org;
	Tue, 26 Aug 2025 16:17:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0GGbF46+XsH25D2ux0A8FQaqvvQjedLMoEPEgqDr4cpBqTO7eHIe7PO9AsZe35P6EX2wMyEp6d+y8epBHekq6IF1+fTCLOocFeSGY7OP3Wo78KMcgm/ldossguuDfojhNE5rFwDeYWm+FGXHZQoBVNZ1o/J4drargeDCEKarRHratXeGOFEylom7EYtxOnjbsC2eAcJWTNoON3qJiRq52FJQsnhwnP2xjd5c2SoOPhJY96Z1z++N2vkquASpk7h4wZJw5wthL0RsnRpkrVN8z03n1zkKBhXERvxWvRGi/HU1Y2WohEArwBdMI1IJYmPYiX6pxaovXL4YtxQPIJ1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXTK1nEJU6twu8PtwOVereJ9GXqjbfaGLRGYnh5C01A=;
 b=Fexu8x6fhSxFW4bme6QJ8xI0X/OvrgEfcPugxFbfTvDdp9b20eOdPMKpvKQmLEoCw03VteAfiY2tTfam3K9IRU206v9N7+BBvUnUgRR8tKmg1jVDtCegNg6WOx8l1+8XxnV1yBGYjzFEMda4tYsVXSvscIlrRkDl5+jdFXFpLAOM7QxigFIgp9lMmPZiTStzi+xSPkrodONamRp0OoDAiXhIaXh3k+dY3YCfCpJQr/6ozn6zL9B192avyZ41jCe8u4k1zJBytV+ouCR/5nJINSG1p9CMS0CRN7XRM8FXbCh5DdCvvdS424JqnfLrkuBxfqpFR3iXpGqGxdqWixrfmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXTK1nEJU6twu8PtwOVereJ9GXqjbfaGLRGYnh5C01A=;
 b=lX/WDyEhs6P2IeRi3AjSziGR530aihHznUj1hwyPyYkkEP1tC2D0jxpQrS1GJeCY+mDOzH9yHsncFMrVHBkkjo74lyakJ9BMW7ep8bKhujb1/TkpZwYHGdM5J6enkEkNcNQKhRYmicfwEd0uEE2t0YjxdQUdmoGMmgzBPJf6g3XjERB9Vm0Fn+vRTx0UZgt0sD1YT0HOgzyljppzItdEDv1VNkmpMDV0vSN1Vg9D0w75H30rO9rzyjK8WgRB1kwi1fgijUMFcqi/WsxyJIN1KtRFblEMBvnTWzvMLOv5XtSc4prvUNXfM142eM0U0fVRPj17aXs8658gCvtR7yuNVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB10332.eurprd04.prod.outlook.com (2603:10a6:150:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Tue, 26 Aug
 2025 16:17:41 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Tue, 26 Aug 2025
 16:17:41 +0000
Date: Tue, 26 Aug 2025 12:17:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1] i3c: master: svc: Use manual response for IBI events
Message-ID: <aK3eHkf31uIw04EH@lizhi-Precision-Tower-5810>
References: <20250819090831.3009647-1-yschu@nuvoton.com>
Content-Disposition: inline
In-Reply-To: <20250819090831.3009647-1-yschu@nuvoton.com>
X-ClientProxiedBy: SJ0PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::11) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB10332:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf606d6-dea2-44a8-e2fe-08dde4bc1510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qaCqFOYp2r3xS73k9lDL8P8FFfE2xSnj7RWJBuFRyc50pFxg5Vaq9iwI869r?=
 =?us-ascii?Q?vU4G/PutxUsdaHuCD74gMx2IhYTergvwF1kB5+9ahwG+YmJVhPJZf/xGvwvp?=
 =?us-ascii?Q?wodrwL2xaiV7G3IjNJ1HAU2OIrvmyVFZUkBYmpuwvGkkhQgjJ5q6d7Cn4Qfd?=
 =?us-ascii?Q?c11UFBR+g2TzeKlUo7UFlvdKWuh8jOv+mV/lAeLyOSh3M5ypHJRqXTig7xMs?=
 =?us-ascii?Q?PeNi0ixptD27tVWv8RvAzOHy7MFVNZh5vvI8ZyFKfoTt53v88uykSm9SJoJW?=
 =?us-ascii?Q?+PFhyNe3D4WtlMTUphgCxXjg6kBmOrK0JHLdzh0oVS8EDlWJoUF4MJlbIRoL?=
 =?us-ascii?Q?3kinQtJzGaeZ6cGHg1WnXfMZM9bl2d92kq30VESLuEGmaoOfKZbmDE6T4YtY?=
 =?us-ascii?Q?tIqRXQPtRvcS2XMb/RKcrAnAVtOg/T0mlkli3RkfOJYnUY2NSVScxjRx0wjb?=
 =?us-ascii?Q?vTKdFTgPG3ZuSZJJHSIuNimWxdiX6t4yUbf785MZvcmfPbyxlu7lTyTeFW07?=
 =?us-ascii?Q?DeGrAf8FUIxUBeQa0hEIs4AWAJSDGZ7AuZfBH+dQJHv8ZbK6kiPGRXaAGC5Z?=
 =?us-ascii?Q?L6NHuDnQk8YW08b73ddRGcHdESzcFN0UVOlt1Pc0wMVW9NPeQRFC8xx0HgzZ?=
 =?us-ascii?Q?w8nEPAQsCxuzEPUEayQ9jRFedNtLIfEZL+Vo+3h6h5IMpYNtuqh4mzft5X4w?=
 =?us-ascii?Q?cY40FLrHDkI+sam6O2mL2IwdOMGd1T6A9hCQ5sSsc/tCM2DilxOnrikD0nV/?=
 =?us-ascii?Q?8ATrSmBGugEYFva8IXGE2KEH0jS4dqEp47azia0Hh3aRfpRPuy30fvxIsftV?=
 =?us-ascii?Q?9MO+Hec9rrzeoZ6UDe1t2fjxx4Hm63fy2uCfkBsKLK/9EgPdafk5HAUM/8le?=
 =?us-ascii?Q?dEwV/U/UYIX4tmO7Ok0wdoXhCXo/6azaOM1U62vVSPP0fRUdbo5XkT3iBVBX?=
 =?us-ascii?Q?CutrmWc3xlCmJv01t1Z9Nh2j78VhswvZIehw3sl4+sKQ/fvMp+MklVfTMpWW?=
 =?us-ascii?Q?4ew0Eccr3plDf53ldRtyEATAPmg/wK3kRK5Hoy/ehxLIiFPRXuF3zU0ev6l8?=
 =?us-ascii?Q?PFrsnmBGzIDdFNZz5NLkt2yp8mTIqBU7XWEgh/bgvVZs1QY4NYqmh5xVO7Gu?=
 =?us-ascii?Q?S/1yWKPCaYK45KPXHATkxZ5hmGe1U6qXAIs0eZ/dThH7cvpr3df1pmCGRUFW?=
 =?us-ascii?Q?6Xi5oipcm4xMFy9RcCllrQcGWB3gVJTA7fm9HY4tK/TcBeyZh2EnaSQfT4XR?=
 =?us-ascii?Q?T6hqs1tIdULeAXRbCJJrCybkNkRGSzjIvaXlpsPE7codS9d8FehT1URvIDJ1?=
 =?us-ascii?Q?r3tLOws2JuAW12MOqWq9cTy7UwQwJUDoYOFZZodt5ysSnZM97Qe0MjaVw+Qh?=
 =?us-ascii?Q?YYKUbKM7gQfqP76RjgAaGG/hjOP5Br84k4Ru8uepNYL/RiMeZ+EwhaoSoyHs?=
 =?us-ascii?Q?Hmec7Y/8tiZCwg0fzTCBh5bFgwhJan4aTfK6/U3jGnoyJz3BZuuzKA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jjXYKfL6AuefZ7nD9CwGEs9/NK3f6aeui0mdYed1tEZotd63jjpwcdNznm0J?=
 =?us-ascii?Q?hyFIwhYXbYFYXwuugL8U3fouVrcl3q0sUG90lrEA0cVO3PeeBi3fbNWJK8L0?=
 =?us-ascii?Q?cYPeAJ+V3Sp/bbsfCC9VSlar6qxdk3trHi4wuNEYTrVyYM/Ufp5ib2T+2JxU?=
 =?us-ascii?Q?QyZRyCnC6BX+JZKSLxMn+yZb2vYwDZCOOCjqNP0c4RmC46L8+NURCK78C5ld?=
 =?us-ascii?Q?ZNoRiULAiebUTIaQCMe7J/xW2rTb8p1qgIQ2UG9InQMD6yfFthv446SEFMst?=
 =?us-ascii?Q?qkLWIjMrl/TbG+CsKAPBh9FCQyHCy6HqpHwrTZ8iIj9OGcKuzMiD0WM02Kgj?=
 =?us-ascii?Q?Q/r48kKX+t9yvgF4QDBePMq4j9HPCKdQEEd0unKAPm2J7m006syZU89rL3d0?=
 =?us-ascii?Q?i3m16ItsySFoQc0ABMPnl4NHuxTN3aZ+8AnPZ+2ScKtMSOPRbD8FUfVdg+3S?=
 =?us-ascii?Q?DmBcOnVCSvmpWx1ubDfzJ/WZ0P4qZu/6DmWbzh3IxagFdS5ZVg7vcFdL2IpQ?=
 =?us-ascii?Q?G6g3GPM9ZBXk3HfvmjBr0wGzb5Uk+mhdHYLOTVXGrCFD1cnFpU6XnHZVPIpm?=
 =?us-ascii?Q?mMG3Shfra2dcKvHwchD2RfwiZpaYE1JcQbX/zX8N+X5m3HhlK+n9UlQx2Eko?=
 =?us-ascii?Q?81qxTAdEQRvLtVYuGdcXd0P8m/nt+FM8kEgJQP0G+LR8JIqmxRSmnBms9k9W?=
 =?us-ascii?Q?565SXNjU+hXw+pN9aLgAjfueEY5XbIINM6nn1+VM2YOxs+7CkVBRM8z/CY6M?=
 =?us-ascii?Q?xKrYwYre4J8PVnN7Jtk97ox32sCVc4YeIpXYfVyoXL34Q1tHPmnpMdwoe/m3?=
 =?us-ascii?Q?Nj90nmQmjqiYP6DRyfnrZHBxKSsbGQ2NBOF9Vvf8y+R/WbQ23viPT7Os8HJD?=
 =?us-ascii?Q?ddctopPLOlzyMErqFmUtfx1GLQDu1hYmT9ov7R60EV0CEOl5M7XQH3Z5ws05?=
 =?us-ascii?Q?tZgGOAb/2/EO4Nv6DNREatBtPT52Tf5Hgli9gmtK3Rgv8npkLLRdwjNFi6Ry?=
 =?us-ascii?Q?RZPKqa3mS3/s5Fu+o2+/xrBIbXJ5FbruRCqQJ4BnBJNZeTNqrpGdykyiG6zV?=
 =?us-ascii?Q?Dzxv0YGxnBeE/o/vOj7f/7Rw4RwBmU+7PkuZ+iUlUf9Cdl7GJr/rpOUciKvl?=
 =?us-ascii?Q?AkkXL2JEMmjk+tt5qC1ybnxuPbU5qot8QQ8LarnwcCtklQsUG1qCksJJnBz7?=
 =?us-ascii?Q?XhWQKKKAWfM8xV73pRLdlrWQ9mCaRqKAtmFpJgnQjMP96tdJiJVd8BHG40Cj?=
 =?us-ascii?Q?v+NXsLemHZ2mL/GqcUjnSAYSn2hWaR7Gc4vLHlnk9ihjzMRQZX8DX/Jun1iE?=
 =?us-ascii?Q?QGnomtiPVQGA8zM5pHmrfW5QD7zD7Ejp2BhHcCeyRGMGYPz1JNd13Zey8xwJ?=
 =?us-ascii?Q?xXzhKGR2C9rQEjmByyiGwHC+HTzgnzZEelCfU17LWPe7mPNkcenSIPJJgiBK?=
 =?us-ascii?Q?Kc0wUmcuHzDJ6uElsNo520uxo5wrvxcoTZzm9XTAU2kGXOgvq82EvDXjlcGT?=
 =?us-ascii?Q?TZymj6rloQbH9LtPZasCepcx/Uq8m7bXQJcT2F5UG5xg3pLgh4W/KE/i0a46?=
 =?us-ascii?Q?oIc7WiR3YfQXk8CoK04NfsXeI3Rfu4JoVuoXrzF3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf606d6-dea2-44a8-e2fe-08dde4bc1510
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 16:17:41.7441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKcUo1zdFS5qlcY3rMtZ1pHO31YSdXOMfk9AsaYYaV6tAHggldJbAl8HxbggmbvtQ/O1pwd+kkDampwjfV4rYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_091748_983242_AD8673F4 
X-CRM114-Status: GOOD (  23.79  )
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

On Tue, Aug 19, 2025 at 05:08:31PM +0800, Stanley Chu wrote:
> From: Stanley Chu <yschu@nuvoton.com>
>
> Using IBIRESP_AUTO causes the hardware to ACK IBI requests even when the
> target is not in the device list. The svc_i3c_master_nack_ibi() has no
> effect in such case.

how this case can happen since default target's IBI is disabled. Need host
send IBI enable command to target devices before target pull SDA lower.

>
> AutoIBI has another issue that the controller doesn't quit AutoIBI state
> after an IBIWON polling timeout. The following sequence is the case:
> 1. Target pulls SDA low
> 2. SLVSTART interrupt triggers the IBI ISR
> 3. Target releases SDA
> 4. Driver writes AutoIBI request to MCTRL
> 5. SDA is high, so AutoIBI process does not start
> 6. IBIWON polling times out
> 7. Controller state is AutoIBI and doesn't accept EmitStop request
>
> Emitting broadcast address with IBIRESP_MANUAL avoids both issues.
>
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 701ae165b25b..17644e041b44 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -517,9 +517,10 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
>  	 */
>  	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
>
> -	/* Acknowledge the incoming interrupt with the AUTOIBI mechanism */
> -	writel(SVC_I3C_MCTRL_REQUEST_AUTO_IBI |
> -	       SVC_I3C_MCTRL_IBIRESP_AUTO,
> +	/* Emit broadcast address for arbitration */

Need comments here why Request_AutoIBI not work. I think it is IP design
defect to make REQUEST_AUTO_IBI useless.

Only concern here is that svc_i3c_master_ack_ibi() need send in 100us by
i3c spec requirement.

Frank

> +	writel(SVC_I3C_MCTRL_REQUEST_START_ADDR |
> +	       SVC_I3C_MCTRL_IBIRESP_MANUAL |
> +	       SVC_I3C_MCTRL_ADDR(I3C_BROADCAST_ADDR),
>  	       master->regs + SVC_I3C_MCTRL);
>
>  	/* Wait for IBIWON, should take approximately 100us */
> @@ -539,10 +540,15 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
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

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
