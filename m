Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D299EB64DA
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Jul 2023 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8m6hKpFPwgD+sh3Krjh7bTNTKqeiX1m3vbyPoTJzrzc=; b=S+cRLdbaU+NS4D
	jkfTKoNNT8RkuWXT9xS1o1LBo9m8WnhIQA9k7mTX+9ninvMSzW1fa+pkV/KzzBNeO4RAKMh6ZQT/C
	n6mAT9RiLXCKBXRYD62PAZuZh7+svAvY6xSBytSlaQ7dHI+KTVwEmO4gvaM+0MlOBakAVv5qrv/sW
	i/MUC8VCUN0SNnsd13XbW+E9IucArHEiiLIxlfIazaqmx3MJuNx19EOgH9jXrdqZ8yOJWB4TAHSqt
	W7qnP/NEAFogDnR8mwZpQjLNI+WroLtabYHB0RqwmemUTx/K43jr2IPookxyxjwsmQPcxXIrFIyUd
	NXBT6W7bB2kb1auoEM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM3Cc-006Vfm-2b;
	Wed, 19 Jul 2023 09:10:34 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM3Ca-006Vf6-08
	for linux-i3c@lists.infradead.org;
	Wed, 19 Jul 2023 09:10:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D2ED1BF20D;
	Wed, 19 Jul 2023 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689757829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q1eVxvJoHRW/P/5bJgfspjlVG3ESYGo71QPyGyqj6VU=;
	b=i1ML7HlnJtI1Eoq6gTI6hWHyNmy87FERW4SLnATfYDjeoLgit+HviupMf5bNipk940P3is
	Cve2b7gooMnmPeESQu5vY049yz84+RwGFfkPr3yRoMmaw6yVikkHYN6iyRjGwef1Ww3Qtf
	LO/nIlJFEpuaitV6pqFKTyagiRFk9i75PmEAa5Etr+3g8Cx2JNXuFbIp5vsJrcSBA+p0fz
	ofZHC8sK8rsZSe5S0R8TqvE5hyaafJ3lkJX6joeObzKtaRtA9s3nFKB0G3tNsbLMlqtLPs
	/6kv2vM6E34DsBnsefgFf8m4wzTZMLoNiZ//JQ2T8zFiOZwml9vDE/6DU7gY1g==
Date: Wed, 19 Jul 2023 11:10:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Jeremy Kerr <jk@codeconstruct.com.au>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next v2 2/3] i3c: Add support for bus enumeration &
 notification
Message-ID: <2023071909102651470012@mail.local>
References: <20230717040638.1292536-1-matt@codeconstruct.com.au>
 <20230717040638.1292536-3-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230717040638.1292536-3-matt@codeconstruct.com.au>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_021032_341949_3FA6D1C1 
X-CRM114-Status: GOOD (  19.31  )
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

On 17/07/2023 12:06:37+0800, Matt Johnston wrote:
> From: Jeremy Kerr <jk@codeconstruct.com.au>
> 
> This allows other drivers to be notified when new i3c busses are
> attached, referring to a whole i3c bus as opposed to individual
> devices.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/i3c/master.c       | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/i3c/master.h | 11 +++++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 08aeb69a7800..2276abe38bdc 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -22,6 +22,7 @@
>  static DEFINE_IDR(i3c_bus_idr);
>  static DEFINE_MUTEX(i3c_core_lock);
>  static int __i3c_first_dynamic_bus_num;
> +static BLOCKING_NOTIFIER_HEAD(i3c_bus_notifier);
>  
>  /**
>   * i3c_bus_maintenance_lock - Lock the bus for a maintenance operation
> @@ -453,6 +454,36 @@ static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
>  	return 0;
>  }
>  
> +void i3c_for_each_bus_locked(int (*fn)(struct i3c_bus *bus, void *data),
> +			     void *data)
> +{
> +	struct i3c_bus *bus;
> +	int id;
> +
> +	mutex_lock(&i3c_core_lock);
> +	idr_for_each_entry(&i3c_bus_idr, bus, id)
> +		fn(bus, data);
> +	mutex_unlock(&i3c_core_lock);
> +}
> +EXPORT_SYMBOL_GPL(i3c_for_each_bus_locked);
> +
> +int i3c_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&i3c_bus_notifier, nb);
> +}
> +EXPORT_SYMBOL_GPL(i3c_register_notifier);
> +
> +int i3c_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&i3c_bus_notifier, nb);
> +}
> +EXPORT_SYMBOL_GPL(i3c_unregister_notifier);
> +
> +static void i3c_bus_notify(struct i3c_bus *bus, unsigned int action)
> +{
> +	blocking_notifier_call_chain(&i3c_bus_notifier, action, bus);
> +}
> +
>  static const char * const i3c_bus_mode_strings[] = {
>  	[I3C_BUS_MODE_PURE] = "pure",
>  	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
> @@ -2678,6 +2709,8 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	if (ret)
>  		goto err_del_dev;
>  
> +	i3c_bus_notify(i3cbus, I3C_NOTIFY_BUS_ADD);
> +
>  	/*
>  	 * We're done initializing the bus and the controller, we can now
>  	 * register I3C devices discovered during the initial DAA.
> @@ -2710,6 +2743,8 @@ EXPORT_SYMBOL_GPL(i3c_master_register);
>   */
>  void i3c_master_unregister(struct i3c_master_controller *master)
>  {
> +	i3c_bus_notify(&master->bus, I3C_NOTIFY_BUS_REMOVE);
> +
>  	i3c_master_i2c_adapter_cleanup(master);
>  	i3c_master_unregister_i3c_devs(master);
>  	i3c_master_bus_cleanup(master);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 0b52da4f2346..db909ef79be4 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -24,6 +24,12 @@
>  
>  struct i2c_client;
>  
> +/* notifier actions. notifier call data is the struct i3c_bus */
> +enum {
> +	I3C_NOTIFY_BUS_ADD,
> +	I3C_NOTIFY_BUS_REMOVE,
> +};
> +
>  struct i3c_master_controller;
>  struct i3c_bus;
>  struct i3c_device;
> @@ -652,4 +658,9 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
>  
>  struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
>  
> +void i3c_for_each_bus_locked(int (*fn)(struct i3c_bus *bus, void *data),
> +			     void *data);
> +int i3c_register_notifier(struct notifier_block *nb);
> +int i3c_unregister_notifier(struct notifier_block *nb);
> +
>  #endif /* I3C_MASTER_H */
> -- 
> 2.37.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
