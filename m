Return-Path: <SRS0=zIxT=2G=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C7CC2D0D2
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86B72207FF
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V7HMtRG7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3WTTM5e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86B72207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hp6+wHa4qUGCzCug6rgKZi+RXAS101/YqZY+bg1S3FE=; b=V7HMtRG7DKu0r+
	2zrZ8MXlZCwXDwNVp/RHLYIg4Oq/Ghkx9yW35RSyb/6GzDdbMGmwMpoOj5cPNVDynv6k21ctPR4fh
	Bn2nZkAyGPgbV9UfaWwAgjH7WVVuEbe0goWj544HqeNcWJM6X34FJ32hUqg7ZjOReTkRwMsN75iYf
	JO9I5kgCwXDwuHzmRJ2N5KknhEN5RSDaQEFa1YgjWX0ac+hT7GhIiShAOfLAPYyxbgZHcPEc/rXkk
	dxq2G7xa8TfA1FyLcOq6KGp6DUYoWwmSGBil8MgHhaUve13t+Kua86wtOGpd2+Hp/+L4NSW5/7OK8
	duNmaVUD2DjCOSfKuEgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igvE1-0004i0-Nh; Mon, 16 Dec 2019 18:36:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifSKc-0000Iq-LF
 for linux-i3c@lists.infradead.org; Thu, 12 Dec 2019 17:32:55 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C21FA21655;
 Thu, 12 Dec 2019 17:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576171974;
 bh=d8T+W80ohSAutSwyvwOIJCoFk70VslbyWmhLhSjuY/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f3WTTM5ez2jJGTd/r4ZgkBqS0RQv+WurCDZfPVTAe9IMbQVFSXPGEZ/4/oPfA+PLc
 1HpYJVtHaQxCrhoZlvds+/CWRZStluyP0fTC8gN5/TQhnuz7SLcb54YCtcBgRW/ZqR
 k95AzqrkG069hz1bwHqMckyPeMKhD7tdGsmsMR6M=
Date: Thu, 12 Dec 2019 18:32:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [RFC 5/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <20191212173251.GA1702856@kroah.com>
References: <cover.1575977795.git.vitor.soares@synopsys.com>
 <f9f20eaf900ed5629dd3d824bc1e90c7e6b4a371.1575977795.git.vitor.soares@synopsys.com>
 <20191212144459.GB1668196@kroah.com>
 <CH2PR12MB421658E00DF331400728DB6CAE550@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191212160045.GA1672362@kroah.com>
 <CH2PR12MB4216CB1D650A543A635CC67FAE550@CH2PR12MB4216.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB4216CB1D650A543A635CC67FAE550@CH2PR12MB4216.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_093254_715778_31DFBB5E 
X-CRM114-Status: GOOD (  16.20  )
X-Mailman-Approved-At: Mon, 16 Dec 2019 10:36:06 -0800
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
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Dec 12, 2019 at 05:25:28PM +0000, Vitor Soares wrote:
> From: Greg KH <gregkh@linuxfoundation.org>
> Date: Thu, Dec 12, 2019 at 16:00:45
> 
> > On Thu, Dec 12, 2019 at 02:56:56PM +0000, Vitor Soares wrote:
> > > Hi Greg,
> > > 
> > > From: Greg KH <gregkh@linuxfoundation.org>
> > > Date: Thu, Dec 12, 2019 at 14:44:59
> > > 
> > > > On Tue, Dec 10, 2019 at 04:37:33PM +0100, Vitor Soares wrote:
> > > > > +static int __init i3cdev_init(void)
> > > > > +{
> > > > > +	int res;
> > > > > +
> > > > > +	pr_info("i3c /dev entries driver\n");
> > > > 
> > > > Please remove debugging information, kernel code should be quiet unless
> > > > something goes wrong.
> > > 
> > > I will remove it.
> > > 
> > > > 
> > > > > +	/* Dynamically request unused major number */
> > > > > +	res = alloc_chrdev_region(&i3cdev_number, 0, N_I3C_MINORS, "i3c");
> > > > 
> > > > Do you really need a whole major, or will a few minors work?
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > 
> > > I'm reserving one per device. What do you suggest?
> > 
> > How many devices do you have in a system?
> 
> According to MIPI I3C spec, the maximum number of devices on a bus will 
> depend on trace length, bus load, and clock requirements.
> 
> Frankly, I don't know what is the best compromise because it depends from 
> system to system and the end-use of it. In my case, I started developing 
> this to help me during the HC controller driver development.
> Even If I choose a fixed major, I wouldn't know in which one i3c fits.

Ok, a full major will be fine, I was worried you only wanted 1 or 2
minor numbers, which would mean you could have used a misc device
instead.

This is fine.

thanks,

greg k-h

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
