Return-Path: <SRS0=UjAo=VJ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FEBC742CA
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jul 2019 16:03:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C8E5206B8
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jul 2019 16:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BMgFv/VE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C8E5206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4vscApS+ZSW88iYnpxqpydXia6Vrf65dO9yEieDkM8=; b=BMgFv/VEZRsY3h
	XUWcvSJjClQO+j+ucrekWrO73h982eSbr4nSXSV7raSKddllz4Lz9YdD8UAHTWDz33vI5mm2TKnIZ
	noSTEPvs2KJpXRIG0VuCW9CWIY4rOwyOfTtRg/knwgEqZCI+km4JNmoTuf0rng1gWQVr6ITilYG/5
	ZXDW1QDi8DJSeWYY6CAy1lYEnvwX7euLULW1hYuwUzo1YVKC57jIUZq9Os/S7d+VqyRBOfGOVcsiY
	Mfw7X6fbqrlP3S+mzdiKEuJN2Lm5Ir7WVR8Y7m5quE/31bWOyvJbJDauMFsIIMKDUMSrVoAU5fxUk
	ZPKunM3Np8gjK+nwMoQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hly1T-0001It-40; Fri, 12 Jul 2019 16:03:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hly1P-0001IN-TI
 for linux-i3c@lists.infradead.org; Fri, 12 Jul 2019 16:03:45 +0000
Received: from linux.home (2a01cb0c80061e007f541addd69f0d47.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb0c:8006:1e00:7f54:1add:d69f:d47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6D3C828BBDA;
 Fri, 12 Jul 2019 17:03:41 +0100 (BST)
Date: Fri, 12 Jul 2019 18:03:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v4 2/3] i3c: move i3c_device_match_id to device.c and
 export it
Message-ID: <20190712180338.47b50e9f@linux.home>
In-Reply-To: <debadccffef84c541601a97162ac656cd7c58478.1562931742.git.vitor.soares@synopsys.com>
References: <cover.1562931742.git.vitor.soares@synopsys.com>
 <debadccffef84c541601a97162ac656cd7c58478.1562931742.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190712_090344_212537_3A0868F1 
X-CRM114-Status: GOOD (  20.81  )
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
Cc: Joao.Pinto@synopsys.com, rafael@kernel.org, linux-iio@vger.kernel.org,
 gregkh@linuxfoundation.org, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
 lorenzo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 12 Jul 2019 13:53:29 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> The i3c device driver needs the i3c_device_id table.

"Some I3C device drivers need to know which entry matches the
i3c_device object passed to the probe function" 

> Lets move  to device.c and export it to be used.

"Let's move i3c_device_match_id() to device.c and export it so it can be
used by drivers."

> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
> Changes in v4:
>   None
> 
> Changes in v3:
>   Remove i3c_get_device_id
>   Move i3c_device_match_id from drivers/i3c/master.c to drivers/i3c/device.c
>   Export i3c_device_match_id
> 
> Changes in v2:
>   move this function to drivers/i3c/device.c
> 
>  drivers/i3c/device.c       | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/i3c/master.c       | 45 ---------------------------------------------
>  include/linux/i3c/device.h |  4 ++++
>  3 files changed, 50 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index 69cc040..383df3b 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -200,6 +200,52 @@ struct i3c_device *dev_to_i3cdev(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(dev_to_i3cdev);
>  

You're missing a kerneldoc here.

> +const struct i3c_device_id *
> +i3c_device_match_id(struct i3c_device *i3cdev,
> +		    const struct i3c_device_id *id_table)
> +{
> +	struct i3c_device_info devinfo;
> +	const struct i3c_device_id *id;
> +
> +	i3c_device_get_info(i3cdev, &devinfo);
> +
> +	/*
> +	 * The lower 32bits of the provisional ID is just filled with a random
> +	 * value, try to match using DCR info.
> +	 */
> +	if (!I3C_PID_RND_LOWER_32BITS(devinfo.pid)) {
> +		u16 manuf = I3C_PID_MANUF_ID(devinfo.pid);
> +		u16 part = I3C_PID_PART_ID(devinfo.pid);
> +		u16 ext_info = I3C_PID_EXTRA_INFO(devinfo.pid);
> +
> +		/* First try to match by manufacturer/part ID. */
> +		for (id = id_table; id->match_flags != 0; id++) {
> +			if ((id->match_flags & I3C_MATCH_MANUF_AND_PART) !=
> +			    I3C_MATCH_MANUF_AND_PART)
> +				continue;
> +
> +			if (manuf != id->manuf_id || part != id->part_id)
> +				continue;
> +
> +			if ((id->match_flags & I3C_MATCH_EXTRA_INFO) &&
> +			    ext_info != id->extra_info)
> +				continue;
> +
> +			return id;
> +		}
> +	}
> +
> +	/* Fallback to DCR match. */
> +	for (id = id_table; id->match_flags != 0; id++) {
> +		if ((id->match_flags & I3C_MATCH_DCR) &&
> +		    id->dcr == devinfo.dcr)
> +			return id;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(i3c_device_match_id);
> +
>  /**
>   * i3c_driver_register_with_owner() - register an I3C device driver
>   *
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5f4bd52..7667f84 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -270,51 +270,6 @@ static const struct device_type i3c_device_type = {
>  	.uevent = i3c_device_uevent,
>  };
>  
> -static const struct i3c_device_id *
> -i3c_device_match_id(struct i3c_device *i3cdev,
> -		    const struct i3c_device_id *id_table)
> -{
> -	struct i3c_device_info devinfo;
> -	const struct i3c_device_id *id;
> -
> -	i3c_device_get_info(i3cdev, &devinfo);
> -
> -	/*
> -	 * The lower 32bits of the provisional ID is just filled with a random
> -	 * value, try to match using DCR info.
> -	 */
> -	if (!I3C_PID_RND_LOWER_32BITS(devinfo.pid)) {
> -		u16 manuf = I3C_PID_MANUF_ID(devinfo.pid);
> -		u16 part = I3C_PID_PART_ID(devinfo.pid);
> -		u16 ext_info = I3C_PID_EXTRA_INFO(devinfo.pid);
> -
> -		/* First try to match by manufacturer/part ID. */
> -		for (id = id_table; id->match_flags != 0; id++) {
> -			if ((id->match_flags & I3C_MATCH_MANUF_AND_PART) !=
> -			    I3C_MATCH_MANUF_AND_PART)
> -				continue;
> -
> -			if (manuf != id->manuf_id || part != id->part_id)
> -				continue;
> -
> -			if ((id->match_flags & I3C_MATCH_EXTRA_INFO) &&
> -			    ext_info != id->extra_info)
> -				continue;
> -
> -			return id;
> -		}
> -	}
> -
> -	/* Fallback to DCR match. */
> -	for (id = id_table; id->match_flags != 0; id++) {
> -		if ((id->match_flags & I3C_MATCH_DCR) &&
> -		    id->dcr == devinfo.dcr)
> -			return id;
> -	}
> -
> -	return NULL;
> -}
> -
>  static int i3c_device_match(struct device *dev, struct device_driver *drv)
>  {
>  	struct i3c_device *i3cdev;
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 5ecb055..de102e4 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -188,6 +188,10 @@ static inline struct i3c_driver *drv_to_i3cdrv(struct device_driver *drv)
>  struct device *i3cdev_to_dev(struct i3c_device *i3cdev);
>  struct i3c_device *dev_to_i3cdev(struct device *dev);
>  
> +const struct i3c_device_id *
> +i3c_device_match_id(struct i3c_device *i3cdev,
> +		    const struct i3c_device_id *id_table);
> +
>  static inline void i3cdev_set_drvdata(struct i3c_device *i3cdev,
>  				      void *data)
>  {


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
