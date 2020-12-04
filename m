Return-Path: <SRS0=aOv0=FI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA905C433FE
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Dec 2020 04:24:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 047F022472
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Dec 2020 04:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 047F022472
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=99OfRyXpqG7iINwzKOs/xDg2I6q+FparrsDlI442tY8=; b=akNJYOTA6aswYFWdhAHTpqVrj
	Kmeo6Da8d3H1mVpH821PYYup0BKg4TQdK42q0Wx7/eYyzXke+V+RhIyklG9UzMyLN2clCQBZvGp7J
	8RRq+GCdQu+UugH0YtL7tOkReDAVlgKtkdhH5SLnB7dKmGMnxxEhiaImo5JW4LonowdlGnIyG+8bR
	MKX2BPk5W3EoAswraUo8xDcm1M8EjrhLHsQFwr5VngMVL0iD6tdCcz3pYo0nF0ypSB9Rw+Q1cis63
	rr4iS0jPsSY8B8D+v1Tpw1Yqs37s7J0hzUe5nGQCb9+qMeLnL2ccTR9bo2rrcp/BJ9kkuseFopWoa
	MNiYOts2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl2do-000689-Ab; Fri, 04 Dec 2020 04:24:20 +0000
Received: from pb-smtp21.pobox.com ([173.228.157.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl2dl-00067e-30
 for linux-i3c@lists.infradead.org; Fri, 04 Dec 2020 04:24:18 +0000
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 8ED61111CA9;
 Thu,  3 Dec 2020 23:24:10 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=3PN7+dhj56TpvZ/QEmMRDjeq+70=; b=m0is3n
 lruKj+Mxrr/Ats9nNhNbId/4G3c7o7OhzbO4GO80amr33WkTNd3QewIw09HcRYqi
 dmFrAXQ34iCyu4gBw/KKD1voM4ynH2ot8KF/kwVMuemR4jTnglXk0xMpbKqARAYb
 onWn2VQsZehT0bTW3OQHSuNlwwiiHBEkKEzSk=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 87245111CA8;
 Thu,  3 Dec 2020 23:24:10 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=wYsG55wCwVlnNuBZDyuyP9nA7lynkKBaXTgh1MoGBCI=;
 b=aFsxI2/INdj5cIUuXWogCLdJzLhU0oioyHZ+MFEWed4sdGZzUsq4RgR1P+ijrntXMY8fpDG845udCAnI6oQhf3pV0P0yXhn+OVnr01oaYm3G77W/9SnQvX80kjgEibf+lhGGRID1HQ6wQcrw1aSHqJUPSH5e9I5tptJ3AY8Bpms=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 65654111CA7;
 Thu,  3 Dec 2020 23:24:07 -0500 (EST)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 9844F2DA0639;
 Thu,  3 Dec 2020 23:24:05 -0500 (EST)
Date: Thu, 3 Dec 2020 23:24:05 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v10 2/7] i3c: master: use i3c_master_register only for
 main master
In-Reply-To: <1606717066-3785-1-git-send-email-pthombar@cadence.com>
Message-ID: <2s3n7419-1nr9-8885-882o-7qrsos6qq6q@syhkavp.arg>
References: <1606716983-3645-1-git-send-email-pthombar@cadence.com>
 <1606717066-3785-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 8CB4D5B0-35E8-11EB-87AA-D609E328BF65-78420484!pb-smtp21.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_232417_355326_97A1FB3C 
X-CRM114-Status: GOOD (  13.87  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: mparab@cadence.com, alexandre.belloni@bootlin.com, praneeth@ti.com,
 linux-kernel@vger.kernel.org, vitor.soares@synopsys.com, slongerbeam@gmail.com,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 30 Nov 2020, Parshuram Thombare wrote:

> Removed last argument 'secondary' and restructured i3c_master_register
> to move code that can be common to i3c_secondary_master_register
> to separate function i3c_master_init.
> 
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>

[...]

> +static int i3c_master_init(struct i3c_master_controller *master,
> +			   struct device *parent,
> +			   const struct i3c_master_controller_ops *ops,
> +			   bool secondary)
>  {
>  	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
>  	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
> @@ -2535,10 +2514,49 @@ int i3c_master_register(struct i3c_master_controller *master,
>  		goto err_put_dev;
>  	}
>  
> -	ret = i3c_master_bus_init(master);
> +	ret = i3c_primary_master_bus_init(master);
>  	if (ret)
>  		goto err_destroy_wq;
>  
> +	return 0;
> +
> +err_destroy_wq:
> +	destroy_workqueue(master->wq);
> +
> +err_put_dev:
> +	put_device(&master->dev);
> +
> +	return ret;
> +}

[...]

> +int i3c_primary_master_register(struct i3c_master_controller *master,
> +				struct device *parent,
> +				const struct i3c_master_controller_ops *ops)
> +{
> +	int ret;
> +
> +	ret = i3c_master_init(master, parent, ops, false);
> +	if (ret)
> +		return ret;
> +
>  	ret = device_add(&master->dev);
>  	if (ret)
>  		goto err_cleanup_bus;
> @@ -2568,15 +2586,13 @@ int i3c_master_register(struct i3c_master_controller *master,
>  err_cleanup_bus:
>  	i3c_master_bus_cleanup(master);
>  
> -err_destroy_wq:
>  	destroy_workqueue(master->wq);
>  
> -err_put_dev:
>  	put_device(&master->dev);
>  
>  	return ret;
>  }

This looks a bit confusing. Here you're rolling back detailss in 
i3c_primary_master_register() that were factored out in 
i3c_master_init(). If i3c_master_init() is successful, then you 
shouldn't be undoing its things openly in i3c_primary_master_register(). 
Instead, there should be another function that does the reverse of 
i3c_master_init() here.


Nicolas

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
