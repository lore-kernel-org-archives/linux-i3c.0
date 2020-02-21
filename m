Return-Path: <SRS0=HGQP=4J=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AAEC35647
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 12:59:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACC50206EF
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 12:59:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nmdbhC4x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACC50206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aI+YrSonUW1jcxzATePnZ7Q457PTbZVzgfN0/3lmwzw=; b=nmdbhC4xpFamCZ
	sdrPvUrbSMEQimWgi9a63OCfAVuQhyDIPz9MKiuS3Ef/Ogkw3SScUGzPi0LYh4Hgfjc5yhXOhxyf4
	QEbNMgHrzBbVEawvpn12o7USSu4S0OcSlmYOx+JIhprnsQ+LP65PHa9tgxeq6nBYuKmi99X5u7bkA
	EJcJrk+03a55XXhniY+COp2YOdEsdEnjyeFCwISMhEyEhRVzW2Wl2C72KeLSzPNbVxXPI1m1cTSTa
	KWz694vJmEBTRbt5a8ed4ikkdIaGjvq0GDGlyTbQED7RlwphfJfO3C9lPIb1Oc6rKspSpsNTlDFp1
	0c8QBD4uT5TV7+xjvXbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j57tr-0004C0-6o; Fri, 21 Feb 2020 12:59:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j57to-0004B7-Ku
 for linux-i3c@lists.infradead.org; Fri, 21 Feb 2020 12:59:22 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 726AC29617A;
 Fri, 21 Feb 2020 12:59:14 +0000 (GMT)
Date: Fri, 21 Feb 2020 13:59:11 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 3/5] i3c: master: add i3c_for_each_dev helper
Message-ID: <20200221135911.1300170b@collabora.com>
In-Reply-To: <20200221115229.GA116368@kroah.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <868e5b37fd817b65e6953ed7279f5063e5fc06c5.1582069402.git.vitor.soares@synopsys.com>
 <20200219073548.GA2728338@kroah.com>
 <CH2PR12MB4216D5141E562974634430B8AE120@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20200221115229.GA116368@kroah.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_045920_819913_9C613AE6 
X-CRM114-Status: GOOD (  21.82  )
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

On Fri, 21 Feb 2020 12:52:29 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Feb 21, 2020 at 11:47:22AM +0000, Vitor Soares wrote:
> > Hi Greg,
> > 
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Date: Wed, Feb 19, 2020 at 07:35:48
> >   
> > > On Wed, Feb 19, 2020 at 01:20:41AM +0100, Vitor Soares wrote:  
> > > > Introduce i3c_for_each_dev(), an i3c device iterator for use by i3cdev.
> > > > 
> > > > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > > > ---
> > > >  drivers/i3c/internals.h |  1 +
> > > >  drivers/i3c/master.c    | 12 ++++++++++++
> > > >  2 files changed, 13 insertions(+)
> > > > 
> > > > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> > > > index bc062e8..a6deedf 100644
> > > > --- a/drivers/i3c/internals.h
> > > > +++ b/drivers/i3c/internals.h
> > > > @@ -24,4 +24,5 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
> > > >  int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> > > >  			       const struct i3c_ibi_setup *req);
> > > >  void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
> > > > +int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *));
> > > >  #endif /* I3C_INTERNAL_H */
> > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > index 21c4372..8e22da2 100644
> > > > --- a/drivers/i3c/master.c
> > > > +++ b/drivers/i3c/master.c
> > > > @@ -2640,6 +2640,18 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
> > > >  	dev->ibi = NULL;
> > > >  }
> > > >  
> > > > +int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *))
> > > > +{
> > > > +	int res;
> > > > +
> > > > +	mutex_lock(&i3c_core_lock);
> > > > +	res = bus_for_each_dev(&i3c_bus_type, NULL, data, fn);
> > > > +	mutex_unlock(&i3c_core_lock);  
> > > 
> > > Ick, why the lock?  Are you _sure_ you need that?  The core should
> > > handle any list locking issues here, right?  
> > 
> > I want to make sure that no new devices (eg: Hot-Join capable device) are 
> > added during this iteration and after this call, each new device will 
> > release a bus notification.
> >   
> > > 
> > > I don't see bus-specific-locks around other subsystem functions that do
> > > this (like usb_for_each_dev).  
> > 
> > I based in I2C use case.  
> 
> Check to see if this is really needed, for some reason I doubt it...

Can we please try the spidev approach before fixing those problems. None
of that would be needed if we declare the i3cdev driver as a regular
i3c_device_driver and let user space bind devices it wants to expose
through the sysfs interface. As I said earlier, we even have all the
pieces we need to automate that using a udev rule, and the resulting
patchset would be 'less invasive'/simpler for pretty much the same
result.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
