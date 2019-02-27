Return-Path: <SRS0=zb1T=RC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66931C43381
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 18:49:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245F02184A
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 18:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kdbnk3vX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 245F02184A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjVKUrfvjXnd4zjvhXTDaHfX8r5iwxSbglSvhGC2Kcw=; b=Kdbnk3vXLn3PXw
	v6aSf2t/ud90/D2orobWJRJieZvsOQC5QZvr/18YCYh/mQJJMVUraP7/vrARinNgVIbVjP4sV/31o
	yF0MtIa/M06HKzHPkRet1Zd0UUxalZDhDAmLoQsgxrB6bWkECy/C49tiaWG9Tcj2RZMYMiNyrbEf8
	dGELnwOIF1Pq12dTJm28EopidProx9Px2/xjWtil7fW6r3mCsQjO7YuadJ+V6leEUCpu0Yw6xuIsI
	vlzIkhSxH5DZrXtnPKpeuokYNnhGPm/nIv6PPyJCvV1kgpqtmgyQgb5joTWavpw16yd9IVvCYp6t9
	XZk4N5k/r2ukImtANgQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gz4Gy-0001v1-Ob; Wed, 27 Feb 2019 18:49:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gz4Gv-0001uh-W7
 for linux-i3c@lists.infradead.org; Wed, 27 Feb 2019 18:49:39 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 927D1280053;
 Wed, 27 Feb 2019 18:49:34 +0000 (GMT)
Date: Wed, 27 Feb 2019 19:49:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v3 1/4] i3c: Drop support for I2C 10 bit addresing
Message-ID: <20190227194931.418a69aa@collabora.com>
In-Reply-To: <20190227183750.15367-2-pgaj@cadence.com>
References: <20190227183750.15367-1-pgaj@cadence.com>
 <20190227183750.15367-2-pgaj@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_104938_291871_D88160A0 
X-CRM114-Status: GOOD (  20.98  )
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
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 27 Feb 2019 18:37:47 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> This patch dropps support for I2C devices with 10 bit addressing. When I2C
> device with 10 bit address is defined in DT, I3C master registration fails.
> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> 
> ---
> 
> Main changes between v2 and v3 are:
> - Remove i2c_funcs() hook.

Now that you remove the ->i2c_funcs() here, the patch series is no
longer bisectable. I'd recommend merging patches 1, 2 and 3 to keep
things simple.

> - Reduce address space for I2C devices.
> 
> Main changes between v1 and v2 are:
> - Add error message when registering I2C device with 10 bit address.
> ---
>  drivers/i3c/master.c       | 19 +++++++++++--------
>  include/linux/i3c/master.h |  5 +----
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 2dc628d..5b3adb3 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1962,6 +1962,16 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * The I3C Specification does not clearly say I2C devices with 10-bit
> +	 * address are supported. These devices can't be passed properly through
> +	 * DEFSLVS command.
> +	 */
> +	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
> +		dev_err(&master->dev, "I2C device with 10 bit address not supported.");
> +		return -ENOTSUPP;
> +	}
> +
>  	/* LVR is encoded in reg[2]. */
>  	boardinfo->lvr = reg[2];
>  
> @@ -2111,16 +2121,9 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  	return ret ? ret : nxfers;
>  }
>  
> -static u32 i3c_master_i2c_functionalities(struct i2c_adapter *adap)
> -{
> -	struct i3c_master_controller *master = i2c_adapter_to_i3c_master(adap);
> -
> -	return master->ops->i2c_funcs(master);
> -}
> -
>  static const struct i2c_algorithm i3c_master_i2c_algo = {
>  	.master_xfer = i3c_master_i2c_adapter_xfer,
> -	.functionality = i3c_master_i2c_functionalities,
> +	.functionality = I2C_FUNC_SMBUS_EMUL | I2C_FUNC_I2C,
>  };
>  
>  static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index f13fd8b..eca8337 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -48,7 +48,7 @@ struct i3c_i2c_dev_desc {
>  #define I3C_LVR_I2C_INDEX(x)		((x) << 5)
>  #define I3C_LVR_I2C_FM_MODE		BIT(4)
>  
> -#define I2C_MAX_ADDR			GENMASK(9, 0)
> +#define I2C_MAX_ADDR			GENMASK(6, 0)
>  
>  /**
>   * struct i2c_dev_boardinfo - I2C device board information
> @@ -390,8 +390,6 @@ struct i3c_bus {
>   *	       and i2c_put_dma_safe_msg_buf() helpers provided by the I2C
>   *	       framework.
>   *	       This method is mandatory.
> - * @i2c_funcs: expose the supported I2C functionalities.
> - *	       This method is mandatory.
>   * @request_ibi: attach an IBI handler to an I3C device. This implies defining
>   *		 an IBI handler and the constraints of the IBI (maximum payload
>   *		 length and number of pre-allocated slots).
> @@ -437,7 +435,6 @@ struct i3c_master_controller_ops {
>  	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
>  	int (*i2c_xfers)(struct i2c_dev_desc *dev,
>  			 const struct i2c_msg *xfers, int nxfers);
> -	u32 (*i2c_funcs)(struct i3c_master_controller *master);
>  	int (*request_ibi)(struct i3c_dev_desc *dev,
>  			   const struct i3c_ibi_setup *req);
>  	void (*free_ibi)(struct i3c_dev_desc *dev);


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
