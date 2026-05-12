Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDFDCD343F
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 18:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UagBbPH5jt8Qxz9mJ4CGYdntdboQkVwEBffV7pSWDVk=; b=TGnPQo6UVbLRda
	4qD2rk0YOWdzczPi8yMUAV4nwIVe9aw/sIAJl0ipR+0m3O7aEufKYYfcsjqGoQbXV4KwDwYOAjzcr
	0VQF7VAThB9c/9nD0LKVw7rOOvW18vd61zAdTXKTbkgbJkeW2EazxO4bKwrfHL+fWkW/nu+npI+QW
	XuL8T2CKsKWxsavOAcD2yTP/uXfYShgB5Ieel2kY8WKAxPYOCUITZXhdCbsw1/V4nXerRcyLNzRXr
	uJAfIJHjW16I3FX/uaqX4tZufezyuVvMJ4k3O0reYAZw0xQOpLRg/xAWx/Fmje8XYuhl28qDnSJEK
	RnjfhQOMonmpjy13Nkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMra6-000000003jH-2hKr;
	Tue, 12 May 2026 18:11:46 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMra4-000000003iZ-0wB9
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 18:11:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/7fx4ojHeFW0v4E+uWsuEDgKFdQw2pCI8yzw4zYR1s4zcMD8+bdOw1HDtUBFGM8Sv7/kXDIE//whzhXPmcW+x8NueKX130YMUkffUWMAZuvBdfpgrJuhK+cKo7i0SVAzeecRovcVmVw0YLZK58BFRZNNDaiOWAMZrrW7Rm6gnKzRVhjpDVPUGie7rJ0nqs2gZ0FaGP4WvAfUH43jcJbhRH/R96wLv9mU1nS6NIDCc1fAnI8tp7/X4fXG+U6ZpjwXF9skG/p95sacU9oufhz/RGRvRwMu7u5qhQcDGpqSZLYNPgz9llFJ6X3h/e/LS/PLR4T3gMU2hjV6LIAls6JbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9RYVzktn27srYKechndONlvDdVT+ztrdccWbxALQhQ=;
 b=wOMAokyqxkG8ogBDAVBPMOlh15L7imyiBJlTGx0SGj6wLlXmR/EesjVSa3eM1KI1mDOKdxz9V6Gv26WPNPtWBUbvWMjReqTTQ6MOi5CNBgGckgmplJm1/QYz7bHkvG9yzbZ4qcsyV5qgoicl8NNEOwWIWiFZOFLeHQ5m1ipeA1p8ZOJJ0YMN8+iSVFUOS1WP0VXVpmF8euAIplH4fBLLtLIgnUL3/JXSa+6jGNorGNxaFjMpZoC02+h1AZabG3IRmGaWqAlKR+3o03QcdnSqQOQetZWbpdA8oPkxA1xXMcuwuG9I+vHBOaIL+AIGtP6Uh2hUnLIDwBnSPJlxLYis9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9RYVzktn27srYKechndONlvDdVT+ztrdccWbxALQhQ=;
 b=WRSfCgKuseDcah+r6muZoGlaaFoiMN9ouFQdt9ub/C3rT9N10au3ckvVg6Na1MHXPH20p3z+6k9K77UzDdDYPEtxn83iQBYhDDYTm1BuZ6+dGmnwyNkscSI4P8Q6UojbgjGI2CSJ1i7hmMPPicQJpzOs4lSFaIFNcsVZ8rBxgA21slaUxnudegOCXouKHA+ny9AtXpdWqsrK9gBJvM9F05BZ6jCGJyoAeB6gQdgcOHDMWSTA/09U0TJN6Bqp6AdSXBlD7nLTmUp90zizwK3jrvwKM0mWb2u3grTeTV6V93u5Yjw1QA5tYP1uSeIcw5TzOeujUDb+d7+Ved/FAYCRyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMDPR04MB11679.eurprd04.prod.outlook.com (2603:10a6:20b:716::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:11:39 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:11:39 +0000
Date: Tue, 12 May 2026 14:11:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 14/16] i3c: mipi-i3c-hci: Base timeouts on actual
 transfer start time
Message-ID: <agNtVqJOmsdY_XL8@lizhi-Precision-Tower-5810>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
 <20260504113352.38490-15-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260504113352.38490-15-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0171.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMDPR04MB11679:EE_
X-MS-Office365-Filtering-Correlation-Id: c55f3944-4a83-426f-6224-08deb051e990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|38350700014|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: oxL8kOgmt9XF8jyqguBlWOiPQ1HPZT+NXsnlPxSoli6vdfDE8yc1DCBxxGt+KhHJ5gLnLI/9IheLVi2JHiw/aAhq09SIJ8cZn/O7Hm8mu15vDg2RB+6EbiVRO/J0h4qRHsHxrDFl5RBinK875DPSkD9XzO8vMihfmUQzBUHFCR4Yf+OcW0RzHLljARRUI1Px7aNG3zrRWUVECo3yt/b9pk+rPicOnVWc5yeev3YHXeorDlazn2PQ3L3rL48XJoTCRNQm4o03U2nQPNK/2mdsilWJaXye5SdUVrYcs/c81GLDpMtmg8CKx6I5wjtm5SjmlT4WXjNljFQjmVDlqKTGedK+YMOaQPGo19DrobifjGUeUbbABZgkzg7n0sjzIhCAhMhxjQu7LwqlZOS8C0F7HZvVEz8xpAmX69Y4rKuvnF0qWPtiP0utAlfb8E8P8aKvo/dQh3EmEN9JXZ7Rwz9RkO7COnPPlqJvpufeWTywDDHnQa4fAPLF8LnGtwCWn5LmRn6oaK6mpe7KlsK4Ekl0Oa3lPDKiEa3+KsOeJoaWeXFoHhulDRS8o+WpMXN3j+weXS9z2hfjajtlLRqRZGQa7e0KISDrbzMh6YTaq8KRBsRB8uF04nhd02zx+B1HmY49m4ooPYTHBPach7ndvyAjBfdODKt8UYKVdBLZHqpWjM8kJZV0gyVR/BRsyBqsEFq3K01DZ3UUuNDxcgC5NLHH/mwC5NWDgW8kxevZAAWa6R9yTU4JDnXRvf824xTzAmeu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(38350700014)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TaFL5H7qD10X0Zf5B7dTNsFfqKfdTvOSUpyCtmt1qN5USlZeRTxujuGw476B?=
 =?us-ascii?Q?GydiTMY1kOTu83OGMmCpFjl79q0Lm4cZmVGQuXYil4NRBAhlgxohmQMYEFC3?=
 =?us-ascii?Q?6y5iaUl+5ORUuuWAWT6/lvqku+86kH+pAclivihzp6DsnLTS682XYnOqXjnC?=
 =?us-ascii?Q?3QsI5m+fKG7EfosowQkZmoV9tnRgRCtuWkSHLTWjYxdFgIcnHokQ3r4WlLOa?=
 =?us-ascii?Q?Dgnixn7QBgmmH8CUmfDzgKjcmq1AJQWnLTeDWEPH9jQfEfIvF/QrQEvPAzQH?=
 =?us-ascii?Q?XY9Vwf2ijec2lC/x5YEOsUOOhcom49BZaG2PPJjJchdLkEXZT38FwjC3AyI+?=
 =?us-ascii?Q?biLQ6VJd2FlolcVtIi0GTXOBqRowrbjV/kuVZNYMZ0ePrEpNQbpeLXBUIjgA?=
 =?us-ascii?Q?oa4M9Pm2t3h2QusEcV4gw6Or3tZm8+UAv7kKkzOdQT+m55Xi8K2xTqprh40g?=
 =?us-ascii?Q?ushF/wNrnwRkzn8i8ZE2vyt3eDnUMuDi12XL0ZyvD7+2LpTlXlVQa0L7bOb+?=
 =?us-ascii?Q?JKXZg+fLO576M8dSSXP4FzUJK9XBOys1Yh8mYfNFpfH/eIAf5sxqFPqZJjVL?=
 =?us-ascii?Q?SFAXVRnCwIWiuaEC9Pm2o8KoW4J4lnSn6tiYvppOOhbhTjz+8Tspa4ltusDJ?=
 =?us-ascii?Q?iWliZ+GJExvYEJLfzFrXSUNsrmVzTEy2AjdLaiVPcDiDLD6ielb8TPsBy3Pt?=
 =?us-ascii?Q?ftYfk3c5jNYbezjUqyIcnbDHvUBqlVQ7ajYdZTzE6651g4ymqDm3aK07et3V?=
 =?us-ascii?Q?xViipe+CX61tkswe9Uw89jjDxmOODtzKgCAVj5ZrH4+uLvTWPjWUlvPq5+vj?=
 =?us-ascii?Q?HpxltqSf9/RwxlVN5JaBgrxQgLVkCKHOge87jYdy35w72Q0Dxo5TBNscO6z7?=
 =?us-ascii?Q?1X9rRoSbgQyb0IU321JI8AIb8A7OTSwJZyfxgkXrdoK6xy2np9JMXRWAQIos?=
 =?us-ascii?Q?skAo1R6pIunp4Q0gtYQoZpNDrOv8CMKi9ykGVs7FpNDlmrOpAA0lzVAT9jCN?=
 =?us-ascii?Q?fh53N0T1xA9umxcu3a2QHm3W/B6NcVsxbNEBoEQmgMsHOiLfp3krveVfBOy1?=
 =?us-ascii?Q?GF762Z7lKkMv06UCgVkgzQekFYhnhBhrR1uaPgQSA3cX20QNqZYvb2Ch6/eC?=
 =?us-ascii?Q?ZeQj4Iuc2ww/ctPHZgVt1RsFE4g/1K7lrG+T+SujqbeGbnElbc6D7/tter6/?=
 =?us-ascii?Q?ehdc+YKjp+QuTdgF00CrHyp28rax0N3SaeoUNcQqYacQ4gM1LK8t3Mo/L8SX?=
 =?us-ascii?Q?oiPWzdC1EjFOCJNkf9+MI/KhisvAzG+vBCDx+TVGYGfdgQ3iyzlMZ/cSnVWM?=
 =?us-ascii?Q?TAo2dSfDqPrtxy2Y/U2JiIxlVbl5IwOQsSxzsnBwACByZbEY4rG5rBlSRZJ8?=
 =?us-ascii?Q?an5XdDJwyyWYo/tcJMhhAlmx4PnBv2pCzpNL+SEjzjlWaP1qafvgDLvy1Jqe?=
 =?us-ascii?Q?fPFrlSVcGbtuhT5KFFJR+YE0rQBA0ZujS10HcvNWR1AiBKFRY7oLg0tFcoMv?=
 =?us-ascii?Q?TrW7GnDv9fIgNiBE296HbIPKvGR0bPFc8ATDTu/g+Mera5fxM/ZgoKeAljW/?=
 =?us-ascii?Q?/wWeDHQlUzzbECoEY9mlAaAJbA8QdHMlX+dYkAzBVvn41sM0yUkfwGFNOhXk?=
 =?us-ascii?Q?/tJN/cYDM8C0uI+f0n4A/0H5ZenTDzqNr0lez4iepsAjQTNVCwL+xgkrHEDC?=
 =?us-ascii?Q?5C/Cb9ga+sp6MfF7i9TsgKA6uG715639trclt5LxOd0FJz3vMB2KxoYSYa9P?=
 =?us-ascii?Q?vtVvLkXuzg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55f3944-4a83-426f-6224-08deb051e990
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:11:39.2027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9ftBp9Z+nulxnCtccojbmiTTfY6dxvILR+nMcw1avmcYrej+K3WlaI5RIJQ0CaJ39oFcZ05wUrMrnmaOpLhfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11679
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_111144_270673_C787E684 
X-CRM114-Status: GOOD (  27.03  )
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

On Mon, May 04, 2026 at 02:33:50PM +0300, Adrian Hunter wrote:
> Transfer timeouts are currently measured from the point where a transfer
> list is queued to the controller.  This can cause transfers to time out
> before they have actually started, if earlier queued transfers consume
> the timeout interval.
>
> Fix this by recording when a transfer reaches the head of the queue and
> adjusting the timeout calculation to start from that point.  The existing
> low-overhead completion-based timeout mechanism is preserved, but care is
> taken to ensure the transfer start time is consistently recorded for both
> PIO and DMA paths.
>
> This prevents premature timeouts while retaining efficient timeout
> handling.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V3:
>
> 	None
>
> Changes in V2:
> 	Do not flag the next transfer as started when there is an error
> 	which halts the controller
> 	Instead flag it started at the end of hci_dma_dequeue_xfer()
> 	Use hci_start_xfer() in pio.c
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 19 ++++++++++++++++++-
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 19 ++++++++++++++++++-
>  drivers/i3c/master/mipi-i3c-hci/hci.h  | 11 +++++++++++
>  drivers/i3c/master/mipi-i3c-hci/pio.c  |  1 +
>  4 files changed, 48 insertions(+), 2 deletions(-)
>
...
>
>  #include <linux/io.h>
> +#include <linux/jiffies.h>
>
>  /* 32-bit word aware bit and mask macros */
>  #define W0_MASK(h, l)  GENMASK((h) - 0,  (l) - 0)
> @@ -88,11 +89,13 @@ struct hci_xfer {
>  	u32 cmd_desc[4];
>  	u32 response;
>  	bool rnw;
> +	bool started;
>  	void *data;
>  	unsigned int data_len;
>  	unsigned int cmd_tid;
>  	struct completion *completion;
>  	unsigned long timeout;
> +	unsigned long start_time;

it'd better to add unit for start_time

Frank
>  	union {
>  		struct {
>  			/* PIO specific */
> @@ -123,6 +126,14 @@ static inline void hci_free_xfer(struct hci_xfer *xfer, unsigned int n)
>  	kfree(xfer);
>  }
>
> +static inline void hci_start_xfer(struct hci_xfer *xfer)
> +{
> +	if (!xfer->started) {
> +		xfer->started = true;
> +		xfer->start_time = jiffies;
> +	}
> +}
> +
>  /* This abstracts PIO vs DMA operations */
>  struct hci_io_ops {
>  	bool (*irq_handler)(struct i3c_hci *hci);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 8f48a81e65ab..6b8cc5f2b4d2 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -605,6 +605,7 @@ static bool hci_pio_process_cmd(struct i3c_hci *hci, struct hci_pio_data *pio)
>  		 * Finally send the command.
>  		 */
>  		hci_pio_write_cmd(hci, pio->curr_xfer);
> +		hci_start_xfer(pio->curr_xfer);
>  		/*
>  		 * And move on.
>  		 */
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
