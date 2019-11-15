Return-Path: <SRS0=ua2+=ZH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16487C432C3
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Nov 2019 11:06:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC5BA206DB
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Nov 2019 11:06:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q+G8KJbj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC5BA206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FHVCVTT4ZTuPxgsug1G5UjgiaPV+kaj+Y6/uNjlx3k=; b=Q+G8KJbj29MGwy
	MWotycjt3TXFXl1f4VYWIavHeu4tWkjPnsb0xUBLJQBh8wrPj3oHkEler7TtYQXN50X8o3pNAtCTz
	GBGd71z8aduZJbgTrddpQjLw9NO6S9j9j4eymYjz4jkk8usPf7ScrPJDauaoxJWZj8AzB75dckAwV
	QwMR1hZ52kDOiW0bI011m0uHp/90/wX05JIud0BJvLkGg2p4KwWg+NEaFBeyBSZKjc8IRPtKhqgi8
	1YTrR1GT1DrHpI/FBhIu01OpqcJsxh0dm/vtKWD0eOf3RItra1rwYw9x4q10bpOMUV/U+CZnU539G
	ml+vw+1Rxb2aLraczptw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVZQR-0004Os-JB; Fri, 15 Nov 2019 11:06:03 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVZQN-0004OI-UF
 for linux-i3c@lists.infradead.org; Fri, 15 Nov 2019 11:06:02 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ED4D129175A;
 Fri, 15 Nov 2019 11:05:57 +0000 (GMT)
Date: Fri, 15 Nov 2019 12:05:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v2] i3c: master: cdns: add data hold delay support
Message-ID: <20191115120555.53c1b745@collabora.com>
In-Reply-To: <20191115062326.16476-1-pgaj@cadence.com>
References: <20191115062326.16476-1-pgaj@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_030600_517275_832AE7F2 
X-CRM114-Status: GOOD (  22.10  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 vitor.soares@synopsys.com, rafalc@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 15 Nov 2019 07:23:26 +0100
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> This patch adds support for THD_DEL (Data Hold Delay) to Cadence
> I3C master constoller driver.
> 
> As per MIPI I3C Specification 1.0, Table 75 (page 142) defines
> non-zero minimal tHD_PP timing on master output (Fig 65). This
> setting allows to meet this timing on master's soc outputs,
> regardless of PCB balancing.
> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> 
> ---
> 
> Main changes between v1 and v2:
> - Add device-specific data which holds the thd_del value
> - Remove device tree property
> ---
>  drivers/i3c/master/i3c-master-cdns.c | 37 +++++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 10db0bf0655a..3531396f04fd 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -22,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
> +#include <linux/of_device.h>
>  
>  #define DEV_ID				0x0
>  #define DEV_ID_I3C_MASTER		0x5034
> @@ -60,6 +61,7 @@
>  #define CTRL_HALT_EN			BIT(30)
>  #define CTRL_MCS			BIT(29)
>  #define CTRL_MCS_EN			BIT(28)
> +#define CTRL_THD_DEL(x)			(((x) << 24) & GENMASK(25, 24))

DEL is a bit ambiguous, how about _DELAY().

>  #define CTRL_HJ_DISEC			BIT(8)
>  #define CTRL_MST_ACK			BIT(7)
>  #define CTRL_HJ_ACK			BIT(6)
> @@ -388,6 +390,10 @@ struct cdns_i3c_xfer {
>  	struct cdns_i3c_cmd cmds[0];
>  };
>  
> +struct cdns_i3c_data {
> +	u8 thd_del;

Same here, thd_delay. BTW, is the clk driving the I3C master clk
expected to be fixed? If not, I'd suggest expressing this delay is
seconds (nano or micro depending on the precision you need) so the
driver can calculate the proper thd_delay value based on
clk_get_rate(master->sysclk).

> +};
> +
>  struct cdns_i3c_master {
>  	struct work_struct hj_work;
>  	struct i3c_master_controller base;
> @@ -408,6 +414,7 @@ struct cdns_i3c_master {
>  	struct clk *pclk;
>  	struct cdns_i3c_master_caps caps;
>  	unsigned long i3c_scl_lim;
> +	const struct cdns_i3c_data *devdata;
>  };
>  
>  static inline struct cdns_i3c_master *
> @@ -1264,6 +1271,15 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
>  	 * We will issue ENTDAA afterwards from the threaded IRQ handler.
>  	 */
>  	ctrl |= CTRL_HJ_ACK | CTRL_HJ_DISEC | CTRL_HALT_EN | CTRL_MCS_EN;
> +
> +	/*
> +	 * Configure data hold delay based on device-specific data.
> +	 *
> +	 * MIPI I3C Specification 1.0 defines non-zero minimal tHD_PP timing on
> +	 * master output. This setting allows to meet this timing on master's
> +	 * SoC outputs, regardless of PCB balancing.
> +	 */
> +	ctrl |= CTRL_THD_DEL(master->devdata->thd_del);
>  	writel(ctrl, master->regs + CTRL);
>  
>  	cdns_i3c_master_enable(master);
> @@ -1521,17 +1537,33 @@ static void cdns_i3c_master_hj(struct work_struct *work)
>  	i3c_master_do_daa(&master->base);
>  }
>  
> +static struct cdns_i3c_data cdns_i3c_devdata = {
> +	.thd_del = 0x3,
> +};
> +
> +static const struct of_device_id cdns_i3c_master_of_ids[] = {
> +	{ .compatible = "cdns,i3c-master", .data = &cdns_i3c_devdata },
> +	{ /* sentinel */ },
> +};
> +
>  static int cdns_i3c_master_probe(struct platform_device *pdev)
>  {
>  	struct cdns_i3c_master *master;
> +	const struct of_device_id *of_id = of_match_device(
> +		of_match_ptr(cdns_i3c_master_of_ids), &pdev->dev);

The of_match_ptr() is not needed since cdns_i3c_master_of_ids is always
defined.


>  	struct resource *res;
>  	int ret, irq;
>  	u32 val;
>  
> +	if (!of_id)
> +		return -ENODEV;
> +

Not sure ENODEV is the right error code here. If of_id == NULL that
means cdns_i3c_master_of_ids[] is not filled correctly, so I'd suggest
returning EINVAL.

>  	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
>  	if (!master)
>  		return -ENOMEM;
>  
> +	master->devdata = of_id->data;

If you do:

	master->devdata = of_device_get_match_data(&pdev->dev);
	if (!master->devdata)
		return -EINVAL;

You can get rid of of_id (and the associate assignment/test).

> +
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	master->regs = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(master->regs))
> @@ -1631,11 +1663,6 @@ static int cdns_i3c_master_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const struct of_device_id cdns_i3c_master_of_ids[] = {
> -	{ .compatible = "cdns,i3c-master" },
> -	{ /* sentinel */ },
> -};
> -
>  static struct platform_driver cdns_i3c_master = {
>  	.probe = cdns_i3c_master_probe,
>  	.remove = cdns_i3c_master_remove,


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
