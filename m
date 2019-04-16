Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA570C282E0
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 11:12:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D68720693
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 11:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sv7YmVgL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D68720693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+f3kk+5Wm55/OSzbvvG6B4rOkDB/4lCe7eNwg0duqc=; b=Sv7YmVgLOu43hH
	iHws/CpmJaB7gL0uXQCzRXOhxLEg969me1Xb0UovB9sv5DnTUclvtvHtVLbyzCxfdUQU1xI6IW2bX
	Td2ReIs7OGsqpmoGFNro2Rj7rLJKuoWJBC4uX7SUDE+Yx4B011lIgTEfVbMs5GRE/eat64933i89O
	QbUsRajCrCqR+N4eTDWGAkbcdfClBGlij6PEFSygHR/uVnyh9pocRaDI/6SvhK7Hm5H10IYrQlAhC
	ChJHIHcSxI3Pxyph/T2oEmsuvI97SDC0KGBiDMhLNglWwuKhtc2AD3zUY0i/1IpaO6c7pIyeBD4q+
	73Vs5JWuUAYQo5M/DIOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGM0q-0001Fg-2Q; Tue, 16 Apr 2019 11:12:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGHQM-0001NA-3T
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 06:18:31 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 52A84260C42;
 Tue, 16 Apr 2019 07:18:28 +0100 (BST)
Date: Tue, 16 Apr 2019 08:18:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <vitor.soares@synopsys.com>
Subject: Re: [PATCH 2/3] i3c: Add i3c_get_device_id helper
Message-ID: <20190416081825.2d17b771@collabora.com>
In-Reply-To: <33ba7e13816fcece0a2f7ec917c18807359c16c7.1555354268.git.vitor.soares@synopsys.com>
References: <cover.1555354268.git.vitor.soares@synopsys.com>
 <33ba7e13816fcece0a2f7ec917c18807359c16c7.1555354268.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_231830_278976_5256084F 
X-CRM114-Status: GOOD (  15.50  )
X-Mailman-Approved-At: Tue, 16 Apr 2019 04:12:26 -0700
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
Cc: lars@metafoo.de, bbrezillon@kernel.org, linux-iio@vger.kernel.org,
 gregkh@linuxfoundation.org, joao.pinto@synopsys.com, rafael@kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, pmeerw@pmeerw.net,
 knaack.h@gmx.de, lorenzo.bianconi83@gmail.com, linux-i3c@lists.infradead.org,
 jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 15 Apr 2019 21:19:40 +0200
Vitor Soares <vitor.soares@synopsys.com> wrote:

> This helper return the i3c_device_id structure in order the client
> have access to the driver data.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  drivers/i3c/device.c       | 8 ++++++++
>  include/linux/i3c/device.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index 472be99..8ab8e4c 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -235,6 +235,14 @@ struct i3c_device *dev_to_i3cdev(struct device *dev)
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

I think what you want is i3c_device_match_id(). Just move the function
to drivers/i3c/device.c, export it and define its prototype in
include/i3c/device.h.

> +
>  /**
>   * i3c_driver_register_with_owner() - register an I3C device driver
>   *
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 7ee7e30..ee48886 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -211,6 +211,7 @@ static inline struct i3c_driver *drv_to_i3cdrv(struct device_driver *drv)
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
