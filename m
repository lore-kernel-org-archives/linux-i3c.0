Return-Path: <SRS0=0Txb=4M=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50351C35671
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2020 11:22:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22EC820732
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2020 11:22:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WCs8SzjW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22EC820732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YdtcsSfk9JERnl1BEXN9FXnK6k5mPmAE22FJX7S+9k=; b=WCs8SzjWJFWUHP
	Se/wdpMqcc9q9BoGwskXpJfKsDgsjam77LSnsg5jzzUpj2vpMfp7M57pDd+7pXyBjzEWnBq8oDeuC
	satw1IUZsyO2mprFH+1xPFTQWDQPqEoecDLK+VLIra+8RCD05IYDMbYmX00FTWWFqQszoF1TZ383I
	4491utL9ezw8VHQrkHHXPANvMDVHBxBBB9Nv1bPGvJQvpqcjuzJGLaMrbugZVORvta0Di+JaRkH9g
	11U53QkPIEy34gNgDZ2zt/bOOrU6Mve/0jKt2ovgJxJvIv+/qkzeguzlzFuKKmQbqS53IzgpobYA4
	5m0V21lS9jbJWN/BL7fQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6BoX-0000lX-Bh; Mon, 24 Feb 2020 11:22:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6BoU-0000in-Jd
 for linux-i3c@lists.infradead.org; Mon, 24 Feb 2020 11:22:16 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6730E29047B;
 Mon, 24 Feb 2020 11:22:09 +0000 (GMT)
Date: Mon, 24 Feb 2020 12:22:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v3 4/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <20200224122206.10984b3f@collabora.com>
In-Reply-To: <CH2PR12MB42163351853CCC029D28164BAEEC0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <e093ae9da81e7702c188a20d1e8b9d7f8024bfeb.1582069402.git.vitor.soares@synopsys.com>
 <20200221233216.3b2038f8@collabora.com>
 <CH2PR12MB42163351853CCC029D28164BAEEC0@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_032214_782539_5B450213 
X-CRM114-Status: GOOD (  16.61  )
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
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 24 Feb 2020 11:04:50 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> Hi Boris,
> 
> From: Boris Brezillon <boris.brezillon@collabora.com>
> Date: Fri, Feb 21, 2020 at 22:32:16
> 
> > On Wed, 19 Feb 2020 01:20:42 +0100
> > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> >   
> > > +static int i3cdev_detach(struct device *dev, void *dummy)
> > > +{
> > > +	struct i3cdev_data *i3cdev;
> > > +	struct i3c_device *i3c;
> > > +
> > > +	if (dev->type == &i3c_masterdev_type)
> > > +		return 0;
> > > +
> > > +	i3c = dev_to_i3cdev(dev);
> > > +
> > > +	i3cdev = i3cdev_get_drvdata(i3c);
> > > +	if (!i3cdev)
> > > +		return 0;
> > > +
> > > +	/* Prevent transfers while cdev removal */
> > > +	mutex_lock(&i3cdev->xfer_lock);
> > > +	cdev_del(&i3cdev->cdev);  
> > 
> > When cdev_del() returns there might be opened FDs pointing to your
> > i3cdev [1] ...  
> 
> Yes, I know. I protected the driver part but I missed the 
> file->private_data.

Not sure what you mean by protection, but if you meant locking, then
it's not enough: you need to refcnt the struct if you want to prevent
use-after-free situations.

BTW, I had a closer look at the usbdev implementation, and maybe you
should base yours on usb instead of i2c. They seem to register a cdev at
module init time, and add a dev_t per device at device registration
time. Not sure how they handle the userspace-driver vs kernel-driver
concurrency, but maybe returning EACCES (or EBUSY) instead of
detaching/attaching the i3cdev everytime a device is bound/unbound
would be simpler.

Also, I think Arnd was right, it'd be simpler if i3cdev support was
integrated to the core (still left as a option so it can be disabled,
but with a dedicated i3cdev field in i3c_device instead hijacking the
driver private field).


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
