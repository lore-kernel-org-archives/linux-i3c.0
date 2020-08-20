Return-Path: <SRS0=korR=B6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC50C433DF
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Aug 2020 17:14:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E2AA208E4
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Aug 2020 17:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MjLUog/P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E2AA208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jnJQTTLmMpjFYKFiWcv+nDWzzuUaIVFmDau3Z/tqqJI=; b=MjLUog/PuizmU5jv/bGPN0GBO
	0IwQCI4VYWrnHJ2oNilxKt5jVY5rq0ocsYett25/GbydevQJpVT0w4qOgtHciCnOIjluLQFzHCG4x
	bjL4MYJ0iULijJm0MBDJn/nI2P5pAOr+xqpd18Z1QjswQpuLksPcycV4bCJzqMzHgJCis8zkW5YDk
	hKBNwVxichak6RkCJyBuEdxaJLoiNIDrwrJKAXVpwOcbIgQaCETBROVs7nwipEU3oYCr3Z24s7cw3
	YfWwGjrjR9fAqgJ39zbK6eggVd3LopPZp0FPtXEYCnRJRnfAThUxEBMR/uBvuf9Xv44JkGr1fIEna
	T35GFa8Wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8o8z-0007z1-QE
	for linux-i3c@archiver.kernel.org; Thu, 20 Aug 2020 17:14:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8o8x-0007yK-Se
 for linux-i3c@lists.infradead.org; Thu, 20 Aug 2020 17:14:28 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9F33329AB27;
 Thu, 20 Aug 2020 18:14:26 +0100 (BST)
Date: Thu, 20 Aug 2020 19:14:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH 2/2] i3c/master: add the mipi-i3c-hci driver
Message-ID: <20200820191424.29c42972@collabora.com>
In-Reply-To: <nycvar.YSQ.7.78.906.2008201234370.1479@knanqh.ubzr>
References: <20200814034854.460830-1-nico@fluxnic.net>
 <20200814034854.460830-3-nico@fluxnic.net>
 <20200820100829.0e44200a@xps13>
 <20200820103944.08a55ba4@collabora.com>
 <nycvar.YSQ.7.78.906.2008201234370.1479@knanqh.ubzr>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_131428_027725_75D8A242 
X-CRM114-Status: GOOD (  23.38  )
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

On Thu, 20 Aug 2020 12:47:49 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

> On Thu, 20 Aug 2020, Boris Brezillon wrote:
> 
> > On Thu, 20 Aug 2020 10:08:29 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > > +		/*
> > > > +		 * TODO: Extend the subsystem layer to allow for registering
> > > > +		 * new device and provide BCR/DCR/PID at the same time.    
> > > 
> > > Not sure this is needed if you don't use it directly as the core will
> > > anyway (in its current form) send the relevant CCC to read these
> > > registers.  
> > 
> > We considered optimizing that in the past but that means making the DAA
> > and SETDASA registration different. I'm not sure it's worth it to be
> > honest, PID/DCR/BCR only happens when initializing devices and I
> > suspect the overhead of querying those DATA twice in case of DAA is
> > negligible anyway.  
> 
> Wellllll... I know some people who do feel strongly about this 
> particular issue for some reasons.

Mind developing a bit why? Boot-time maybe?

> So I'd prefer giving them some hope 
> and leave the door open to some i3c_master_add_i3c_dev_and_info() 
> interface. In the end, it's just a matter of pre-filling the info struct 
> and skipping the PID retrieval in i3c_master_getpid_locked() if already 
> available, etc.

I'm definitely not closing the door, but I'd like to understand why this
is so important to them :-). Anyway, if the changes are not invasive, I
don't have a good reason to refuse it.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
