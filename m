Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F98E77188
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Jan 2025 22:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KrKFsDY3fyxjYgo3bcojn/TWUXlRwQMya9QbZwuqUzI=; b=GJlUmVzE7TySp8
	SCTFduu0SmP8pg6g/r22TZ/rjTT0gjoGWLctxILag946G4+cX8ia4HsZZwRaxAix5zzMz9Ity2KKM
	hWjmi0wSiYSDZNG5Rjxl32JP2vQiAxfMjU//f7LeNXQ31c78GKdBqPBFXIK19rTg++rpo3WnFazUJ
	nBYAbut4JQSZ3XviJWyd5xHnn2fjOS+/aBPsts7r4JbGWhIdf7RLD/jOqtbhKMhxKPxV+nFFQsQx5
	vep92P3cJJhEgDf0bdGuf+P7h9VjrFQFuKmNoHHj8Z8IkFbpyB2xslRIdiRTcvzF8D/T853ZEz5a9
	xOULl17t1nCR2EqTW2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6qY-00000003Zeb-1e1R;
	Sun, 12 Jan 2025 22:54:18 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6qU-00000003Zdy-3u1O
	for linux-i3c@lists.infradead.org;
	Sun, 12 Jan 2025 22:54:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 262D71BF204;
	Sun, 12 Jan 2025 22:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736722449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7999jetr7TTK/iQtMJ+/kbDvvNRKuEQNa3t5KglJsDU=;
	b=QqndU374soXhDCiGZK+ADo0n+zinWpmuou7O2Bnk2Jff3sOM5dORxMYo7lMN2+3iLtTeRC
	XIxey5cv8dAGaXZ1G5PXwkUPYFTOx1icvgPuWXUkZ5BdkPnAH8fJ9EY7wR8jOVebve6kWC
	QRNNkopXDiCjaoRCo7WU7HA9H9oOmnlVFIofw7EAFz/sBTGPOAkvfe8xreOa9V7CkXF1XK
	TwEXSyVUNvC8P9Vf5Y1faZbW0DS6m7e4G7GRZlTDjBftSCxYaYFacf7OimUENRtjggy9Ld
	fuJ+oFAZsCist7H0RcZ+to1yBgivWFqrwGdoBBcdGCVXJ7Khtkv0aX+iXsbV4A==
Date: Sun, 12 Jan 2025 23:54:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux@treblig.org
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Remove unused i3c_device_do_setdasa
Message-ID: <202501122254082b225acf@mail.local>
References: <20241221143418.86012-1-linux@treblig.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241221143418.86012-1-linux@treblig.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_145415_264964_DA1652C7 
X-CRM114-Status: GOOD (  18.39  )
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

Hello,

On 21/12/2024 14:34:18+0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> i3c_device_do_setdasa() was added in 2022 as part of
> commit 672825cd2823 ("i3c: export SETDASA method")
> 
> but has been unused.
> 
> It calls i3c_dev_setdasa_locked() which is now also unused.
> 
> Remove them both.
> (This is effectively a revert of 672825cd2823).
> 


Yeah, i guess this just means that we didn't see the device driver yet.
I'm going to keep those function around for now.

> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/i3c/device.c       | 20 --------------------
>  drivers/i3c/internals.h    |  1 -
>  drivers/i3c/master.c       | 19 -------------------
>  include/linux/i3c/device.h |  2 --
>  4 files changed, 42 deletions(-)
> 
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index e80e48756914..984976f28314 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -54,26 +54,6 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
>  
> -/**
> - * i3c_device_do_setdasa() - do I3C dynamic address assignement with
> - *                           static address
> - *
> - * @dev: device with which the DAA should be done
> - *
> - * Return: 0 in case of success, a negative error core otherwise.
> - */
> -int i3c_device_do_setdasa(struct i3c_device *dev)
> -{
> -	int ret;
> -
> -	i3c_bus_normaluse_lock(dev->bus);
> -	ret = i3c_dev_setdasa_locked(dev->desc);
> -	i3c_bus_normaluse_unlock(dev->bus);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(i3c_device_do_setdasa);
> -
>  /**
>   * i3c_device_get_info() - get I3C device information
>   *
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 433f6088b7ce..842e1a865877 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -13,7 +13,6 @@
>  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
>  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
>  
> -int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
>  int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  				 struct i3c_priv_xfer *xfers,
>  				 int nxfers);
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 42310c9a00c2..000187339400 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2916,25 +2916,6 @@ void i3c_master_unregister(struct i3c_master_controller *master)
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_unregister);
>  
> -int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
> -{
> -	struct i3c_master_controller *master;
> -
> -	if (!dev)
> -		return -ENOENT;
> -
> -	master = i3c_dev_get_master(dev);
> -	if (!master)
> -		return -EINVAL;
> -
> -	if (!dev->boardinfo || !dev->boardinfo->init_dyn_addr ||
> -		!dev->boardinfo->static_addr)
> -		return -EINVAL;
> -
> -	return i3c_master_setdasa_locked(master, dev->info.static_addr,
> -						dev->boardinfo->init_dyn_addr);
> -}
> -
>  int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  				 struct i3c_priv_xfer *xfers,
>  				 int nxfers)
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 0a8a44ac2f02..f4e924c179d7 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -301,8 +301,6 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>  			     struct i3c_priv_xfer *xfers,
>  			     int nxfers);
>  
> -int i3c_device_do_setdasa(struct i3c_device *dev);
> -
>  void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
>  
>  struct i3c_ibi_payload {
> -- 
> 2.47.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
