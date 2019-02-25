Return-Path: <SRS0=XpnT=RA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E3CC43381
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Feb 2019 17:03:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1FA72087C
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Feb 2019 17:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uI0AxCUK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1FA72087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJNmAYWlptXTMiZFineAnE0aXqPtjMPE53B1qGOm8ck=; b=uI0AxCUKgWX4Za
	mOQ1yxR6LyZbV6HEYaTQncdrKNUVt9EsE299algRvQZiqJ/AOvm0tRr8u6zgssUghFGpdITtrgHNa
	6M60MPOEh2+mk0p7WXCG/cRmQYEZd+adEZ7mlkT8Azl0RCB7PElk+a5BAcQHjxKkXj9uFOAXm8XIx
	D6Pa9a1sJUkLbowP4QaoWTBxThrs2xlKPXvbtGnoJFZWezltv5J7+Qo/9yfaoEFp0+zoZBZw0/5AE
	Z3kbSh6cVXwOieFMUKcDW7QpD4UzzuuMJ1KwsjGBvMAlbqqvGoK+2CkTGLwAl6SOJM0dAElquK+AI
	hXDO5UotdlVqyrgKrjlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyJfJ-0007jx-7k; Mon, 25 Feb 2019 17:03:41 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyJfG-0007je-Ey
 for linux-i3c@lists.infradead.org; Mon, 25 Feb 2019 17:03:40 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6FF2226BEED;
 Mon, 25 Feb 2019 17:03:36 +0000 (GMT)
Date: Mon, 25 Feb 2019 18:03:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: vitor <vitor.soares@synopsys.com>
Subject: Re: [PATCH 1/2] i3c: Add support for HDR modes.
Message-ID: <20190225180333.1084a453@collabora.com>
In-Reply-To: <d8d0de00-f48e-f6f2-08b1-85b18ef8400e@synopsys.com>
References: <cover.1544702829.git.pgaj@cadence.com>
 <efb3b8692d3579ab3369cc0f80e237550f3e8209.1544702829.git.pgaj@cadence.com>
 <cb17ee91-bad8-03d4-cc9f-e7095cf17011@synopsys.com>
 <20190222155238.3dc4ab8f@kernel.org>
 <20190222150248.GA28244@global.cadence.com>
 <a4d2b1b8-f30f-4c12-a7ab-1bd2bccf1666@synopsys.com>
 <20190225095625.36727da7@collabora.com>
 <6a5570ee-9d40-2c91-4b32-5e030ce94d07@synopsys.com>
 <20190225141029.23afdf11@collabora.com>
 <d8d0de00-f48e-f6f2-08b1-85b18ef8400e@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_090339_033723_16333880 
X-CRM114-Status: GOOD (  26.51  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Przemyslaw Gaj <pgaj@cadence.com>, psroka@cadence.com,
 linux-i3c@lists.infradead.org, rafalc@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

On Mon, 25 Feb 2019 16:45:21 +0000
vitor <vitor.soares@synopsys.com> wrote:

> On 25/02/19 13:10, Boris Brezillon wrote:
> >>>>>> something more generic than what we currently have.
> >>>>>>
> >>>>>> Something like
> >>>>>>
> >>>>>> enum i3c_xfer_type {
> >>>>>> 	I3C_CCC_XFER,
> >>>>>> 	I3C_SDR_XFER,
> >>>>>> 	I3C_HDR_XFER,

Forgot
		I3C_I2C_XFER,

> >>>>>> }
> >>>>>>
> >>>>>> struct i3c_xfer {
> >>>>>> 	enum i3c_xfer_type type;
> >>>>>> 	union {
> >>>>>> 		struct i3c_ccc_cmd ccc;
> >>>>>> 		struct i3c_priv_xfer sdr;
> >>>>>> 		struct i3c_hdr_cmd hdr;

and 

			struct i2c_msg i2c;

Since you want to make that fully generic.

> >>>>>> 	};
> >>>>>> }      
> >>>> @Boris: I remember you don't want to expose CCC commands, I think at least for now we shouldn't expose too.
> >>>>
> >>>> Do you agree?    
> >>> Well, if we want to have a generic interface and not force all drivers
> >>> to implement one hook per transfer type, we should also have CCC
> >>> commands in this enum. We can still make sure the user does not pass
> >>> CCC commands before forwarding the request to the controller.    
> >> I'm ok with this. Still there is some CCC commands that might be expose for devices and we can decide it later.
> >>  
> >>> Anyway, as for all the other changes proposed so far, I'd like to see a
> >>> real use case for this SDR/HDR[/CCC] mix. Do you have a device spec
> >>> describing such a sequence?    
> >> From my knowledge there is no devices HDR capable on the market thus I cannot argue with real use case.
> >>
> >> But per i3c spec v1.0 there is no mention that HDR frame shall begin with a START condition (not REPEATED START).
> >> So, the question is why do not support it instead of limiting it?  
> > Well, all depends on the extra complexity to support this case. If it's
> > simple enough, I won't complain.
> >  
> >> We don't know the implementation of the device and some of them maybe need the previous transfer (in SDR) to do the next one (in HDR).  
> > Exactly, we don't know, so maybe we should just wait before introducing
> > HDR mode...
> >  
> >> and supporting it we are cover more use cases.  
> > Are we even sure all controllers will be able to chain things like
> > that?   
> 
> Why not? for the controllers shouldn't be a problem. The problem can be if it doesn't support.

I don't know, maybe because some HW will be too limited to support
chained requests. I'm speculating, just like you are :-P.

> 
> > For instance, in it's non-DMA mode, the Cadence controller is
> > limited by the FIFO size, which means you anyway won't be able to
> > chain too much frames using a REPEATED START. So, any device relying on
> > REPEATED START for atomic sequences is unlikely to work with all master
> > controllers.  
> 
> IMO this isn't up to us to decide, we just need to provide support and try to cover the most possible use cases.

And yet, you take a decision based on your own speculations. You might
possibly be right, but until we start seeing devices that support HDR
modes that's not something we can be sure of.

> Right now we only have 2 masters to support this kind of change and I just see some effort to support the CCC commands.

Support CCC commands? We already support CCC commands. What do you mean?

> 
> I would like to test this scenario, what do you think that can add extra complexity?

Go ahead and post an implementation, we'll see how it looks like.
BTW, you have quite a few things on your TODO list already, but none of
these have led to patches being posted. Maybe you should focus on one
topic and finish it instead of constantly bringing new things you say
you plan to work on.

Regards,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
