Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D3DCDB465
	for <linux-i3c@archiver.kernel.org>; Sat, 14 Oct 2023 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNtIoHkLmwAQt2IJMcnPuwgp0qWwW60Taaux6ix1puE=; b=0Q5g0z/NyBusRy
	2ec8JqDKOpymtiZhptGFYjVTV9jWhw7Zfar33vfjv5inZMT8w2PqKeLi/iQXGmCs/Idwk7XYVX/6O
	fwDgw3Wig7ZMP4NINU14J+ms8pGTJ7vclzzKuO+qOAVlbJpiDl7HwJEEW18ob1o5A5vtZ2zzBYpst
	uf8jbh/Dd4kEAcZvEBL75niz1clOxFOTTKgpgY73BRB+iIApMJ8xWN9RLI4kWpw0aQi2sYzL/vCNp
	HWgZVqYt8TaPTY8of0eKfBPx5nsPEFyKvBU45XGVUPwezNR8nru/ziZy0sIqpwgS6KP/ftr/plhQe
	sK+excIRztPSomu9ZNLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrgAO-005V37-02;
	Sat, 14 Oct 2023 15:03:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qquDH-000ral-0N
	for linux-i3c@lists.infradead.org;
	Thu, 12 Oct 2023 11:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697111444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8G9BJFYOzc03EQ9yDjtO1+7UhB6Xd2MPaqk4rXl7cSk=;
	b=fYnMcNZ8y6jLF402Ku7xP9pZ9PdM8Gcgp5vMZFoYELqO7dh1kfhuaUG5GOYtk8VejHewM1
	I7ZVps5Ezk6Nqo46sR/bPfFxZ7cdKFByEUIaVrCgwdb3NL+pLbLxkdnAu0WmOmDkfz34+z
	CW9K+hOKxxCVbPORSzDSdOwmiYYJAtk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-iLR97nkFOE2Fwpq81cXztw-1; Thu, 12 Oct 2023 07:50:43 -0400
X-MC-Unique: iLR97nkFOE2Fwpq81cXztw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-51e3bb0aeedso83109a12.0
        for <linux-i3c@lists.infradead.org>; Thu, 12 Oct 2023 04:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697111442; x=1697716242;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bDXs32bIFljFLB3BizuC8Qgv2eOciC1P7puQyz2ihO4=;
        b=YaBkyeM8BfreR7lzSlf2C3QiqmNrUUpt04E1W1pBAFks+FtdqU6yMQwr5PaFJjMsjX
         BVACMaYWBo77HnIiAg5tf/se1OHi68vT9npKKDbZdG+cbYQCN3PZCujTfFjTNnT5IIB0
         ga6WAJDwha7ZzUnDlfbdOr0v557LpGFFKamQxE/XewSnvbywvDCdVaD8qzklVbNWbJAc
         6HUgBdIcmVlUMWnLXROzwJ533Z4lNdzUrljLJsDDNi2hOLZ3yncdcAZm23L0P6Um3pG2
         a3m1XpFszOk8M+mq8Zy9KBPJ2D4/giLEf7iDCxRTV9O/VCi0JueP1pjSDxSOcFoXO44B
         o3Pg==
X-Gm-Message-State: AOJu0YzzJioJS8M3f8/A/6wg0wSp7iejBniMsBObuSULxljqXXqhZL6E
	Or7GXrDY2DgnbWdnLlLTKzoT0J3hmUq3GYeJeiRKcLfgmQIKb8K1Ov2j0dhVlgb+4XHqUR6zq4W
	YsaFCR9JKLzvlYgf3Kl3KilM0Mp6kuVnWTQ==
X-Received: by 2002:a50:cd81:0:b0:53e:1f8d:84ff with SMTP id p1-20020a50cd81000000b0053e1f8d84ffmr900949edi.4.1697111441957;
        Thu, 12 Oct 2023 04:50:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGILmsF//spivhREAdLAZ2FzBOeke68a6oyeQ/jW1i/MVexUg0ZO3nc/Cy71sg5eFpFdclJ4w==
X-Received: by 2002:a50:cd81:0:b0:53e:1f8d:84ff with SMTP id p1-20020a50cd81000000b0053e1f8d84ffmr900924edi.4.1697111441580;
        Thu, 12 Oct 2023 04:50:41 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-228-181.dyn.eolo.it. [146.241.228.181])
        by smtp.gmail.com with ESMTPSA id ee48-20020a056402293000b0053120f313cbsm3282462edb.39.2023.10.12.04.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 04:50:41 -0700 (PDT)
Message-ID: <e704c45bc3c81d45541b82bded0618380d81634f.camel@redhat.com>
Subject: Re: [PATCH net-next v5 3/3] mctp i3c: MCTP I3C driver
From: Paolo Abeni <pabeni@redhat.com>
To: Matt Johnston <matt@codeconstruct.com.au>,
 linux-i3c@lists.infradead.org,  netdev@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,  Eric Dumazet <edumazet@google.com>, Jeremy Kerr
 <jk@codeconstruct.com.au>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  miquel.raynal@bootlin.com
Date: Thu, 12 Oct 2023 13:50:39 +0200
In-Reply-To: <20231009025451.490374-4-matt@codeconstruct.com.au>
References: <20231009025451.490374-1-matt@codeconstruct.com.au>
	 <20231009025451.490374-4-matt@codeconstruct.com.au>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_045047_240264_012B0542 
X-CRM114-Status: GOOD (  21.59  )
X-Mailman-Approved-At: Sat, 14 Oct 2023 08:02:58 -0700
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

On Mon, 2023-10-09 at 10:54 +0800, Matt Johnston wrote:

> +static int mctp_i3c_setup(struct mctp_i3c_device *mi)
> +{
> +	bool ibi_set = false, ibi_enabled = false;
> +	const struct i3c_ibi_setup ibi = {
> +		.max_payload_len = 1,
> +		.num_slots = MCTP_I3C_IBI_SLOTS,
> +		.handler = mctp_i3c_ibi_handler,
> +	};
> +	struct i3c_device_info info;
> +	int rc;
> +
> +	i3c_device_get_info(mi->i3c, &info);
> +	mi->have_mdb = info.bcr & BIT(2);
> +	mi->addr = info.dyn_addr;
> +	mi->mwl = info.max_write_len;
> +	mi->mrl = info.max_read_len;
> +	mi->pid = info.pid;
> +
> +	rc = i3c_device_request_ibi(mi->i3c, &ibi);
> +	if (rc == 0) {
> +		ibi_set = true;
> +	} else if (rc == -ENOTSUPP) {
> +		/* This driver only supports In-Band Interrupt mode
> +		 * (ENOTSUPP is from the i3c layer, not EOPNOTSUPP).
> +		 * Support for Polling Mode could be added if required.
> +		 */
> +		dev_warn(i3cdev_to_dev(mi->i3c), "Failed, bus driver doesn't support In-Band Interrupts");
> +		goto err;
> +	} else {
> +		dev_err(i3cdev_to_dev(mi->i3c),
> +			"Failed requesting IBI (%d)\n", rc);
> +		goto err;
> +	}
> +
> +	if (ibi_set) {
> +		/* Device setup must be complete when IBI is enabled */
> +		rc = i3c_device_enable_ibi(mi->i3c);
> +		if (rc < 0) {
> +			/* Assume a driver supporting request_ibi also
> +			 * supports enable_ibi.
> +			 */
> +			dev_err(i3cdev_to_dev(mi->i3c),
> +				"Failed enabling IBI (%d)\n", rc);
> +			goto err;
> +		}
> +		ibi_enabled = true;
> +	}
> +
> +	return 0;
> +err:
> +	if (ibi_enabled)
> +		i3c_device_disable_ibi(mi->i3c);

Apparently no error code path can reach here with 'ibi_enabled ==
true', if so please drop the above lines.

> +	if (ibi_set)
> +		i3c_device_free_ibi(mi->i3c);
> +	return rc;
> +}
> +
> +/* Adds a new MCTP i3c_device to a bus */
> +static int mctp_i3c_add_device(struct mctp_i3c_bus *mbus,
> +			       struct i3c_device *i3c)
> +__must_hold(&busdevs_lock)
> +{
> +	struct mctp_i3c_device *mi = NULL;
> +	int rc;
> +
> +	mi = kzalloc(sizeof(*mi), GFP_KERNEL);
> +	if (!mi) {
> +		rc = -ENOMEM;
> +		goto err;
> +	}
> +	mi->mbus = mbus;
> +	mi->i3c = i3c;
> +	mutex_init(&mi->lock);
> +	list_add(&mi->list, &mbus->devs);
> +
> +	i3cdev_set_drvdata(i3c, mi);
> +	rc = mctp_i3c_setup(mi);
> +	if (rc < 0)
> +		goto err;

You can make the code simpler with:

		goto free;
> +
> +	return 0;

and here:

free:
	list_del(&mi->list);
	kfree(mi);

err:
	dev_warn(i3cdev_to_dev(i3c), "Error adding mctp-i3c device, %d\n", rc);
	return rc;

> +err:
> +	dev_warn(i3cdev_to_dev(i3c), "Error adding mctp-i3c device, %d\n", rc);
> +	if (mi) {
> +		list_del(&mi->list);
> +		kfree(mi);
> +	}
> +	return rc;
> +}
> +
> +static int mctp_i3c_probe(struct i3c_device *i3c)
> +{
> +	struct mctp_i3c_bus *b = NULL, *mbus = NULL;
> +	int rc;
> +
> +	/* Look for a known bus */
> +	mutex_lock(&busdevs_lock);
> +	list_for_each_entry(b, &busdevs, list)
> +		if (b->bus == i3c->bus) {
> +			mbus = b;
> +			break;
> +		}
> +	mutex_unlock(&busdevs_lock);
> +
> +	if (!mbus) {
> +		/* probably no "mctp-controller" property on the i3c bus */
> +		return -ENODEV;
> +	}
> +
> +	rc = mctp_i3c_add_device(mbus, i3c);
> +	if (!rc)
> +		goto err;

This is confusing: if 'rc' is zero (!rc) the function will return 0
('return rc' later), and otherwise it will return zero again.

Either ignore the return code, or more likely the error path need some
change.

> +static void mctp_i3c_xmit(struct mctp_i3c_bus *mbus, struct sk_buff *skb)
> +{
> +	struct net_device_stats *stats = &mbus->ndev->stats;
> +	struct i3c_priv_xfer xfer = { .rnw = false };
> +	struct mctp_i3c_internal_hdr *ihdr = NULL;
> +	struct mctp_i3c_device *mi = NULL;
> +	unsigned int data_len;
> +	u8 *data = NULL;
> +	u8 addr, pec;
> +	int rc = 0;
> +	u64 pid;
> +
> +	skb_pull(skb, sizeof(struct mctp_i3c_internal_hdr));
> +	data_len = skb->len;
> +
> +	ihdr = (void *)skb_mac_header(skb);
> +
> +	pid = get_unaligned_be48(ihdr->dest);
> +	mi = mctp_i3c_lookup(mbus, pid);
> +	if (!mi) {
> +		/* I3C endpoint went away after the packet was enqueued? */
> +		stats->tx_dropped++;
> +		goto out;
> +	}
> +
> +	if (WARN_ON_ONCE(data_len + 1 > MCTP_I3C_MAXBUF))
> +		goto out;
> +
> +	if (data_len + 1 > (unsigned int)mi->mwl) {
> +		/* Route MTU was larger than supported by the endpoint */
> +		stats->tx_dropped++;
> +		goto out;
> +	}
> +
> +	/* Need a linear buffer with space for the PEC */
> +	xfer.len = data_len + 1;
> +	if (skb_tailroom(skb) >= 1) {
> +		skb_put(skb, 1);
> +		data = skb->data;
> +	} else {
> +		// TODO: test this

I hope this comment is a left over? In any case please avoid c++ style
comments.

> +		/* Otherwise need to copy the buffer */
> +		skb_copy_bits(skb, 0, mbus->tx_scratch, skb->len);
> +		data = mbus->tx_scratch;
> +	}
> +
> +	/* PEC calculation */
> +	addr = mi->addr << 1;
> +	pec = i2c_smbus_pec(0, &addr, 1);
> +	pec = i2c_smbus_pec(pec, data, data_len);
> +	data[data_len] = pec;
> +
> +	xfer.data.out = data;
> +	rc = i3c_device_do_priv_xfers(mi->i3c, &xfer, 1);
> +	if (rc == 0) {
> +		stats->tx_bytes += data_len;
> +		stats->tx_packets++;
> +	} else {
> +		stats->tx_errors++;
> +	}
> +
> +out:
> +	if (mi)
> +		mutex_unlock(&mi->lock);
> +}
> +
> +static int mctp_i3c_tx_thread(void *data)
> +{
> +	struct mctp_i3c_bus *mbus = data;
> +	struct sk_buff *skb;
> +	unsigned long flags;
> +
> +	for (;;) {
> +		if (kthread_should_stop())
> +			break;
> +
> +		spin_lock_irqsave(&mbus->tx_lock, flags);
> +		skb = mbus->tx_skb;
> +		mbus->tx_skb = NULL;
> +		spin_unlock_irqrestore(&mbus->tx_lock, flags);
> +
> +		if (netif_queue_stopped(mbus->ndev))
> +			netif_wake_queue(mbus->ndev);
> +
> +		if (skb) {
> +			mctp_i3c_xmit(mbus, skb);
> +			kfree_skb(skb);
> +		} else {
> +			wait_event_idle(mbus->tx_wq,
> +					mbus->tx_skb || kthread_should_stop());
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static netdev_tx_t mctp_i3c_start_xmit(struct sk_buff *skb,
> +				       struct net_device *ndev)
> +{
> +	struct mctp_i3c_bus *mbus = netdev_priv(ndev);
> +	unsigned long flags;
> +	netdev_tx_t ret;
> +
> +	spin_lock_irqsave(&mbus->tx_lock, flags);

Why are you using the _irqsave variant? The only other path acquiring
this lock is mctp_i3c_tx_thread(), in process context, while here we
have BH disabled. Plain spin_lock should suffice here, paired with _BH
variant in mctp_i3c_tx_thread.

> +	netif_stop_queue(ndev);
> +	if (mbus->tx_skb) {
> +		dev_warn_ratelimited(&ndev->dev, "TX with queue stopped");
> +		ret = NETDEV_TX_BUSY;
> +	} else {
> +		mbus->tx_skb = skb;
> +		ret = NETDEV_TX_OK;
> +	}
> +	spin_unlock_irqrestore(&mbus->tx_lock, flags);
> +
> +	if (ret == NETDEV_TX_OK)
> +		wake_up(&mbus->tx_wq);
> +
> +	return ret;
> +}

[...]

> +/* Returns an ERR_PTR on failure */
> +static struct mctp_i3c_bus *mctp_i3c_bus_add(struct i3c_bus *bus)
> +__must_hold(&busdevs_lock)
> +{
> +	struct mctp_i3c_bus *mbus = NULL;
> +	struct net_device *ndev = NULL;
> +	char namebuf[IFNAMSIZ];
> +	u8 addr[PID_SIZE];
> +	int rc;
> +
> +	if (!mctp_i3c_is_mctp_controller(bus))
> +		return ERR_PTR(-ENOENT);
> +
> +	snprintf(namebuf, sizeof(namebuf), "mctpi3c%d", bus->id);
> +	ndev = alloc_netdev(sizeof(*mbus), namebuf, NET_NAME_ENUM,
> +			    mctp_i3c_net_setup);
> +	if (!ndev) {
> +		rc = -ENOMEM;
> +		goto err;
> +	}
> +
> +	mbus = netdev_priv(ndev);
> +	mbus->ndev = ndev;
> +	mbus->bus = bus;
> +	INIT_LIST_HEAD(&mbus->devs);
> +	list_add(&mbus->list, &busdevs);
> +
> +	rc = mctp_i3c_bus_local_pid(bus, &mbus->pid);
> +	if (rc < 0) {
> +		dev_err(&ndev->dev, "No I3C PID available\n");
> +		goto err;
> +	}
> +	put_unaligned_be48(mbus->pid, addr);
> +	dev_addr_set(ndev, addr);
> +
> +	init_waitqueue_head(&mbus->tx_wq);
> +	spin_lock_init(&mbus->tx_lock);
> +	mbus->tx_thread = kthread_run(mctp_i3c_tx_thread, mbus,
> +				      "%s/tx", ndev->name);
> +	if (IS_ERR(mbus->tx_thread)) {
> +		dev_warn(&ndev->dev, "Error creating thread: %pe\n",
> +			 mbus->tx_thread);
> +		rc = PTR_ERR(mbus->tx_thread);
> +		mbus->tx_thread = NULL;
> +		goto err;
> +	}
> +
> +	rc = mctp_register_netdev(ndev, NULL);
> +	if (rc < 0) {
> +		dev_warn(&ndev->dev, "netdev register failed: %d\n", rc);
> +		goto err;
> +	}
> +	return mbus;
> +err:
> +	/* uninit will not get called if a netdev has not been registered,
> +	 * so we perform the same mbus cleanup manually.
> +	 */
> +	if (mbus)
> +		mctp_i3c_bus_free(mbus);
> +	if (ndev)
> +		free_netdev(ndev);

A more conventional way of handling the error paths would be using
multiple labels, e.g.:

err_free_bus:
	mctp_i3c_bus_free(mbus);

err_free_ndev:
	free_netdev(ndev);

err:

> +	return ERR_PTR(rc);
> +}

Cheers,

Paolo


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
