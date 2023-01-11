Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A301C5479D
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Jan 2023 13:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZOX67BqQKXnnDmebNT5mbe+0olUn48YUtKCbakV2Kc=; b=kRUvOHyVTQsH94
	79fQXm0NpT+plHK+IqbFnNBJh1bcZ5H8/TF0u/CRBnbP4kkyB/YjBpfGkEpGmjGQc0Tib7XK84zB6
	iVgNMgOshan6qI94MO/FYZR7xOmZu26RT9I3fbZiERzkfNRy0ejDKJqWy6m2RaG3/PEIxXRyZIJSa
	4LiOqRuUKS0DVXrnWPe7PYrtq9CNnQWEopF8AC4CBxQAxGJf59grGgOlUlGHgKg2tSK8AlVMnkEwU
	kTeLVWg8/05fhEpMq5L9D3BGCQKM7RwglMIrBRstLEcvqCRgIrw2al0n03c38u/LU0BCFbQKGJV3D
	f6ze4qoqKdDfdZlVo2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbCg-00Baae-F4; Wed, 11 Jan 2023 13:31:42 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbCP-00BaNI-Pg
	for linux-i3c@lists.infradead.org; Wed, 11 Jan 2023 13:31:27 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 016B21BF204;
	Wed, 11 Jan 2023 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673443882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qf6yWNlKr7QSyIfIHzw7LhyhtqaNkxcbBpvkY0oQPe8=;
	b=OEuM4d9gx3xOYzBNMmCy1p+OKc4MSv+8UWQ+YZpuSHm2QVEGYOqFWbBF+LVIl1EO9uGV1Z
	cyr9/sWiVA6Q6K/WQbw1MTvcCnUh31tdOKYtrLWcplsusog9W76JQz+x5CZey0YyMqv3RX
	QzLsGPnPhVSRgCKwy5BIskfzHDG3v8noh7DN6LCL31N/NlPwRSgqFA1+8/CFim7ElONoWz
	t9DuAURl5GA3mhLPjeFhVYUSqvYehzuZaKHoIlz6l6aiagzOUSr5Y137NNfm2K1SmR2kXQ
	izP8Ulh6j/syJ81EMr/TI4j0od3V/HeS/e2kBjQBkWu3dwtJO1J6YlGoVQxYbQ==
Date: Wed, 11 Jan 2023 14:31:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2 02/16] i3c: move dev_to_i3cdev() to use
 container_of_const()
Message-ID: <Y766KHAN9oeQX1At@mail.local>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-3-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230111113018.459199-3-gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_053126_010954_155D526E 
X-CRM114-Status: GOOD (  16.52  )
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

On 11/01/2023 12:30:04+0100, Greg Kroah-Hartman wrote:
> The driver core is changing to pass some pointers as const, so move
> dev_to_i3cdev() to use container_of_const() to handle this change.
> dev_to_i3cdev() now properly keeps the const-ness of the pointer passed
> into it, while as before it could be lost.
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-i3c@lists.infradead.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/i3c/device.c       | 12 ------------
>  include/linux/i3c/device.h |  9 ++++++++-
>  2 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index 9762630b917e..d111499061b2 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -208,18 +208,6 @@ struct device *i3cdev_to_dev(struct i3c_device *i3cdev)
>  }
>  EXPORT_SYMBOL_GPL(i3cdev_to_dev);
>  
> -/**
> - * dev_to_i3cdev() - Returns the I3C device containing @dev
> - * @dev: device object
> - *
> - * Return: a pointer to an I3C device object.
> - */
> -struct i3c_device *dev_to_i3cdev(struct device *dev)
> -{
> -	return container_of(dev, struct i3c_device, dev);
> -}
> -EXPORT_SYMBOL_GPL(dev_to_i3cdev);
> -
>  /**
>   * i3c_device_match_id() - Returns the i3c_device_id entry matching @i3cdev
>   * @i3cdev: I3C device
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 1c997abe868c..68b558929aec 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -186,7 +186,14 @@ static inline struct i3c_driver *drv_to_i3cdrv(struct device_driver *drv)
>  }
>  
>  struct device *i3cdev_to_dev(struct i3c_device *i3cdev);
> -struct i3c_device *dev_to_i3cdev(struct device *dev);
> +
> +/**
> + * dev_to_i3cdev() - Returns the I3C device containing @dev
> + * @dev: device object
> + *
> + * Return: a pointer to an I3C device object.
> + */
> +#define dev_to_i3cdev(__dev)	container_of_const(__dev, struct i3c_device, dev)
>  
>  const struct i3c_device_id *
>  i3c_device_match_id(struct i3c_device *i3cdev,
> -- 
> 2.39.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
