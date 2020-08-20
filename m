Return-Path: <SRS0=korR=B6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFB3C433DF
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Aug 2020 18:23:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6411207DE
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Aug 2020 18:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KI0Dqxhe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="DIFnGSZd";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="etzM/mr8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6411207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D1aolG9X/qTtpgesZ1ZAar2rTAqsjSX045ShdGMPtII=; b=KI0DqxheZGLfwjkbQ3u0uZDLG
	LiT64DS8rEsCGF46k6yFXZz9y/dNsvPTTCmiExIJQu7I8jfDUkNRh6w183PhjCbU3xHljDNHqBufZ
	+aMp6ceQ6kQcts0mogHw2JJjGznj+pX7lIxce9XmKn/bNiTdoCMW7d9jEe6ezKhZbsOQgo2rgEDL2
	Wm/ep0ZprW6MSQ8YiYJVX2tzUGkc1MNBEKD9DAbFB/0XWTQj/2ZitUZGC7ZD0qJdy1Osz2u6dgXxW
	3pcRjOsuJ9a8CXoac+bbHlpKgwWW0aGpFOLFiv6jSd7AfOvuky8WL99xVBKObpas8tcBkZfZ0BnYt
	Rr13l/qyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8pDN-0002vV-1s
	for linux-i3c@archiver.kernel.org; Thu, 20 Aug 2020 18:23:05 +0000
Received: from pb-smtp1.pobox.com ([64.147.108.70])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8pDK-0002ur-9w
 for linux-i3c@lists.infradead.org; Thu, 20 Aug 2020 18:23:03 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id EB83471113;
 Thu, 20 Aug 2020 14:22:59 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=ceL8lzbX4brisQe2BVsEvyqSkJw=; b=DIFnGS
 Zd6ko9fiFr8Rr2qNT2rPV8nNXvlyzZjp7p8SDSWjVK10+JLoGusfmBEJ7T1EW8bW
 AO8xyuMFI9OBMJIZVQ36MXT0PrCQVniLjthKfTTrYYNq7rOEtvK1i9PTF3DFuHIn
 eH/JkuL4VnD20npBLbmg3k9HPvT48xenkAx8I=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id E1B7E71111;
 Thu, 20 Aug 2020 14:22:59 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=YubzaHe1BEeYnWz0VCJecRTAuQPnm7Y/to0XjC9kum4=;
 b=etzM/mr8nSbCBNVrbw3obv8IEAKTSGxzrim10L7bnstsh7M8pZuu7Mri9yWi+0z83KR+BaDSQiPpE2ZacdxQrpou0wqZwAd2VfJJ7owNcONGfhIYBs91cN3YRNMthHxEAQueQ04u+SiKnYI5pgSSZv6FDHPbdk47QPTF6e1weDY=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 5B6627110F;
 Thu, 20 Aug 2020 14:22:59 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 60DDD2DA01C4;
 Thu, 20 Aug 2020 14:22:58 -0400 (EDT)
Date: Thu, 20 Aug 2020 14:22:58 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/2] i3c/master: add the mipi-i3c-hci driver
In-Reply-To: <20200820185642.04f184e9@collabora.com>
Message-ID: <nycvar.YSQ.7.78.906.2008201332250.1479@knanqh.ubzr>
References: <20200814034854.460830-1-nico@fluxnic.net>
 <20200814034854.460830-3-nico@fluxnic.net> <20200820100829.0e44200a@xps13>
 <nycvar.YSQ.7.78.906.2008201102500.1479@knanqh.ubzr>
 <20200820185642.04f184e9@collabora.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 2D1B96BC-E312-11EA-A89B-01D9BED8090B-78420484!pb-smtp1.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_142302_706524_070A1937 
X-CRM114-Status: GOOD (  38.83  )
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
Cc: devicetree@vger.kernel.org, Laura Nixon <laura.nixon@team.mipi.org>,
 Rob Herring <robh+dt@kernel.org>, Robert Gough <robert.gough@intel.com>,
 Matthew Schnoor <matthew.schnoor@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 20 Aug 2020, Boris Brezillon wrote:

> On Thu, 20 Aug 2020 12:34:13 -0400 (EDT)
> Nicolas Pitre <nico@fluxnic.net> wrote:
> 
> > On Thu, 20 Aug 2020, Miquel Raynal wrote:
> 
> > > > +
> > > > +#ccflags-y := -DDEBUG  
> > > 
> > > Probably a leftover?  
> > 
> > Well, I left it there intentionally as the code is still actively being 
> > developed, so full debugging can quickly be reactivated by anyone.
> > I can remove it if deemed too distracting.
> 
> How about using dynamic printk instead? I'm pretty sure you don't need
> to debug I3C stuff early enough to warrant usage of DDEBUG.

Actually I do have DDEBUG set all the time when testing this code. The 
entire log is captured into a file that I can search for issues when 
they come.

I'm too lazy to bother about dynamic printk for now. That is nice when 
debugging a deployed solution where you don't want to skew runtime 
timings too much, but I'm not at the point of doing performance 
measurements yet.

Anyway, this one has crossed the distraction threshold too at this point 
so I'll remove it.

> > > > +	BUG_ON(raw);  
> > > 
> > > It looks like 'raw' cannot be used with v1 (at least you seem to take
> > > care of it in v2), so maybe BUG_ON is a bit radical here and you can
> > > simply return an error? I think the use of BUG() is not appreciated in
> > > general.  
> > 
> > That depends. Judgement is needed for BUG() usage.
> > 
> > Here raw is absolutely impossible with v1 hardware and if ever this 
> > happens this is definitely a software bug that needs fixing right away. 
> > There is no point returning a runtime error code in that case as the 
> > upper layer won't know what to do about it.
> > 
> > On the other hand, you absolutely don't want to BUG() on a condition 
> > that could _eventually_ happen at run time during normal usage. But 
> > that's not the case here.
> 
> Well, people have tried to eradicate BUG() occurrences, so let's not add
> new ones if we can avoid it. How about a WARN_ON()+error:
> 
> 	if (WARN_ON(raw))
> 		return -EINVAL;

In this case I can agree to that. Will do.

However...

> > > > +		/*
> > > > +		 * We're deep in it if ever this condition is ever met.
> > > > +		 * Hardware might still be writing to memory, etc.
> > > > +		 */
> > > > +		ERR("unable to abort the ring");
> > > > +		BUG();  
> > > 
> > > Why not just treating the error as always?  
> > 
> > Again, if this ever happens, you're screwed. That means potential DMA 
> > engines could still be alive and about to scribble over memory that is 
> > about to be freed which may cause all sorts of impossible-to-find bugs 
> > in unrelated parts of the kernel. There is no point going on reporting 
> > such error condition to upper layers until the software, or possibly the 
> > hardware, is fixed
> 
> Again, I think adding a WARN_ON() and letting hci_dma_dequeue_xfer()
> return an error code is a good compromise. 

Here I disagree. You just can't return and let the system go any longer 
if some stray DMA is not stopped, period. No compromize is possible 
here.

> > > > +const struct hci_cmd_ops i3c_hci_cmd_v1 = {
> > > > +	.prep_ccc		= hci_cmd_v1_prep_ccc,
> > > > +	.prep_i3c_xfer		= hci_cmd_v1_prep_i3c_xfer,
> > > > +	.prep_i2c_xfer		= hci_cmd_v1_prep_i2c_xfer,
> > > > +	.perform_daa		= hci_cmd_v1_daa,  
> > > 
> > > I know Boris does not like such space alignment :)  
> > 
> > Well... unfortunately for Boris, this is overwhelmingly prevalent in the 
> > kernel code:
> > 
> > $ git grep "^"$'\t'"\.[^ ]*"$'\t'"*= "
> > 
> > And I do like it.  ;-P
> 
> The rational being this preference is that sooner or later someone will
> add a field to hci_cmd_ops that messes up your nice formatting :P.

When/if that happens, it is not very difficult to realign the other 
assignments. I don't think it is likely that adding/removing fields here 
will ever become an area of conflicting patch contention. OTOH this 
makes for easier code reading whose occurence is more likely.

> Anyway, that's definitely not a blocker.

Good!

> > > > +#if 0
> > > > +	if (ccc->rnw) {
> > > > +		HEXDUMP("got: ", ccc->dests[0].payload.data,
> > > > +				 ccc->dests[0].payload.len);
> > > > +	}
> > > > +#endif  
> > > 
> > > I guess this debug block can be dropped too (there are many debug
> > > information the should probably be dropped or turned into dev_info()
> > > or similar).  
> > 
> > Again, hardware bringup from different vendors and other developments 
> > are still ongoing. I'd wish for those to stay for the time being unless 
> > people feel strongly enough about these to become a merge show stopper.
> 
> Can't we replace that by a dev_dbg() using the %*pE formater?

Oh nice! Didn't know about that.

Looks like %*ph is what I want here.

> > > > +		if (rh->ibi_data_phys)  
> > > 
> > > I was told that _phys was a very bad suffix for something which is a
> > > DMA address an not focibly a physical address.  
> > 
> > Fair enough. The HCI spec refers to these as "physical memory" hence the 
> > suffix. What were you told to use instead?
> 
> Maybe _dma instead of _phys?

No problem, will do.


Nicolas

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
