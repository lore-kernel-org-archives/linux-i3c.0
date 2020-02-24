Return-Path: <SRS0=0Txb=4M=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37984C35671
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2020 11:24:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E80D20732
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2020 11:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pgIezqX4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E80D20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFrBCdQt9WnzKHINuhpvRVIppxbpPZkZcamntfVPrBg=; b=pgIezqX4CVUHiR
	KMEfCQc3yHrbOPFZCvY/85gQMJvvkxtsJqcUJ4qh7Zu52QaKZR5sLeigar3wmOZ9/2mQmdG2hc7nv
	JEtNM6YpYxWaeN8PZgYShdhLYkchNnoqr1FReT/BynXLhiQwibPaa/jcxxJYP2+W2owqIILPnNRP2
	TW13d6Q+ipDpVQQPwS4neNNnZZWqVeiJRyFGIPIFrM4Wxb37h4PA9byMWCjzpqObygvQHVR2yHwcf
	niNfMP1kID777lRlgTyvJAGCCniPvdEvIsOjpFihp6IVN1nwRn+/godgJISf3z8IZouqXSP/ekNkZ
	g7nzjKfpjqY2ne2cmAIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Br1-0001Y0-J7; Mon, 24 Feb 2020 11:24:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Bqx-0001XE-T9
 for linux-i3c@lists.infradead.org; Mon, 24 Feb 2020 11:24:49 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 13F10292B4E;
 Mon, 24 Feb 2020 11:24:45 +0000 (GMT)
Date: Mon, 24 Feb 2020 12:24:42 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v3 0/5] Introduce i3c device userspace interface
Message-ID: <20200224122442.7cb6e8d8@collabora.com>
In-Reply-To: <CH2PR12MB4216F86F6820CC5247B89BA8AEEC0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <CH2PR12MB421604E9272413A6C456AB16AE100@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20200219091658.7506e7bd@collabora.com>
 <CH2PR12MB4216ECDC745C8255DF8106A3AE120@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20200221184116.1d8f0677@collabora.com>
 <CH2PR12MB4216F86F6820CC5247B89BA8AEEC0@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_032448_071256_A28968A2 
X-CRM114-Status: GOOD (  30.92  )
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, "corbet@lwn.net" <corbet@lwn.net>,
 Joao Pinto <Joao.Pinto@synopsys.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 24 Feb 2020 10:53:25 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> Hi Boris,
> 
> From: Boris Brezillon <boris.brezillon@collabora.com>
> Date: Fri, Feb 21, 2020 at 17:41:16
> 
> > > > > 
> > > > > I want to make you know that none of your previous comments was ignored 
> > > > > and  I would like to start the discussion from this point.    
> > > > 
> > > > Sure, np. I'll probably wait for a v4 exploring the option I proposed
> > > > then.    
> > > 
> > > I would like to check with you:
> > >   - How can we prioritize the device driver over the i3cdev driver if the 
> > > driver is loaded after i3cdev? Currently, this is done automatically 
> > > without any command, and for me, this is a requirement.  
> > 
> > No devs would be bound to the i3cdev driver by default, it would have
> > to be done explicitly through a sysfs knob. Which makes me realize
> > we can't use the generic bind knob since it doesn't let the subsystem
> > know that it's a manual bind. I thought there was a way to distinguish
> > between manual and auto-bind.
> >   
> > >   - For the ioctl command structure, there is no rule about the way I did 
> > > or what you proposed, both are currently used in the kernel. For me it is 
> > > one more structure to deal with, can you point the advantages of your 
> > > purpose?  
> > 
> > I don't have a strong opinion on that one, though I find it a bit
> > easier to follow when the number of xfers is encoded in a separate
> > struct rather than extracted from the data size passed through the cmd
> > argument.  
> 
> I will change it then. Do you have any suggestion for the naming to keep 
> it short?

I named it i3cdev_priv_xfers in the patch I sent, but you can pick a
different name if you don't like this one.

> 
> >   
> > >   - Regarding the ioctl codes, I tried to use those after I2C.  
> > 
> > Why start from 0x30? It doesn't make sense to me. Just because you base
> > your code on something that already exists doesn't mean you have to
> > copy all of it.  
> 
> I might be wrong but last I2C command is 0x20 and I tried to let some 
> free space in case they need.
> Also I think that make sense I2C and I3C share the same 'magic number'.

Hm, I'm not sure that's a good idea. The set of ioctls for I2C and I3C
are likely to be completely different, so I'd recommend using a
separate namespace (AKA ioctl magic number). Wolfram, any opinion?

> 
> BTW, in ioctl-numbers documentation there is no reference for code 0x07.

Indeed, looks like it's not documented.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
