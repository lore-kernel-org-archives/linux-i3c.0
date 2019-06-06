Return-Path: <SRS0=CE6j=UF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B25C46470
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 18:54:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 822EB2083D
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 18:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bPf5zuz+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 822EB2083D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTzIRul/hMiOLfuriU7VWvPT/UhlXudNPbGF2K+iNSs=; b=bPf5zuz+nWiAJw
	mwznIiQO4ybO3fF3Q1S5nl3gDpH0dCwLymIEKujwi+lutn3VY0DN1MZs9/i3hx6Xm7kyG9v+u8Z/Y
	a5enq1MGpWMFPsWXnikDdWRXlTzjs9gx0HmOmeg6rnunAb34WAWcNHyGptrtF1Vi7qAyA2mLJpHnW
	GttNQDw9xK/IAbA0RsBuSumKprzu7EFW3pobfQlXWsmlDiUYHkamP7IB+k4yjbbIoUb2QSTU1eTSN
	B2awb9b83mOXkfO4jPP3MNB+7L10Sh0+bppAlukiG59ZcpjsuNCofLdJks6ynX+9u9C+piBAPCh0Y
	EqSm1ZlDhPbnfUZxTt7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYxWy-0000AU-Nn; Thu, 06 Jun 2019 18:54:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYu9U-0006rU-95
 for linux-i3c@lists.infradead.org; Thu, 06 Jun 2019 15:18:05 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 31276260D74;
 Thu,  6 Jun 2019 16:17:58 +0100 (BST)
Date: Thu, 6 Jun 2019 17:17:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v2 2/3] i3c: add i3c_get_device_id helper
Message-ID: <20190606171755.0feb8998@collabora.com>
In-Reply-To: <eaa9eb66df6b4c9b577aec46fd440b99d763a5a2.1559831663.git.vitor.soares@synopsys.com>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
 <eaa9eb66df6b4c9b577aec46fd440b99d763a5a2.1559831663.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_081804_457041_C613522B 
X-CRM114-Status: GOOD (  16.38  )
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:54:30 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-kernel@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org,
 lorenzo.bianconi83@gmail.com, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu,  6 Jun 2019 17:12:03 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> This helper return the i3c_device_id structure in order the client
> have access to the driver data.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
> Changes in v2:
>   move this function to drivers/i3c/device.c
> 
>  drivers/i3c/device.c       | 8 ++++++++
>  include/linux/i3c/device.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index 69cc040..a6d0796 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -200,6 +200,14 @@ struct i3c_device *dev_to_i3cdev(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(dev_to_i3cdev);
>  
> +const struct i3c_device_id *i3c_get_device_id(struct i3c_device *i3cdev)
> +{
> +	const struct i3c_driver *i3cdrv = drv_to_i3cdrv(i3cdev->dev.driver);
> +
> +	return i3cdrv->id_table;
> +}
> +EXPORT_SYMBOL_GPL(i3c_get_device_id);

That's not what I asked. I told you to expose i3c_device_match_id()
which already exists and is in master.c. What you really want is to get
the device_id entry that matches your device, not the first entry in
the table...

> +
>  /**
>   * i3c_driver_register_with_owner() - register an I3C device driver
>   *
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 5ecb055..e0415e1 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -187,6 +187,7 @@ static inline struct i3c_driver *drv_to_i3cdrv(struct device_driver *drv)
>  
>  struct device *i3cdev_to_dev(struct i3c_device *i3cdev);
>  struct i3c_device *dev_to_i3cdev(struct device *dev);
> +const struct i3c_device_id *i3c_get_device_id(struct i3c_device *i3cdev);
>  
>  static inline void i3cdev_set_drvdata(struct i3c_device *i3cdev,
>  				      void *data)


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
