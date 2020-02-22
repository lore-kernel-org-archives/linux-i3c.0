Return-Path: <SRS0=ktag=4K=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D34C35671
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Feb 2020 08:38:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9082F208C3
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Feb 2020 08:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="smj4tkfm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9082F208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AY5PWWQYRxc/f6IdNTe4rLm2AOe/oWP0+F0OWn/tIQg=; b=smj4tkfma3aTgF
	chkUbqZ+D9lEnjbqpc9nd0zauj8chxbjx/bHtz+pTkdt9ngT4Y2QYX6gg1LuUGU3Dogl68t+yy8v4
	PsTIGrkKuZJ7EQgjbWTGimEkPCDXki49GUImU3dTR/SnaT7Ba4OS3zWTSnDuxAPqooESzH19bblVq
	WA64zM6UQHDzwB2bcuOrDThujOEf4AKX/CMZ4YSoO2RGIyMtjYfhduOjJt25NZumuODerEvxA7rse
	+YCsynp7D5N6e+tDQ+ptBFb9Ath/srwApZPnGoHMNLEbG9fGX0mNxc5VBTQcwrs2ahD8Hy6V8C2ff
	LoAXCKOUxcWp9L5mDgFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5QJJ-0007Kh-Be; Sat, 22 Feb 2020 08:38:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5QJG-0007Js-QH
 for linux-i3c@lists.infradead.org; Sat, 22 Feb 2020 08:38:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 04F3628FF15;
 Sat, 22 Feb 2020 08:38:46 +0000 (GMT)
Date: Sat, 22 Feb 2020 09:38:44 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 3/5] i3c: master: add i3c_for_each_dev helper
Message-ID: <20200222093844.2f5ed538@collabora.com>
In-Reply-To: <20200221174428.77696ab6@collabora.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <868e5b37fd817b65e6953ed7279f5063e5fc06c5.1582069402.git.vitor.soares@synopsys.com>
 <20200219073548.GA2728338@kroah.com>
 <CH2PR12MB4216D5141E562974634430B8AE120@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20200221115229.GA116368@kroah.com>
 <20200221135911.1300170b@collabora.com>
 <20200221174428.77696ab6@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_003851_115918_721A79FC 
X-CRM114-Status: GOOD (  29.52  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "corbet@lwn.net" <corbet@lwn.net>,
 "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vitor Soares <Vitor.Soares@synopsys.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 21 Feb 2020 17:44:28 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 21 Feb 2020 13:59:11 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Fri, 21 Feb 2020 12:52:29 +0100
> > Greg KH <gregkh@linuxfoundation.org> wrote:
> >   
> > > On Fri, Feb 21, 2020 at 11:47:22AM +0000, Vitor Soares wrote:    
> > > > Hi Greg,
> > > > 
> > > > From: Greg KH <gregkh@linuxfoundation.org>
> > > > Date: Wed, Feb 19, 2020 at 07:35:48
> > > >       
> > > > > On Wed, Feb 19, 2020 at 01:20:41AM +0100, Vitor Soares wrote:      
> > > > > > Introduce i3c_for_each_dev(), an i3c device iterator for use by i3cdev.
> > > > > > 
> > > > > > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > > > > > ---
> > > > > >  drivers/i3c/internals.h |  1 +
> > > > > >  drivers/i3c/master.c    | 12 ++++++++++++
> > > > > >  2 files changed, 13 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> > > > > > index bc062e8..a6deedf 100644
> > > > > > --- a/drivers/i3c/internals.h
> > > > > > +++ b/drivers/i3c/internals.h
> > > > > > @@ -24,4 +24,5 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
> > > > > >  int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> > > > > >  			       const struct i3c_ibi_setup *req);
> > > > > >  void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
> > > > > > +int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *));
> > > > > >  #endif /* I3C_INTERNAL_H */
> > > > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > > > index 21c4372..8e22da2 100644
> > > > > > --- a/drivers/i3c/master.c
> > > > > > +++ b/drivers/i3c/master.c
> > > > > > @@ -2640,6 +2640,18 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
> > > > > >  	dev->ibi = NULL;
> > > > > >  }
> > > > > >  
> > > > > > +int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *))
> > > > > > +{
> > > > > > +	int res;
> > > > > > +
> > > > > > +	mutex_lock(&i3c_core_lock);
> > > > > > +	res = bus_for_each_dev(&i3c_bus_type, NULL, data, fn);
> > > > > > +	mutex_unlock(&i3c_core_lock);      
> > > > > 
> > > > > Ick, why the lock?  Are you _sure_ you need that?  The core should
> > > > > handle any list locking issues here, right?      
> > > > 
> > > > I want to make sure that no new devices (eg: Hot-Join capable device) are 
> > > > added during this iteration and after this call, each new device will 
> > > > release a bus notification.
> > > >       
> > > > > 
> > > > > I don't see bus-specific-locks around other subsystem functions that do
> > > > > this (like usb_for_each_dev).      
> > > > 
> > > > I based in I2C use case.      
> > > 
> > > Check to see if this is really needed, for some reason I doubt it...    
> > 
> > Can we please try the spidev approach before fixing those problems. None
> > of that would be needed if we declare the i3cdev driver as a regular
> > i3c_device_driver and let user space bind devices it wants to expose
> > through the sysfs interface. As I said earlier, we even have all the
> > pieces we need to automate that using a udev rule, and the resulting
> > patchset would be 'less invasive'/simpler for pretty much the same
> > result.  
> 
> So, I went ahead and implemented it the way I suggest. The diffstat is
> not representative here (though it's still in favor of this new version)
> since I also changed the way we expose/handle SDR transfers. What's
> most important IMO is the fact that
> 
> * we no longer need to access the internal I3C API
> * we no longer need to care about transitions between i3cdev and
>   other drivers (the core guarantees that a device is always bound to at
>   most one driver)
> * the registration/unregistration procedure is simplified

Looks like I was wrong, there's no way to disable auto-binding and keep
manual binding possible (they both use the bus->match() hook to know if
a dev can be attached to a driver, and the type of binding is not
specified here). There are of course other options to do this:

* add a i3c_driver->match() hook and expose driver-specific sysfs knobs
  to explicitly add devices to attach to this driver
* make the i3cdev module register one driver per-device, each time with
  its own i3c_device_id table and add sysfs knobs to trigger this
  registration

but none of these option sounds reasonable to me, so let's pursue with
your approach.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
