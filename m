Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48FACD343F
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFkPRrpdxQEs7/9BML0kVNWOrtalyMBQM1yJFucr85E=; b=T74XMPpfu8lt+e
	M7VyPfbbE3/ZyQ8Z8FbeT0iZWmroTBTz4PfRut+QYqjpm50zH4neTIhv1H7vg5nIaFaIVYndEQOLV
	uJG9rdTgNxEKN7YWq8p1QDsoLkHQVFM9WvAWw+y+2g1A8HTQ3SXtOD0Omgecsj/+xH4rQ2Phf6rXR
	ROZqPwuAnIFqZnZkY9Dng97MfCntYXpXFOYRZHW1gscq3lqUXBhFuqHGAQE8Jz1cZW4HAs0J//dE7
	zHr1czcA1OOnZzoK2pFL1g1RQrMgcTrQOTXq9VICcBmGVCe2elbmUsVhdTmbPoQJYQSLsJqmbhrR/
	5C900R3tt+3izoONN+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvYR-00000008tB1-2ZHP;
	Fri, 15 May 2026 16:38:27 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvYP-00000008tAD-3Fut
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:38:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZP92lE/4Y5/Tp9RwsFaaTNl9b4au0NoiPL8YAjj82+BkQxBvmtf52OaxPQu/0pSIJhAFV3jL5oCsLtjz0sve0BfjsCCQRMus7jAvgYct2VZ34QW/ig8nVDgk4ptnUc54TqT+Cc7ML6RKsGtYFS07i/7tMYxytgeGlAVoSG5ZoohOCU9gPMPp6d53Z5rG9Vqw5wwbK7CgVHyAUzXsmtgh4TlFcNEtre5vI0p7Mbdmwsxr+u6t4O3LjPfMF9o26R2T8VWLUToijbtsup4ZLfaGF1HoYsUU4lphAydKaSd0HIYhUA1HI1+IBPc0Zz072a24PFNWXeELS7qptjIKVp5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvMJMzfEKOlaolHL5lNEFOTe55q6GvbY/BfgBKs0ed8=;
 b=RFZcUv7a1YKwN2UzSgOI1jpAaXkIWAHwy7UkmDeAGeQXI4M8co+/SkOke0w0V75vx+szIbmJVcJRr5Bji/PCX3pCHnY33HJdTQzX8rcg/7vheNbh4/yOpgqyRdcsEViM1nrzLXqEufNMV5FJ7CjhIlpsiYxhSlAnqR62w2NwLkOtLutaJcvLRFg8OPhfwx1U1eK62pLruO0evWriPZEJwg2sIeKdkH+wg/rOzIHdNOefIbIltIF14K8nNWGuJbOLC5MgyI3Wl20NuznVQQD8HN2d4UwyJnaDQiK8mry+bu7B0Y5Qy+GRk5EfFeHtyJ+xNKD5aSq3sAPbEx7OC1xNyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvMJMzfEKOlaolHL5lNEFOTe55q6GvbY/BfgBKs0ed8=;
 b=lDMasxakb3W9MNk4u6V7RB6Mn7FvDN1G5mq7e5AaOVchkJhUhTxlbi4sDjX9Hg4rE8XC87AG8cbSrTgXGzTMPbkbuTaX+oBIEGuCPfVhpQrWOUtGMaswY1eivHN9WuGsMsCsOMGeiyIgxOYDbrSXud3q4UUmmnKP87qL/7he6LEmmuEGC3hRFNu+3bvxFnxjigaI8zoZqZK8BeDtUvdgLYzsAxEDK3X4t8/TFPnmFnphO3SbA1s3xHqiwi3077vDdqWWX1TdSq5xZH1bjQSOsah9BW8srDmezdgDjEBJf9tCzMUI6qFmu3JAL6QX65TKPAmcisNan67FRs6iomFSdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB11457.eurprd04.prod.outlook.com (2603:10a6:10:5ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 16:38:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 16:38:20 +0000
Date: Fri, 15 May 2026 12:38:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] i3c: dw: add DMA support for data transfers
Message-ID: <agdL972cjHamOAD-@lizhi-Precision-Tower-5810>
References: <20260515155638.1840-1-hechushiguitu666@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260515155638.1840-1-hechushiguitu666@gmail.com>
X-ClientProxiedBy: SA1P222CA0103.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB11457:EE_
X-MS-Office365-Filtering-Correlation-Id: 249b3361-29c6-492c-8ef9-08deb2a05fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|19092799006|18002099003|22082099003|56012099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: GqLGOCCztDTLkgFUN4CTWWK3JHMNZWF7N6LM1zU8xfwYiFKT7iPsrpCVZjTD05fnbh8rescyxUdKabLCnxNwyzsNMQmwsb6Zm94IgeXjiK7GMmO/sM6f12wqwN35dQhBS5wU/hzcDQnp7TpJI79To+5v2Z9wwHkxo26d+nMi1iuCbbDSlhaRzEg1QDHZW4CP33pZXptnaiZFhXyM58zvd2id8P3yBdhPxE0t3E/IHudh7XX+397J1O5v+7tJoJnug+4Dg82FfJ3MunGbEkAPdSR8jOmv3olI2iv2PL3nxhXqPdu1aHmPnWKc4Rk1NhdZWuib9sg+uvcVHWdQANhUm+7gpAwLnXz7YnJES+m9cWoPtqNkVK38Qn9p29SQ1iwdm3IazpKs0FxVvJiWmUMj1eCDsP02/DcdNwFa2btGiF8rBD6mhBuv/OqMq86ImNMTcW4Zi2RxFxe3PFKT1dPzHp6ZWzGJAuCN5Txl6sUS0m9ylmyFCyoSHddn7HM0ksLPCgtOtuXtNP73sx8JjKhVVYW10u9nCysJTH80EOjDulwXVSJhMuBC6qcEOwWihEtfc6DbrirK2JHIVZW/Na7BlJas16TpH8Ned6nb2gV6a6h8yrFsP1RvglmVwXxog1RLJhh+wsllCyOABxRABOnwaNuXz0q1iZdd/hToafrxwDHwFz+yA/+QvOCzjHnKiC2Xy+a9zoe+jQHRFSlU75uyKnXBBWFz5NP+ijfUVJ4p5aO37DkaCaXFuka6vOItfeIo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(19092799006)(18002099003)(22082099003)(56012099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kvaW05vmvV42ocSvR9tYqN+PLxXIdcrc/kDnXFMT8g4tWPDcCKe15k5mlKDT?=
 =?us-ascii?Q?qIs1O1xbEKuuJguonv2X8F5f6HIwIebNLDXE2eTJ3J96eFzk7v2gLx3II+M7?=
 =?us-ascii?Q?9dgdj1UTe0TYAyutpqbMvw0L/ccjwbUTqqnz4ssibUWIfsIof/1AczFi6KpT?=
 =?us-ascii?Q?Iezg+6LRsamhx+dGlWyDI2ER89GlOHx4lpfyi8hp4S7Ee4yZMMrml7ZcglrV?=
 =?us-ascii?Q?JTgJzUfESX2Lr+NQ+VzryuLeTIEVNTS/h/18g5RkFLldzRPcAjCla6MdmEmd?=
 =?us-ascii?Q?BOpINEf6fHtf6vJPZghSiGyDVZYjd9W+KLy8vN+zMm4cD7GTc4HdiGseb+mC?=
 =?us-ascii?Q?jRPRzqAIcxTm6q66JfwADJuiGZCIDmGBwhvR5f6BqJyHYOM7FaoNQB7UzrYw?=
 =?us-ascii?Q?iTu0ALrxAGm7EMrUeiK1ZPTu5rwhgndrdACDkR9fHKHV+9e+XxJobEjsBFTs?=
 =?us-ascii?Q?pg9QzeoZrJUkOntP2HtCaRc5T4XlZy6fdCVluXdFkjnY+NkuoL1BLDSZq8B0?=
 =?us-ascii?Q?C5AsQmiUBp2rQNMIxbLrHQEjLjS4+HbKJsD6PkDfl3Eird+XgAflGf6PW2EP?=
 =?us-ascii?Q?zeFonUEp44WF3a2WrxEGIX/VrxhHPnbXr9g2K7MO3qj+pcQ1x5HyvCVJAO54?=
 =?us-ascii?Q?ujV0N/EdC4gPouu6xswg24rESRsaGBSZXDKmEPy6xcfJl8xHp3IXTvgWMSN2?=
 =?us-ascii?Q?E1wyrWE8HrGgnZ+GYy/7tHcnpaTAdQFC70pGu/r/9T01VIwea0X7WJXDV7uo?=
 =?us-ascii?Q?JSHZkGCwb2YevfiFJ8C+gS2apkEU1cC2C+jNMK5pmJBZziNjjpzG5BFkqxHR?=
 =?us-ascii?Q?EXqDy0VanhyI37B84SqUYpuOX7vueX4MbB0S7wNI2chD8RMdiz1rp9yGcIyN?=
 =?us-ascii?Q?I0Kk4Xg5NLHWzGogON0CdQ9bblkL2uJbtbJtAlbRoN57uokj4O4IotdYnWTP?=
 =?us-ascii?Q?RB+01qqJ3E2Er8ZBIDVRE4L/3tsTPZ8P21AnSJ1bjOQCyUVI/JsTv92pVp8w?=
 =?us-ascii?Q?dBrkfbhQbgk4OsM6+kR2/mizZ/o3uHWd2cJlJq3P8YSKUwgVFQGrLhSDGN0i?=
 =?us-ascii?Q?GHfQjmay3Pn96gPBmbj3tS6rNSTLGTSEPlvozw1wQM3zzIyNH/MYRf0IMxNg?=
 =?us-ascii?Q?5X+YBTUeh84PWtPVNVL+nnF59a92oIsS45UEE3FZu1EkA+2WvvmOBlogVqJw?=
 =?us-ascii?Q?1KZiPqBkqX5H1lynQlp7Pff0EOlDgrKbz1eCR0KjFDAVAN/471xcTTds2GnL?=
 =?us-ascii?Q?wDANNvQ6FQv5pcyevrrlbtJq6DEuJwK/D8FUN54wQrsVscxuG6Obthp7b4+U?=
 =?us-ascii?Q?HEbsTEt+jtqcN45GukUsFDakWP4ok/rGuGUUG1fVUpGMnKiZFsTaNLnkcE7G?=
 =?us-ascii?Q?Mg3eIbngx1IXFlrTaPSGh6LL739oTynAJch1Q7ATGq/SgehtA2WF0uSisV2s?=
 =?us-ascii?Q?LzvCTZe9j6AQOUntnEqu7ezMCmOqCG7zEFCSTLvfJ0psxjq/ha0A+9G00APu?=
 =?us-ascii?Q?CK3s8egy4b0+3vgr0MnaK/5V0GSxxn4olP4iuyRfrnrrK592EWwWrFTxAqbd?=
 =?us-ascii?Q?NOKauR+c0YnchlQcVg+A54hcRf0Of3nJoLBPJn1mv/yYEM57MBFEaM77ACgt?=
 =?us-ascii?Q?M1o7yXB80jJRYPttVqO5GM9Q7kFOpI+oAOqMUkmBzwgHSEPuPQWgB5L3K97Y?=
 =?us-ascii?Q?3waWkgRyNfi05rtGj7puOemTLnCjxv/Ya3g6b01DBu9KE3cWPKJjCvHdMfBt?=
 =?us-ascii?Q?OdW+1DTaCw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249b3361-29c6-492c-8ef9-08deb2a05fca
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 16:38:20.6811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DW2mgot8ExmCQfb7u1odroXoFK1vqtb+Bo2Ok7cbKZL/svl+6CuP7YpIXL/ti9KqPS5abkVyvsAxET/djig0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_093825_981244_ADA31FBE 
X-CRM114-Status: GOOD (  37.46  )
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

On Fri, May 15, 2026 at 11:56:35PM +0800, Haoyu Lu wrote:
> Add DMA support for the DesignWare I3C master controller to
> accelerate data transfers.
>
> The driver now requests tx and rx DMA channels during probe and
> uses them for data transfers of 4 bytes or more. Transfers smaller
> than 4 bytes, or transfers where DMA setup fails, fall back to PIO
> mode. DMA tail bytes (non-4-byte-aligned remainder) are handled
> with PIO as well.
>
> DMA transfers may sleep, so the xferqueue spinlock is temporarily
> dropped for DMA operations. This is safe because xferqueue.cur is
> only changed when a transfer completes, and the calling context
> serializes simultaneous transfers.
>
> The DMA enable bit (DEV_CTRL_DMA_EN, BIT(28)) is set when DMA is
> used and cleared otherwise, to ensure the hardware uses the correct
> data transfer path.
>
> Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
> ---
> This is an RFC patch to gather feedback on the overall approach before
> a formal submission. A few specific questions for reviewers:
>
> 1. DMA threshold: The current implementation uses DMA for transfers
>    >= 4 bytes, with tail bytes handled by PIO. Is 4 bytes a reasonable
>    threshold, or should we consider a higher value (e.g. 16 or 32) to
>    avoid DMA setup overhead for very small transfers?
>
> 2. Spinlock safety: dw_i3c_master_start_xfer_locked() and
>    dw_i3c_master_end_xfer_locked() temporarily drop xferqueue.lock
>    around DMA operations. The analysis is that xferqueue.cur is only
>    modified on transfer completion, and the caller serializes
>    simultaneous transfers. Is this safe, or should we restructure the
>    locking (e.g., convert to mutex)?
>
> 3. DMA channel handling: dw_i3c_dma_request() is called during probe
>    and silently degrades to PIO if DMA channels are unavailable. Is
>    this the right behavior, or should probe fail on DMA errors other
>    than -ENODEV/-EPROBE_DEFER?
>
> 4. Error handling for DMA timeouts: when a DMA timeout occurs,
>    dmaengine_terminate_all() is called but the transfer proceeds as if
>    it were successful, potentially reading stale data. Should we instead
>    signal an error to the I3C core?
>
> 5. IBI path: dw_i3c_master_read_ibi_fifo() still uses PIO. Should
>    IBI reads also use DMA, or is the IBI payload typically small enough
>    that PIO is preferred?
>
> Any other feedback on the design or implementation is welcome.
>
>  drivers/i3c/master/dw-i3c-master.c | 260 ++++++++++++++++++++++++++++-
>  drivers/i3c/master/dw-i3c-master.h |  17 ++
>  2 files changed, 270 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d6bdb32397fb..7b6c8681ff0c 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -13,6 +13,7 @@
>  #include <linux/errno.h>
>  #include <linux/i3c/master.h>
>  #include <linux/interrupt.h>
> +#include <linux/io.h>
>  #include <linux/ioport.h>
>  #include <linux/iopoll.h>
>  #include <linux/list.h>
> @@ -24,6 +25,10 @@
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>
> +#include <linux/dma-direction.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +
>  #include "../internals.h"
>  #include "dw-i3c-master.h"
>
> @@ -32,6 +37,7 @@
>  #define DEV_CTRL_RESUME			BIT(30)
>  #define DEV_CTRL_HOT_JOIN_NACK		BIT(8)
>  #define DEV_CTRL_I2C_SLAVE_PRESENT	BIT(7)
> +#define DEV_CTRL_DMA_EN			BIT(28)
>
>  #define DEVICE_ADDR			0x4
>  #define DEV_ADDR_DYNAMIC_ADDR_VALID	BIT(31)
> @@ -359,16 +365,123 @@ static int dw_i3c_master_get_free_pos(struct dw_i3c_master *master)
>  	return ffs(master->free_pos) - 1;
>  }
>
> +static void dw_i3c_dma_callback(void *arg)
> +{
> +	struct dw_i3c_dma *dma = arg;
> +
> +	dma_unmap_single(dma->chan_using->device->dev, dma->dma_buf,
> +			 dma->dma_len, dma->dma_data_dir);
> +	complete(&dma->complete);
> +}
> +
> +static int dw_i3c_master_dma_xfer(struct dw_i3c_dma *dma, const u8 *bytes)
> +{
> +	struct device *chan_dev = dma->chan_using->device->dev;
> +	struct dma_async_tx_descriptor *txdesc;
> +
> +	dma->dma_buf = dma_map_single(chan_dev, (void *)bytes, dma->dma_len,
> +				      dma->dma_data_dir);
> +	if (dma_mapping_error(chan_dev, dma->dma_buf))
> +		return -EINVAL;
> +
> +	txdesc = dmaengine_prep_slave_single(dma->chan_using, dma->dma_buf,
> +					     dma->dma_len, dma->dma_transfer_dir,
> +					     DMA_PREP_INTERRUPT);
> +	if (!txdesc) {
> +		dma_unmap_single(chan_dev, dma->dma_buf, dma->dma_len,
> +				 dma->dma_data_dir);
> +		return -ENOMEM;
> +	}

There are help function i3c_master_dma_map_single() to help bounce unalign
buffer.

> +
> +	reinit_completion(&dma->complete);
> +	txdesc->callback = dw_i3c_dma_callback;
> +	txdesc->callback_param = dma;
> +	if (dma_submit_error(dmaengine_submit(txdesc))) {
> +		dma_unmap_single(chan_dev, dma->dma_buf, dma->dma_len,
> +				 dma->dma_data_dir);
> +		return -EIO;
> +	}
> +
> +	dma_async_issue_pending(dma->chan_using);
> +	return 0;
> +}
> +
>  static void dw_i3c_master_wr_tx_fifo(struct dw_i3c_master *master,
>  				     const u8 *bytes, int nbytes)
>  {
> -	i3c_writel_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
> +	struct dw_i3c_dma *dma = master->dma;
> +	unsigned long time_left;
> +	int ret;
> +
> +	if (!master->use_dma || nbytes < 4) {
> +		i3c_writel_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
> +		return;
> +	}
> +
> +	dma->chan_using = dma->chan_tx;
> +	dma->dma_transfer_dir = DMA_MEM_TO_DEV;
> +	dma->dma_data_dir = DMA_TO_DEVICE;
> +	dma->dma_len = ALIGN_DOWN(nbytes, 4);
> +
> +	ret = dw_i3c_master_dma_xfer(dma, bytes);
> +	if (ret) {
> +		dev_err(&master->base.dev, "DMA TX setup failed (%d)\n", ret);
> +		i3c_writel_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
> +		return;
> +	}
> +
> +	time_left = wait_for_completion_timeout(&dma->complete,
> +						XFER_TIMEOUT);
> +	if (!time_left) {
> +		dmaengine_terminate_all(dma->chan_using);
> +		dev_err(&master->base.dev, "DMA TX timeout\n");
> +	}
> +
> +	if (nbytes & 3) {
> +		u32 tmp = 0;
> +
> +		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> +		writesl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
> +	}
>  }
>
>  static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
>  				       u8 *bytes, int nbytes)
>  {
> -	i3c_readl_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
> +	struct dw_i3c_dma *dma = master->dma;
> +	unsigned long time_left;
> +	int ret;
> +
> +	if (!master->use_dma || nbytes < 4) {
> +		i3c_readl_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
> +		return;
> +	}
> +
> +	dma->chan_using = dma->chan_rx;
> +	dma->dma_transfer_dir = DMA_DEV_TO_MEM;
> +	dma->dma_data_dir = DMA_FROM_DEVICE;
> +	dma->dma_len = ALIGN_DOWN(nbytes, 4);
> +
> +	ret = dw_i3c_master_dma_xfer(dma, bytes);
> +	if (ret) {
> +		dev_err(&master->base.dev, "DMA RX setup failed (%d)\n", ret);
> +		i3c_readl_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
> +		return;
> +	}
> +
> +	time_left = wait_for_completion_timeout(&dma->complete,
> +						XFER_TIMEOUT);
> +	if (!time_left) {
> +		dmaengine_terminate_all(dma->chan_using);
> +		dev_err(&master->base.dev, "DMA RX timeout\n");
> +	}
> +
> +	if (nbytes & 3) {
> +		u32 tmp;
> +
> +		readsl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
> +		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> +	}
>  }
>
>  static void dw_i3c_master_read_ibi_fifo(struct dw_i3c_master *master,
> @@ -403,14 +516,29 @@ static void dw_i3c_master_start_xfer_locked(struct dw_i3c_master *master)
>  	struct dw_i3c_xfer *xfer = master->xferqueue.cur;
>  	unsigned int i;
>  	u32 thld_ctrl;
> +	u32 dev_ctrl;
>
>  	if (!xfer)
>  		return;
>
> -	for (i = 0; i < xfer->ncmds; i++) {
> -		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
> -
> -		dw_i3c_master_wr_tx_fifo(master, cmd->tx_buf, cmd->tx_len);
> +	/*
> +	 * DMA transfers may sleep, so we must drop the spinlock while
> +	 * writing the TX FIFO. The xferqueue lock is held by our caller;
> +	 * xferqueue.cur is safe because:
> +	 * - New xfers are only added to the list (not cur) when cur is set.
> +	 * - Timeout-based dequeue is blocked until the caller calls
> +	 *   wait_for_completion_timeout(), which happens after we return.
> +	 */
> +	if (master->use_dma) {
> +		spin_unlock(&master->xferqueue.lock);
> +		for (i = 0; i < xfer->ncmds; i++)
> +			dw_i3c_master_wr_tx_fifo(master, xfer->cmds[i].tx_buf,
> +						 xfer->cmds[i].tx_len);

Here have risk, you need queue whole transfer once. because

1. First cmd
2. dma transfer
3. dma irq, which may delay or schedule by OS, there are 100us timeout by
target.

4. target may timeout, so treat REPEAT start as START,
5. target may raise IBI here, but host side think it is repeat START, don't
check address arbitration.

Frank


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
