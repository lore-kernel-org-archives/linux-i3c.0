Return-Path: <SRS0=KEqG=ZM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C34C432C0
	for <linux-i3c@archiver.kernel.org>; Wed, 20 Nov 2019 14:53:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6905A206F4
	for <linux-i3c@archiver.kernel.org>; Wed, 20 Nov 2019 14:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g+laPtyT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6905A206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNShhQ4o+yfm2Xly8Cw4ovufYNtviU+KcVOOyVzwujo=; b=g+laPtyTi+EQ0c
	s6zfDz9DWa5NMXMyt3UBUvjbo6rhXKo0PJt6w1nCYIcNFcLpaLz0n5Ycdz7EvYH+2PdP2ex3xRi5W
	dOz8QtnwjTqhQg6b8RVLc8OgZ3UiA6oE+Y59j7GiRZ+FMih2z20JhwynMaW+U0AYbK04AAYZkB9I/
	LsPyewzbvKbQKMWqmHTDiyYnW6CY9wa3V7T2ASHcMihMTsAhseFUkT5k1LB4w0syhWYE973g7MrPH
	AHqAQlzb8yeibUar6c2wGbXObhaqI/BYn4+KjUd6RW5P3MYMnNupcseSN/3LeNw2p5pprDgnXBuax
	t1M7JRdDY8ifDRm/1UIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXRMT-0002lY-1u; Wed, 20 Nov 2019 14:53:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXRMQ-0002kt-1N
 for linux-i3c@lists.infradead.org; Wed, 20 Nov 2019 14:53:39 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 46E5A2901DA;
 Wed, 20 Nov 2019 14:53:34 +0000 (GMT)
Date: Wed, 20 Nov 2019 15:53:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v3] i3c: master: cdns: add data hold delay support
Message-ID: <20191120155331.4e885577@collabora.com>
In-Reply-To: <20191118150115.13839-1-pgaj@cadence.com>
References: <20191118150115.13839-1-pgaj@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_065338_344232_AC392D2B 
X-CRM114-Status: GOOD (  21.92  )
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
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, agolec@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 18 Nov 2019 16:01:14 +0100
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
> Main changes between v2 and v3:
> - Add thd_delay_ns value and calculate register value depending on that
> 
> Main changes between v1 and v2:
> - Add device-specific data which holds the thd_del value
> - Remove device tree property
> ---
>  drivers/i3c/master/i3c-master-cdns.c | 49 ++++++++++++++++++++++++++++++++----
>  1 file changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 10db0bf0655a..81756b60a1a9 100644
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
> +#define CTRL_THD_DELAY(x)		(((x) << 24) & GENMASK(25, 24))
>  #define CTRL_HJ_DISEC			BIT(8)
>  #define CTRL_MST_ACK			BIT(7)
>  #define CTRL_HJ_ACK			BIT(6)
> @@ -70,6 +72,7 @@
>  #define CTRL_MIXED_FAST_BUS_MODE	2
>  #define CTRL_MIXED_SLOW_BUS_MODE	3
>  #define CTRL_BUS_MODE_MASK		GENMASK(1, 0)
> +#define THD_DELAY_MAX			3
>  
>  #define PRESCL_CTRL0			0x14
>  #define PRESCL_CTRL0_I2C(x)		((x) << 16)
> @@ -388,6 +391,10 @@ struct cdns_i3c_xfer {
>  	struct cdns_i3c_cmd cmds[0];
>  };
>  
> +struct cdns_i3c_data {
> +	u8 thd_delay_ns;
> +};
> +
>  struct cdns_i3c_master {
>  	struct work_struct hj_work;
>  	struct i3c_master_controller base;
> @@ -408,6 +415,7 @@ struct cdns_i3c_master {
>  	struct clk *pclk;
>  	struct cdns_i3c_master_caps caps;
>  	unsigned long i3c_scl_lim;
> +	const struct cdns_i3c_data *devdata;
>  };
>  
>  static inline struct cdns_i3c_master *
> @@ -1181,6 +1189,20 @@ static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
>  	return 0;
>  }
>  
> +static u8 cdns_i3c_master_calculate_thd_delay(struct cdns_i3c_master *master)
> +{
> +	unsigned long sysclk_rate = clk_get_rate(master->sysclk);
> +	u8 thd_delay = DIV_ROUND_UP(master->devdata->thd_delay_ns,
> +				    (1000000000 / sysclk_rate));

				     ^NSECS_PER_SEC

No need to send a new version, I can fix it when applying.

> +
> +	/* Every value greater than 3 is not valid. */
> +	if (thd_delay > THD_DELAY_MAX)
> +		thd_delay = THD_DELAY_MAX;
> +
> +	/* CTLR_THD_DEL value is encoded. */
> +	return (THD_DELAY_MAX - thd_delay);
> +}
> +
>  static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
>  {
>  	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> @@ -1264,6 +1286,15 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
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
> +	ctrl |= CTRL_THD_DELAY(cdns_i3c_master_calculate_thd_delay(master));
>  	writel(ctrl, master->regs + CTRL);
>  
>  	cdns_i3c_master_enable(master);
> @@ -1521,6 +1552,15 @@ static void cdns_i3c_master_hj(struct work_struct *work)
>  	i3c_master_do_daa(&master->base);
>  }
>  
> +static struct cdns_i3c_data cdns_i3c_devdata = {
> +	.thd_delay_ns = 10,
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
> @@ -1532,6 +1572,10 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>  	if (!master)
>  		return -ENOMEM;
>  
> +	master->devdata = of_device_get_match_data(&pdev->dev);
> +	if (!master->devdata)
> +		return -EINVAL;
> +
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	master->regs = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(master->regs))
> @@ -1631,11 +1675,6 @@ static int cdns_i3c_master_remove(struct platform_device *pdev)
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
