Return-Path: <SRS0=Oe6K=L6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34F7C07E9E
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jul 2021 20:43:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A21FA61C81
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jul 2021 20:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A21FA61C81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwyvZlXj/k6dCU9wTTsdm9bZ5PPyfPkFj7VzXw1qhqI=; b=Pwlr/3zs1c/gVK
	M4qQtVikHJTMBbNIRWycF7jv0+bT9WpEzKzUEEm2KQSggp0uIZXGxu6dtY0O3Imtsr27gomBztlTH
	WLYSZvp37dA5CeS6dt7fip86ccmk+hC/56QNCBvDyhNfg7flMf8xfTYC/MBmQKp0WuKsuYRZatttj
	2w6d4+EfEcvUtzOIH8kF8f6PqFi7Zmw/xI10VALzDarwj524QeiJWI3S7T1wlZEKjuVD3XiWIq6jJ
	BRlOXUjx/+eV/gXRKMzWCYRBny31v+LNy61HneFOwTe6RMXLLoXmKuOgIhV3/DRk+gCLbPstMBGH+
	QkUVWbC0VdzLJemRr4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0rus-00Co61-W1; Tue, 06 Jul 2021 20:43:39 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ruf-00Co3V-CF
 for linux-i3c@lists.infradead.org; Tue, 06 Jul 2021 20:43:27 +0000
Received: by mail-oo1-xc30.google.com with SMTP id
 68-20020a4a00470000b0290258a7ff4058so1432288ooh.10
 for <linux-i3c@lists.infradead.org>; Tue, 06 Jul 2021 13:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pxMY07o9eA6SvMdwqfO/Cy/RP18zRy8WHvKUzTEaaNE=;
 b=cMEULcwqLZ1Wut54PhoGe8eWn9DWOkTBGefRRfl5OdVDl+rs626G5wMaH28cgDjzcy
 C3SrxS4IBWN9GT87WmK8g47N1LXQplCWDOfx8int0/GS3k/x/nkilLmTHNlFEJRG7MNd
 XBIkEEXZ1pU0eRvjS1TRSvA1B76ydqAA34SpYmKB2ihzHjiFB86o3rkOkpvBUwbSv3hH
 SAJ7sWW3535WnApBT/aqgm8mqOlZd3rAIlZ18pf5XSKHOT2S+byWJIp1xZIbcvBH0etl
 zsjB18jSpkL6JUn2+voD9bKAbUaWuj/V1AbjBFUkZHMHiCqgtvfqmj4sQqDjclnu51kM
 rRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pxMY07o9eA6SvMdwqfO/Cy/RP18zRy8WHvKUzTEaaNE=;
 b=ahlnXvXMk8q4A4WojUKdVygt2Np9IhoTbnafE6WzGghJdvpzlYGmMTFoN+UXlk58NN
 cyqqZgcS6CG5+HGOpbcGzY5OKI0VlzY4U1KCy0juqnGuLgYWB2l2hlYXCK4msPSBUsfy
 ZYVH8gw+o6Yc47x9vd3Y0ZeLK/BLcSurf+4gkzAysQTXoKHSNie7bLFQHGWhVQ7JZ+pS
 nsUy58zsEHGlM+y0Bi57tg4W6x+vsj3hkqCJjZCYNu3tovPTV9f4kzBejSrBJQ2PkDtX
 OB0Ytw4zaxN5RVU/3yJk1Kgr+kFaJB1agWvRX+O2EJHDz+hjGOYB8laKCxP+9V5VdhnK
 HdWw==
X-Gm-Message-State: AOAM533yx58k7HwY2g8uBsujxflXIfK8x2ZDlN6jM715WFQL9+98P+Qv
 OK7qnDZhhzr48/hhzvr3mIXuuQ==
X-Google-Smtp-Source: ABdhPJxDvDPv3ADYsyyhWPVlnzb7CaqMGlOMdSkFiej4dUoXbTCedb2luVlDDH/zGyqw6KpVymfMhg==
X-Received: by 2002:a4a:d6cc:: with SMTP id j12mr2894172oot.0.1625604204373;
 Tue, 06 Jul 2021 13:43:24 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x130sm1332892oix.22.2021.07.06.13.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 13:43:23 -0700 (PDT)
Date: Tue, 6 Jul 2021 15:43:21 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>
Cc: nvdimm@lists.linux.dev, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-pci@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-cxl@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, target-devel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-acpi@vger.kernel.org,
 industrypack-devel@lists.sourceforge.net,
 linux-input@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, greybus-dev@lists.linaro.org,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-spi@vger.kernel.org, kernel@pengutronix.de,
 dmaengine@vger.kernel.org, linux-ntb@googlegroups.com,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 4/4] bus: Make remove callback return void
Message-ID: <YOTAaQ7AnkCvRQaS@yoga>
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
 <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
 <YOSb1+yeVeLxiSRc@yoga>
 <20210706184323.fudcbsiu4i34dojs@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210706184323.fudcbsiu4i34dojs@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_134325_485895_D50E53E5 
X-CRM114-Status: GOOD (  23.47  )
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

On Tue 06 Jul 13:43 CDT 2021, Uwe Kleine-K?nig wrote:

> Hello Bjorn,
> 
> On Tue, Jul 06, 2021 at 01:08:18PM -0500, Bjorn Andersson wrote:
> > On Tue 06 Jul 10:48 CDT 2021, Uwe Kleine-K?nig wrote:
> > > diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> > > index c1404d3dae2c..7f6fac618ab2 100644
> > > --- a/drivers/rpmsg/rpmsg_core.c
> > > +++ b/drivers/rpmsg/rpmsg_core.c
> > > @@ -530,7 +530,7 @@ static int rpmsg_dev_probe(struct device *dev)
> > >  	return err;
> > >  }
> > >  
> > > -static int rpmsg_dev_remove(struct device *dev)
> > > +static void rpmsg_dev_remove(struct device *dev)
> > >  {
> > >  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> > >  	struct rpmsg_driver *rpdrv = to_rpmsg_driver(rpdev->dev.driver);
> > > @@ -546,8 +546,6 @@ static int rpmsg_dev_remove(struct device *dev)
> > >  
> > >  	if (rpdev->ept)
> > >  		rpmsg_destroy_ept(rpdev->ept);
> > > -
> > > -	return err;
> > 
> > This leaves err assigned but never used, but I don't mind following up
> > with a patch cleaning that up after this has landed.
> 
> Ah, good catch. If I send out a v3 I will fold the following into this
> patch:
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 7f6fac618ab2..9151836190ce 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -534,10 +534,9 @@ static void rpmsg_dev_remove(struct device *dev)
>  {
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>  	struct rpmsg_driver *rpdrv = to_rpmsg_driver(rpdev->dev.driver);
> -	int err = 0;
>  
>  	if (rpdev->ops->announce_destroy)
> -		err = rpdev->ops->announce_destroy(rpdev);
> +		rpdev->ops->announce_destroy(rpdev);
>  
>  	if (rpdrv->remove)
>  		rpdrv->remove(rpdev);
> 

Sounds good, feel free to keep my ack on this.

> Maybe .announce_destroy() should then be changed to return void, too?
> Something like:
> 

Yes, I saw this opportunity as well. But that will fan out further, so
let's postpone that until your series has landed and we can follow up
with such changes through the remoteproc tree.

> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..d5204756714c 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -40,7 +40,7 @@ struct rpmsg_device_ops {
>  					    struct rpmsg_channel_info chinfo);
>  
>  	int (*announce_create)(struct rpmsg_device *ept);
> -	int (*announce_destroy)(struct rpmsg_device *ept);
> +	void (*announce_destroy)(struct rpmsg_device *ept);
>  };
>  
>  /**
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 8e49a3bacfc7..4e05994634f8 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -340,7 +340,7 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
>  	return err;
>  }
>  
> -static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
> +static void virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
>  {
>  	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>  	struct virtproc_info *vrp = vch->vrp;
> @@ -360,8 +360,6 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
>  		if (err)
>  			dev_err(dev, "failed to announce service %d\n", err);
>  	}
> -
> -	return err;
>  }
>  
>  static const struct rpmsg_device_ops virtio_rpmsg_ops = {
> 
> though it's not obvious for me that the last hunk is sensible. (OTOH the
> return code is ignored anyhow as rpmsg_dev_remove() is the only caller.
> 

I need to backtrack a little bit more to figure out why we ended up with
this...

Thanks,
Bjorn

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
