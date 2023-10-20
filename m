Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03EAC001DF
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 20:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vALKbdL8P4hBBvRcrY+rszcvSiXZNmqFkOdiDpNC4A=; b=TwQ5fZkFt0XeKL
	gxgOiA5qpx7Fm+k2CPMO+fJmpAqgrJ9Zyl+FzkhXBztTWm+V+EHQo1c9i103SVhhK9s8T1mavb5fU
	BqsOhj0q29bs2om1RkY3Thuyc2Rdl265Iw0zUqAmrzxr351JfgQT321uJ2eABmFwBdmZ7q5RrpYP7
	SfYHbKSDa0ypRqhXt83CTuju+UUCAnY7SzylLJbsCzjHuvai8eodapJhQy7h5OdyZ9H0K8WdcH/zn
	eplwZDY2YNCG/sYpZzZqSsR80Isq8ypO8qQsCfUIUIp3tZcyivT6Lkje7YakmgdDme3y3cfEi0WjB
	YAPg8SPmBYMpi0jDUPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtw3o-002yTl-0E;
	Fri, 20 Oct 2023 20:25:32 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtw3k-002ySE-0X
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 20:25:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6A9CE0003;
	Fri, 20 Oct 2023 20:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697833520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sfiWF1djQwW183R/n1Ql11Gvhq6s/Znqmh+4YVfuGWU=;
	b=lmMEKHcO4Kfebn4Ds5bXoJ7JSSdHmrZVL0PjwehYTgvNmjc0wbpbssC5t6ldsPBp7LuHKt
	hwu2U9DK6qnP1764Y3xC+dEUESkCTPTjHEWANuEofysAwrEZWB9Ztm3hzbnSaoWSisDl85
	Knb7vG4qL9rZ+gqij5IqasMyIYBnheXqXN1TAEbsOLZlxm35tNxXmBuj4Caus2EVjMrHrz
	QL78DZXcXfbAmF5VHe3diLW6dxyHQ8oyTdJZVD5+VQCwlkYvjHXi2GOEHieXEl7CSsM0nd
	5P5OUbDVxXNeEIupFx9uPcFeTokOY+ABWFENSlsxCr6QG+osKNzGNDbSMIp1NA==
Date: Fri, 20 Oct 2023 22:25:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.li@nxp.com>,
	conor.culhane@silvaco.com, imx@lists.linux.dev, joe@perches.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] i3c: master: add enable(disable) hot join in sys
 entry
Message-ID: <20231020202519b2449707@mail.local>
References: <20231018205929.3435110-1-Frank.Li@nxp.com>
 <20231018205929.3435110-2-Frank.Li@nxp.com>
 <57efe6de-cf65-32ed-fd1e-a388e1676c70@linux.intel.com>
 <20231020154528.2f5f68f5@xps-13>
 <ZTKMyW939rB6sSKq@lizhi-Precision-Tower-5810>
 <20231020163348.1752167d@xps-13>
 <8a7ac52e-f102-6f5e-35ab-217e6ecc6ba5@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a7ac52e-f102-6f5e-35ab-217e6ecc6ba5@linux.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_132528_533689_AAA3F01E 
X-CRM114-Status: GOOD (  28.21  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 20/10/2023 17:12:53+0200, Zbigniew, Lukwinski wrote:
> On 10/20/2023 4:33 PM, Miquel Raynal wrote:
> > Hi Frank,
> > =

> > Frank.li@nxp.com  wrote on Fri, 20 Oct 2023 10:20:57 -0400:
> > =

> > > On Fri, Oct 20, 2023 at 03:45:28PM +0200, Miquel Raynal wrote:
> > > > Hi Lukwinski,
> > > > =

> > > > zbigniew.lukwinski@linux.intel.com  wrote on Fri, 20 Oct 2023 10:55=
:27
> > > > +0200:
> > > > > On 10/18/2023 10:59 PM, Frank Li wrote:
> > > > > > Add hotjoin entry in sys file system allow user enable/disable =
hotjoin
> > > > > > feature.
> > > > > > =

> > > > > > Add (*enable(disable)_hotjoin)() to i3c_master_controller_ops.
> > > > > > Add api i3c_master_enable(disable)_hotjoin();
> > > > > What is the use case for having HJ enable knob in sysfs available=
 for user space other than for debug stuff? In other words, does user space=
 really need to enable/disable HJ in runtime for other reason but debug? If=
 it is only for debug maybe it=A0 could be move to debugFS?
> > > > I don't think hotjoin should be considered as a debug feature. The
> > > > problem here is the power consumption which is higher if you enable
> > > > this feature (you need to keep everything clocked and ready to hand=
le
> > > > an IBI) whereas if your design is "fixed" (more like an I2C bus) you
> > > > may save power by disabling this feature.
> > > > =

> > > > A module parameter does not fit here because it's a per-bus
> > > > configuration.
> > > I agree. sys entry is more flexiable. and let controller choose better
> > > power saving policy for difference user case.
> > Maybe it's not the first time this case is faced, would you mind
> > including power management maintainers in this discussion? Perhaps they
> > might have pointers or even have the solution already.
> =

> I did not mind HJ as debug feature. But enabling / disabling the HJ sounds
> to me like debug option.
> =

> So the flow you are considering here is like this:?
> =

>     1. system boot with HJ enabled, so HJ works during initial bus
>        discovery
>     2. some entity in user space decides to disable HJ because power
>        consumption?
>     3. some entity in use space decide some time later to re-enable HJ
>        because some reason?
> =

> I am just wondering whether there is real use case when you starts with HJ
> enabled and than disable it
> =

> in runtime or start with HJ disabled and enable it in runtime. If you are
> taking care about power saving
> =

> =A0let's keep HJ disabled all the time. Default state for HJ could be
> controlled by DT entry.
> =


This would be HW configuration and not HW description.


> =

> > Thanks,
> > Miqu=E8l

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
