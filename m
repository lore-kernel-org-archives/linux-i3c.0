Return-Path: <SRS0=0Lh8=WZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46ED1C3A59F
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 10:41:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C4F23405
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 10:41:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mADIp0r/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19C4F23405
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykDvJkyjYkJAwHxnV+UmJZiZFVJ/sbP/59rRk0OCv/E=; b=mADIp0r/hHNYZJ
	8nMF/Ko0RSfjNKvA2VdOoy5q1aWlPPf3Lph1V/lpxm6mEQqBst2eIu3XmoPVlNTzzUeUKHk12LLCF
	zwSh2zXpw+/osgLwxA4hdBWq/onEXSsc8lRfy3G33oWJAQQ4eeZgEkb+M212LTVZ7ihcTDWvh7FLO
	hzaOyKhI9Kaa2s2fCVW+c6wlm352KLSO+XKgFtL+y34zkXINP8RDLFjINSjoI1YBMUxij9VPqpIKb
	UTur+1y7oXEWh19Biq90ETfTrinejYkWvOj4BHqL5BB6f7bOwjJ9PtisyQo4agFhn34bNx0ZmAlXz
	SME8EUmelXDZEikkFeCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3Hrs-0005CO-Fl; Thu, 29 Aug 2019 10:41:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3Hro-0005BS-HS
 for linux-i3c@lists.infradead.org; Thu, 29 Aug 2019 10:41:27 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 34DE028626E;
 Thu, 29 Aug 2019 11:41:20 +0100 (BST)
Date: Thu, 29 Aug 2019 12:41:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH 1/4] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Message-ID: <20190829124115.482cd8ec@collabora.com>
In-Reply-To: <e26948eaaf765f683d8fe0618a31a98e2ecc0e65.1567071213.git.vitor.soares@synopsys.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
 <e26948eaaf765f683d8fe0618a31a98e2ecc0e65.1567071213.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_034124_846949_07E625A5 
X-CRM114-Status: GOOD (  17.66  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Joao.Pinto@synopsys.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 Przemyslaw Gaj <pgaj@cadence.com>, robh+dt@kernel.org,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

+Przemek

Please try to Cc active I3C contributors so they get a chance to
comment on your patches.

On Thu, 29 Aug 2019 12:19:32 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> On pre_assing_dyn_addr() the devices that fail:
>   i3c_master_setdasa_locked()
>   i3c_master_reattach_i3c_dev()
>   i3c_master_retrieve_dev_info()
> 
> are kept in memory and master->bus.devs list. This makes the i3c devices
> without a dynamic address are sent on DEFSLVS CCC command. Fix this by
> detaching and freeing the devices that fail on pre_assign_dyn_addr().

I don't think removing those entries is a good strategy, as one might
want to try to use a different dynamic address if the requested one
is not available. Why not simply skipping entries that have ->dyn_addr
set to 0 when preparing a DEFSLVS frame

> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  drivers/i3c/master.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5f4bd52..4d29e1f 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1438,7 +1438,7 @@ static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
>  	ret = i3c_master_setdasa_locked(master, dev->info.static_addr,
>  					dev->boardinfo->init_dyn_addr);
>  	if (ret)
> -		return;
> +		goto err_detach_dev;
>  
>  	dev->info.dyn_addr = dev->boardinfo->init_dyn_addr;
>  	ret = i3c_master_reattach_i3c_dev(dev, 0);
> @@ -1453,6 +1453,10 @@ static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
>  
>  err_rstdaa:
>  	i3c_master_rstdaa_locked(master, dev->boardinfo->init_dyn_addr);
> +
> +err_detach_dev:
> +	i3c_master_detach_i3c_dev(dev);
> +	i3c_master_free_i3c_dev(dev);

We certainly shouldn't detach/free the i3c_dev_desc from here. If it
has to be done somewhere (which I'd like to avoid), it should be done
in i3c_master_bus_init() (i3c_master_pre_assign_dyn_addr() should be
converted to return an int in that case).

>  }
>  
>  static void
> @@ -1647,7 +1651,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	enum i3c_addr_slot_status status;
>  	struct i2c_dev_boardinfo *i2cboardinfo;
>  	struct i3c_dev_boardinfo *i3cboardinfo;
> -	struct i3c_dev_desc *i3cdev;
> +	struct i3c_dev_desc *i3cdev, *i3ctmp;
>  	struct i2c_dev_desc *i2cdev;
>  	int ret;
>  
> @@ -1746,7 +1750,8 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	 * Pre-assign dynamic address and retrieve device information if
>  	 * needed.
>  	 */
> -	i3c_bus_for_each_i3cdev(&master->bus, i3cdev)
> +	list_for_each_entry_safe(i3cdev, i3ctmp, &master->bus.devs.i3c,
> +				 common.node)
>  		i3c_master_pre_assign_dyn_addr(i3cdev);
>  
>  	ret = i3c_master_do_daa(master);


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
