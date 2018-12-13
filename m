Return-Path: <SRS0=JcjT=OW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_MIXED_ES,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90DCC65BAE
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:44:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5D2F20870
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mHY65NoR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGgFqfgr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5D2F20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2hbZF4vvnKXfvdTuQ78+8Cmb/7q6amqr+caLy3QcE4=; b=mHY65NoR8ftM9g
	Y2g7fNa8fOGK4X4a1ZGW/uFYL3IR7hGj0vxPka5JTEIVahvVo+MvPrP+RVEAlJog3HucF/TzK0uQV
	xPBYgCq3b9+sfAUKn5GGLJPTjstMq2hbbVNgq1zaHeMypw7zwVUWzUC4vmA/xQC8TjmbekRydTk/T
	/lN5PSRWyA0V6XwMF4XM6XuVplrHFs8VuuIgp2xSL9Ffp5WaVy2Nb+iAJUA9g73jFuq6WPPjc8rfO
	2US5kkDmJ/qeUQ4Pb6K3M0BqgPeMvassRXq8k97uRSR7M1GNT7CxmEDGEKzVkMSGMnMC3dBj39c91
	joWAqxGu7des672KyE4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXQM9-0004N8-7y; Thu, 13 Dec 2018 12:44:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXQM5-0003w8-JQ
 for linux-i3c@lists.infradead.org; Thu, 13 Dec 2018 12:44:43 +0000
Received: from bbrezillon (aaubervilliers-681-1-89-7.w90-88.abo.wanadoo.fr
 [90.88.30.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50D5A20870;
 Thu, 13 Dec 2018 12:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544705070;
 bh=M1AAYpTxsgNCU6o6lx5bFpvs9R+HnPaa8TYI6+lpMqs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BGgFqfgrEOoOvWc8Y51HAvj+1prM7ouoO14CQh2jJBEgyxBcm3B+Mz8+QMYxrTFEk
 mC+8LuW8qIhxXZ3N9lWDNvou619CoeaY3fd8ThenHv+ffGOxeImx7T2DnnGzxk7Jon
 s7bdrBQv24j6y8MTW+ayR3Bm6VD+8LvmwRJJmPxY=
Date: Thu, 13 Dec 2018 13:44:22 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH 1/2] i3c: Add support for HDR modes.
Message-ID: <20181213134422.30bdc7c4@bbrezillon>
In-Reply-To: <efb3b8692d3579ab3369cc0f80e237550f3e8209.1544702829.git.pgaj@cadence.com>
References: <cover.1544702829.git.pgaj@cadence.com>
 <efb3b8692d3579ab3369cc0f80e237550f3e8209.1544702829.git.pgaj@cadence.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_044441_693077_73621B1A 
X-CRM114-Status: GOOD (  23.79  )
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
Cc: linux-i3c@lists.infradead.org, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 13 Dec 2018 12:18:31 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> HDR (High Data Rate) modes is an important feature of the I3C protocol
> as it allows to get higher throughput than with the SDR (Single Data
> Rate) mode.
> 
> Add new controller hooks and extend the I3C device API to expose this
> new feature.
> 
> This feature was originally created by Boris Brezillon
> <boris.brezillon@bootlin.com>.

You should keep the orginal author and it's SoB and then add your own
SoB.

> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> ---
>  drivers/i3c/device.c       | 37 +++++++++++++++++++++++++++++++++++++
>  drivers/i3c/internals.h    |  3 +++
>  drivers/i3c/master.c       | 31 +++++++++++++++++++++++++++++++
>  include/linux/i3c/device.h | 29 +++++++++++++++++++++++++++++
>  include/linux/i3c/master.h |  7 +++++++
>  5 files changed, 107 insertions(+)
> 
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index 69cc040..97910aa 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -51,6 +51,43 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>  EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
>  
>  /**
> + * i3c_device_send_hdr_cmds() - send HDR commands to a specific device
> + *
> + * @dev: device to which these commands should be sent
> + * @xfers: array of commands
> + * @nxfers: number of commands
> + *
> + * Send one or several HDR commands to @dev.
> + *
> + * This function can sleep and thus cannot be called in atomic context.
> + *
> + * Return: 0 in case of success, a negative error core otherwise.
> + */
> +int i3c_device_send_hdr_cmds(struct i3c_device *dev,
> +			     struct i3c_hdr_cmd *cmds,
> +			     int ncmds)
> +{
> +	int ret, i;
> +	enum i3c_hdr_mode mode;
> +
> +	if (ncmds < 1)
> +		return 0;
> +
> +	mode = cmds[0].mode;
> +	for (i = 1; i < ncmds; i++) {
> +		if (mode != cmds[i].mode)
> +			return -EINVAL;
> +	}
> +
> +	i3c_bus_normaluse_lock(dev->bus);
> +	ret = i3c_dev_send_hdr_cmds_locked(dev->desc, cmds, ncmds);
> +	i3c_bus_normaluse_unlock(dev->bus);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_device_send_hdr_cmds);
> +
> +/**
>   * i3c_device_get_info() - get I3C device information
>   *
>   * @dev: device we want information on
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 86b7b44..46c4de7 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -18,6 +18,9 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
>  int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  				 struct i3c_priv_xfer *xfers,
>  				 int nxfers);
> +int i3c_dev_send_hdr_cmds_locked(struct i3c_dev_desc *dev,
> +				 struct i3c_hdr_cmd *cmds,
> +				 int ncmds);
>  int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
>  int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
>  int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index e98b600..16d6dd5 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2791,6 +2791,37 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  	return master->ops->priv_xfers(dev, xfers, nxfers);
>  }
>  
> +int i3c_dev_send_hdr_cmds_locked(struct i3c_dev_desc *dev,
> +				 struct i3c_hdr_cmd *cmds,
> +				 int ncmds)
> +{
> +	struct i3c_master_controller *master;
> +	int i;
> +
> +	if (!dev)
> +		return -ENOENT;
> +
> +	master = i3c_dev_get_master(dev);
> +	if (!master || !cmds)
> +		return -EINVAL;
> +
> +	if (master->op_mode == I3C_SLAVE_MODE) {
> +		if (i3c_master_request_mastership(master))
> +			return -EIO;
> +	}
> +
> +	if (!master->ops->send_hdr_cmds)
> +		return -ENOTSUPP;
> +
> +	for (i = 0; i < ncmds; i++) {
> +		if (!(master->this->info.hdr_cap & BIT(cmds->mode)))
> +			return -ENOTSUPP;
> +	}
> +
> +	return master->ops->send_hdr_cmds(dev, cmds, ncmds);
> +}
> +
> +
>  int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master;
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 5ecb055..75a947f 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -49,6 +49,31 @@ enum i3c_hdr_mode {
>  	I3C_HDR_TSL,
>  };
>  
> +#define I3C_HDR_GEN_WRITE_CMD(id)    	(id)
> +#define I3C_HDR_VENDOR_WRITE_CMD(id) 	(0x20 + (id))
> +#define I3C_HDR_IS_READ_CMD        	BIT(7)
> +#define I3C_HDR_GEN_READ_CMD(id)    	(0x80 + (id))
> +#define I3C_HDR_VENDOR_READ_CMD(id)    	(0xa0 + (id))
> +
> +/**
> + * struct i3c_hdr_cmd - I3C HDR command
> + * @mode: HDR mode selected for this command
> + * @code: command opcode. Bit 7 encodes the direction of the data transfer, if
> + *      set this is a read, otherwise this is a write
> + * @ndatawords: number of data words (a word is 16bits wide) to transfer
> + * @data: input/output buffer
> + */
> +struct i3c_hdr_cmd {
> +    enum i3c_hdr_mode mode;
> +    u8 code;
> +    int ndatawords;
> +    union {
> +        u16 *in;
> +        const u16 *out;
> +    } data;
> +};
> +
> +
>  /**
>   * struct i3c_priv_xfer - I3C SDR private transfer
>   * @rnw: encodes the transfer direction. true for a read, false for a write
> @@ -289,6 +314,10 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>  			     struct i3c_priv_xfer *xfers,
>  			     int nxfers);
>  
> +int i3c_device_send_hdr_cmds(struct i3c_device *dev,
> +			     struct i3c_hdr_cmd *cmds,
> +			     int ncmds);
> +
>  void i3c_device_get_info(struct i3c_device *dev, struct i3c_device_info *info);
>  
>  struct i3c_ibi_payload {
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index ada956a..fd50473 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -386,6 +386,10 @@ struct i3c_bus {
>   *		  This method is mandatory.
>   * @priv_xfers: do one or several private I3C SDR transfers
>   *		This method is mandatory.
> + * @send_hdr_cmds: send one or several HDR commands. If there is more than one
> + *		   command, they should ideally be sent in the same HDR
> + *		   transaction.
> + *		   This method is optional.
>   * @attach_i2c_dev: called every time an I2C device is attached to the bus.
>   *		    This is a good place to attach master controller specific
>   *		    data to I2C devices.
> @@ -457,6 +461,9 @@ struct i3c_master_controller_ops {
>  	int (*priv_xfers)(struct i3c_dev_desc *dev,
>  			  struct i3c_priv_xfer *xfers,
>  			  int nxfers);
> +	int (*send_hdr_cmds)(struct i3c_dev_desc *dev,
> +			     const struct i3c_hdr_cmd *cmds,
> +			     int ncmds);
>  	int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
>  	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
>  	int (*i2c_xfers)(struct i2c_dev_desc *dev,


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
