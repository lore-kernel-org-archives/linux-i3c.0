Return-Path: <SRS0=ob38=LC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949DFC4743D
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Jun 2021 23:33:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3159D61246
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Jun 2021 23:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3159D61246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNQleXu+Ks3wTgzUC4SLMtW2soEmMa4w30VOKnyD6xg=; b=BJWd2R+reQrmbA
	nf7Xd+JvzyyQoTQ/Qv+jFvvG+AiKpfYfdiupKfNtItrW9fy3xSMq2pUyUoa0GTpysbfIZVK4h4a1o
	3ZI0RehqSGi3Mzcbpel1+gul/Z15u2UsA/YC7bpDTb3tBFtkEJBZqX6HmHzGxxThRrFvMNRBIngBh
	79qw9K3xiMaq64ab9bMJNEszFdA94YH+uC6/K2TxONmZOnV7FR91UaOxLHwrOcmsXafrr2UArFWI6
	U2tqfYG9tncJsp/rHo3yUEhPFItwMnytmlWrQA9pVuLGdzviFS6gm2yTMIICEiLdVq4hIkrGo7WB1
	DuElZfZcH6C2/V8HNQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqlE0-00AlXo-GI; Tue, 08 Jun 2021 23:33:36 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqlDw-00AlXA-QL
 for linux-i3c@lists.infradead.org; Tue, 08 Jun 2021 23:33:34 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 77F6E20002;
 Tue,  8 Jun 2021 23:33:27 +0000 (UTC)
Date: Wed, 9 Jun 2021 01:33:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Parshuram Thombare <pthombar@cadence.com>
Cc: slongerbeam@gmail.com, vitor.soares@synopsys.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 mparab@cadence.com, praneeth@ti.com
Subject: Re: [PATCH v10 6/7] i3c: master: sysfs key for acquire bus
Message-ID: <YL/+RvUEqniqcwRt@piout.net>
References: <1606716983-3645-1-git-send-email-pthombar@cadence.com>
 <1606717202-4206-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606717202-4206-1-git-send-email-pthombar@cadence.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_163333_015634_04133D27 
X-CRM114-Status: GOOD (  16.10  )
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

On 30/11/2020 07:20:02+0100, Parshuram Thombare wrote:
> Added support to acquire I3C bus through sysfs interface.
> 
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
>  drivers/i3c/master.c |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index c01ba00..beb7495 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -581,6 +581,23 @@ static ssize_t i2c_scl_frequency_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(i2c_scl_frequency);
>  
> +static ssize_t i3c_acquire_bus_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
> +	int ret;
> +
> +	i3c_bus_normaluse_lock(&master->bus);
> +	ret = i3c_master_acquire_bus(master);
> +	i3c_bus_normaluse_unlock(&master->bus);
> +	if (!ret)
> +		i3c_master_enable_mr_events(master);
> +
> +	return ret ?: count;
> +}
> +static DEVICE_ATTR_WO(i3c_acquire_bus);
> +

I'm wondering whether we should allow userspace to actually control
that. Shouldn't we simply request mastership when a driver needs to talk
to a device on the bus? Is it really useful to have that until there is
an i3c-dev userspace interface?

>  static struct attribute *i3c_masterdev_attrs[] = {
>  	&dev_attr_mode.attr,
>  	&dev_attr_current_master.attr,
> @@ -591,6 +608,7 @@ static ssize_t i2c_scl_frequency_show(struct device *dev,
>  	&dev_attr_pid.attr,
>  	&dev_attr_dynamic_address.attr,
>  	&dev_attr_hdrcap.attr,
> +	&dev_attr_i3c_acquire_bus.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(i3c_masterdev);
> -- 
> 1.7.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
