Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29920D3C92B
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Dec 2025 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmnVUWhDUKz+wiDt0WjNrcO+8Hl0TGIv+gUfixmuobM=; b=FWW3fdNd8R6UQw
	hIOVDpqtAr8DLJkIuNN3X/qEOv5S2lWz1BRR75Kz9QAyPk4NmR+jVYrcMqwyp9ChNcgcWvY+vxXtb
	1kdGMp5eVaxUITxFF0Nxpo0sRYDYZp67bLw+hbI3kFVmvHx7B7RiN+IFAwa1K2XuZhHcvxIajYnGS
	7P/UWR43x6UohUiRDn8OP+44/fYOaNcFh7UHfPkSLKQoPoneLatshEb+ip2MMBeLD3WXE/M5Whp18
	SXHg4zzEqusJkg+tBiSdZEXs297jsJSbuY5twLvD/H7ACVwZLa3/2MPdXKNRg4wsRv9vL5+vijVWR
	+jpVVN2R8JQHtetLBDOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMxU-0000000FdhX-3oec;
	Wed, 10 Dec 2025 16:22:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMxS-0000000Fdh4-1M3H
	for linux-i3c@lists.infradead.org;
	Wed, 10 Dec 2025 16:22:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 874241A20B0;
	Wed, 10 Dec 2025 16:22:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5CE3860714;
	Wed, 10 Dec 2025 16:22:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A03FA11931AEA;
	Wed, 10 Dec 2025 17:22:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765383748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QReKVCY3TB+TgRCdmU1mtN6zHq3e6dQ9Od5YC1EYm1Q=;
	b=kpqczu5T9vFQxyR7fBsN/jb5JN0ccjiyJYlmbwIhHhpuhxE0XeZ981y4BzuY06b0v7GMZP
	T3F25rEHNS78U2YUXc7JxBsnK3JxaaMbKOLvvGR99v6khX9xu69osaftBv2XfFdUxyVpOn
	Xj/h693WRJF7T3ChKnDCjWoCwgnKBUJK0/QBhINuIyHpLmNITv1KVWExAvLHDwd4i6zz5f
	gNAEC559kYq6E3oV7K1OVAS6QPxxU2FOAg5ZihwyP84WylZYq5gz+VtBfMPFhokvll0U/0
	hHWEV1pnEJirtkxzibOI1kSjXB2A5C1DkBsJ6Bt5LU1Dqc15wvKmdBuvPAkbdw==
Date: Wed, 10 Dec 2025 17:22:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: adrianhoyin.ng@altera.com
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] i3c: add sysfs attribute for device NACK retry
Message-ID: <20251210162227450e28fd@mail.local>
References: <cover.1765177110.git.adrianhoyin.ng@altera.com>
 <39c0289a838af7e6bbc5736f0d114b2e895556b3.1765177110.git.adrianhoyin.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39c0289a838af7e6bbc5736f0d114b2e895556b3.1765177110.git.adrianhoyin.ng@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_082230_495872_95E1F39A 
X-CRM114-Status: GOOD (  22.76  )
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

On 08/12/2025 15:11:17+0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> Add a `dev_nack_retry` sysfs attribute to allow reading and updating the
> device NACK retry count. A new `dev_nack_retry` field and an optional
> `set_dev_nack_retry()` callback are added to i3c_master_controller.
> The attribute is created only when the callback is implemented.
> 
> Updates are applied under the I3C bus maintenance lock to ensure safe
> hardware reconfiguration.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/i3c/master.c       | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/master.h |  6 ++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index d946db75df70..2903725bee03 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -685,6 +685,38 @@ static ssize_t hotjoin_show(struct device *dev, struct device_attribute *da, cha
>  
>  static DEVICE_ATTR_RW(hotjoin);
>  
> +static ssize_t dev_nack_retry_show(struct device *dev, struct device_attribute *attr,
> +				   char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", dev_to_i3cmaster(dev)->dev_nack_retry);
> +}
> +
> +static ssize_t dev_nack_retry_store(struct device *dev, struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> +	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	i3c_bus_maintenance_lock(i3cbus);
> +	ret = master->ops->set_dev_nack_retry(master, val);
> +	i3c_bus_maintenance_unlock(i3cbus);
> +
> +	if (ret)
> +		return ret;
> +
> +	master->dev_nack_retry = val;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dev_nack_retry);

Shouldn't that be dev_nack_retry_count ?

> +
>  static struct attribute *i3c_masterdev_attrs[] = {
>  	&dev_attr_mode.attr,
>  	&dev_attr_current_master.attr,
> @@ -2962,6 +2994,9 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	i3c_master_register_new_i3c_devs(master);
>  	i3c_bus_normaluse_unlock(&master->bus);
>  
> +	if (master->ops->set_dev_nack_retry)
> +		device_create_file(&master->dev, &dev_attr_dev_nack_retry);
> +
>  	return 0;
>  
>  err_del_dev:
> @@ -2987,6 +3022,9 @@ void i3c_master_unregister(struct i3c_master_controller *master)
>  {
>  	i3c_bus_notify(&master->bus, I3C_NOTIFY_BUS_REMOVE);
>  
> +	if (master->ops->set_dev_nack_retry)
> +		device_remove_file(&master->dev, &dev_attr_dev_nack_retry);
> +
>  	i3c_master_i2c_adapter_cleanup(master);
>  	i3c_master_unregister_i3c_devs(master);
>  	i3c_master_bus_cleanup(master);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index c52a82dd79a6..5a03e5aea6c2 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -462,6 +462,8 @@ struct i3c_bus {
>   * @enable_hotjoin: enable hot join event detect.
>   * @disable_hotjoin: disable hot join event detect.
>   * @set_speed: adjust I3C open drain mode timing.
> + * @set_dev_nack_retry: configure device NACK retry count for the master
> + *                      controller.
>   */
>  struct i3c_master_controller_ops {
>  	int (*bus_init)(struct i3c_master_controller *master);
> @@ -491,6 +493,8 @@ struct i3c_master_controller_ops {
>  	int (*enable_hotjoin)(struct i3c_master_controller *master);
>  	int (*disable_hotjoin)(struct i3c_master_controller *master);
>  	int (*set_speed)(struct i3c_master_controller *master, enum i3c_open_drain_speed speed);
> +	int (*set_dev_nack_retry)(struct i3c_master_controller *master,
> +				  unsigned long dev_nack_retry_cnt);
>  };
>  
>  /**
> @@ -510,6 +514,7 @@ struct i3c_master_controller_ops {
>   * @boardinfo: board-level information attached to devices connected on the bus
>   * @bus: I3C bus exposed by this master
>   * @wq: workqueue which can be used by master
> + * @dev_nack_retry: retry count when slave device nack
>   *	drivers if they need to postpone operations that need to take place
>   *	in a thread context. Typical examples are Hot Join processing which
>   *	requires taking the bus lock in maintenance, which in turn, can only
> @@ -534,6 +539,7 @@ struct i3c_master_controller {
>  	} boardinfo;
>  	struct i3c_bus bus;
>  	struct workqueue_struct *wq;
> +	unsigned int dev_nack_retry;
>  };
>  
>  /**
> -- 
> 2.49.GIT
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
