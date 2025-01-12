Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9ABC0218D
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2025 20:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znpO9kANoWnQh/Bx8JZi6b8HPfAm5DZaDs7Exq9+znY=; b=c2/twtvs2Ehae2
	U1xRXN6u08Ch+Z3jJF4qHe7CFdylnKjgYpDT+ibRUzqsyo8hQRWGCyJiaFQQogNQ4w3hif7cS87Gj
	JoSTqnF7MDYpGuP+k7+u67qMlpUYyDefafw9SkEmlKnAUzAz7DYquo5i+bXWv+9sxV7e3JM1GHdoQ
	YAXjjFaMLKRGMkb2+EFJ3gEQ1xJ/5J5BffoMKLeFOj/aHvhj4CcVEAszGAqNN5NMjQCf+3JDt76wm
	7DkmZbL5nmCP/3cbZDvOQovciApsku2z7Gt+XMrSz7wnL/LF5R5nDQUzwsQZWKgfAqJRaJSpdpbrz
	f/L+B8uXql/2cACWB/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdElr-00000007lMh-0xS6;
	Wed, 29 Jan 2025 20:34:47 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6u1-00000003Zus-19wW
	for linux-i3c@lists.infradead.org;
	Sun, 12 Jan 2025 22:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=Dn+nzRwAjy4+MEb2ambf3gZ4KPvzCEVaQV2Es+r7Tes=; b=bvDCJed+rtd+eLWd
	SJEKpST9puKdabamlyAE3/sqLwqu/thl/SKdeUwHztRCcy2kvQwp1AgoYIUsMam9MdSR1ZkzB87P/
	H8PFPNmSdfsHJ51uBOMTVEPEiBr31jWUOJ9KSOraj4o3kpmmJ5CKob56nGxsoxLTQYEqw8rma1EsX
	7E5kySi0Mud/GRkIScuvW2L9gU+bbI97++ceurh6KX+CxAZvrc2BgpUDLqFoNrvIMi4T3C00avj0l
	piL0tNzCfIN0LZqT5qwHSbWcNWmAmTqADqir2UzI4AoZIVGKvANHMTJnyP/xHBgVoVfUsHveKcgxK
	6VhJA1OsSiJBvW2KDQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tX6tv-009lc9-2O;
	Sun, 12 Jan 2025 22:57:47 +0000
Date: Sun, 12 Jan 2025 22:57:47 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Remove unused i3c_device_do_setdasa
Message-ID: <Z4RI6xHMMEZXzTMF@gallifrey>
References: <20241221143418.86012-1-linux@treblig.org>
 <202501122254082b225acf@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202501122254082b225acf@mail.local>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 22:57:31 up 249 days, 10:11,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_145753_489401_068841B0 
X-CRM114-Status: GOOD (  22.01  )
X-Mailman-Approved-At: Wed, 29 Jan 2025 12:34:46 -0800
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

* Alexandre Belloni (alexandre.belloni@bootlin.com) wrote:
> Hello,
> 
> On 21/12/2024 14:34:18+0000, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > i3c_device_do_setdasa() was added in 2022 as part of
> > commit 672825cd2823 ("i3c: export SETDASA method")
> > 
> > but has been unused.
> > 
> > It calls i3c_dev_setdasa_locked() which is now also unused.
> > 
> > Remove them both.
> > (This is effectively a revert of 672825cd2823).
> > 
> 
> 
> Yeah, i guess this just means that we didn't see the device driver yet.
> I'm going to keep those function around for now.

OK, thanks for the review.

Dave

> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/i3c/device.c       | 20 --------------------
> >  drivers/i3c/internals.h    |  1 -
> >  drivers/i3c/master.c       | 19 -------------------
> >  include/linux/i3c/device.h |  2 --
> >  4 files changed, 42 deletions(-)
> > 
> > diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> > index e80e48756914..984976f28314 100644
> > --- a/drivers/i3c/device.c
> > +++ b/drivers/i3c/device.c
> > @@ -54,26 +54,6 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
> >  
> > -/**
> > - * i3c_device_do_setdasa() - do I3C dynamic address assignement with
> > - *                           static address
> > - *
> > - * @dev: device with which the DAA should be done
> > - *
> > - * Return: 0 in case of success, a negative error core otherwise.
> > - */
> > -int i3c_device_do_setdasa(struct i3c_device *dev)
> > -{
> > -	int ret;
> > -
> > -	i3c_bus_normaluse_lock(dev->bus);
> > -	ret = i3c_dev_setdasa_locked(dev->desc);
> > -	i3c_bus_normaluse_unlock(dev->bus);
> > -
> > -	return ret;
> > -}
> > -EXPORT_SYMBOL_GPL(i3c_device_do_setdasa);
> > -
> >  /**
> >   * i3c_device_get_info() - get I3C device information
> >   *
> > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> > index 433f6088b7ce..842e1a865877 100644
> > --- a/drivers/i3c/internals.h
> > +++ b/drivers/i3c/internals.h
> > @@ -13,7 +13,6 @@
> >  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
> >  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> >  
> > -int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
> >  int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >  				 struct i3c_priv_xfer *xfers,
> >  				 int nxfers);
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 42310c9a00c2..000187339400 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -2916,25 +2916,6 @@ void i3c_master_unregister(struct i3c_master_controller *master)
> >  }
> >  EXPORT_SYMBOL_GPL(i3c_master_unregister);
> >  
> > -int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
> > -{
> > -	struct i3c_master_controller *master;
> > -
> > -	if (!dev)
> > -		return -ENOENT;
> > -
> > -	master = i3c_dev_get_master(dev);
> > -	if (!master)
> > -		return -EINVAL;
> > -
> > -	if (!dev->boardinfo || !dev->boardinfo->init_dyn_addr ||
> > -		!dev->boardinfo->static_addr)
> > -		return -EINVAL;
> > -
> > -	return i3c_master_setdasa_locked(master, dev->info.static_addr,
> > -						dev->boardinfo->init_dyn_addr);
> > -}
> > -
> >  int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >  				 struct i3c_priv_xfer *xfers,
> >  				 int nxfers)
> > diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> > index 0a8a44ac2f02..f4e924c179d7 100644
> > --- a/include/linux/i3c/device.h
> > +++ b/include/linux/i3c/device.h
> > @@ -301,8 +301,6 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
> >  			     struct i3c_priv_xfer *xfers,
> >  			     int nxfers);
> >  
> > -int i3c_device_do_setdasa(struct i3c_device *dev);
> > -
> >  void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
> >  
> >  struct i3c_ibi_payload {
> > -- 
> > 2.47.1
> > 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
