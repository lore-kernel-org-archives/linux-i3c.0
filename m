Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F5E606A335
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Nov 2026 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1uKMCZuL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NsozwJp3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bqzJuH6BYeGzsrfSJVl2VB9oN3zz1SPOKfP0ZsOtE/A=; b=1uKMCZuL97Fq0dpN41ZRLqSn2j
	Ly/jn2IjKCZN+x4y2+kQN54skJNv7tMDyJhHLiiBaOi8y+o+4bhNQjP/FEdZzcqCalcwtJdZPRw7R
	KDq7uztyk3lCmaiWAiGrCDyvjeQTCB1lXXjy216846/sqJWQlMDWGDGO+ZYt5kzIOKjkYfgixSFhj
	33mRRanhQbLNsDahZkpE/V23hBZS45XAzksTyqpu34U/6qvm2GrVJQx9U2dc11Ds2TNkkhVzZ1FyX
	/zliWMqlZISOcAGMixPC/m6XWB+bSd9R+8Hj8GmFhzwT2YojaTFPZRXXmRpxtcPcoGhBJwPd4Y3wt
	WXVf390w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyRA-0000000EVsO-1QOE;
	Fri, 13 Nov 2026 21:03:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyR6-0000000EVro-0guv
	for linux-i3c@lists.infradead.org;
	Fri, 13 Nov 2026 21:03:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4DC6A4E415B5
	for <linux-i3c@lists.infradead.org>; Fri, 13 Nov 2026 21:03:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1ADDD60015;
	Fri, 13 Nov 2026 21:03:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4992B11BC1337;
	Fri, 13 Nov 2026 22:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794603826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ck6Xb76oYj2opbdzc1LWSQxElh6ruQvZWniy29JDCHo=;
	b=NsozwJp3th5HnfhRbz8Jgo4qJEtdfaS8tRtF4QCFsJsxKpEqe9PeXXadPfy/CnramYkmcs
	EjIpm+NpWxD4yxJ/S9aLJuXvUinJcJ9V1SDNoHlNNbXHorWPXQiOK4F6qjlliQP/tJWBVn
	cu/jzw/fYLy9VMeviu9bafjzPaYESM6tOGbWd3nIgLP1HjtU/4xNzQZgERanfbq7Z2jkaG
	wiN/EPrg8Vhfiz/VeKMEKR1MwVtj1Quc5n1gFZTfHU2l+xB9JNnWus0j7W0fk7FCb7uuws
	v+OaWS6PmGgPdwRfjYF5nQtOx+tPuGEKC+Cpada2LmK0Nv1leTLGyHO2/KvJyg==
Date: Fri, 13 Nov 2026 22:03:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Pathak, Asutosh" <asutosh.pathak@linux.intel.com>
Cc: samagazaryan@google.com, Frank.Li@nxp.com,
	meaganlloyd@linux.microsoft.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <202611132103434b1803e4@mail.local>
References: <298e818d-90b5-4231-bbc6-ef840c0691ca@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <298e818d-90b5-4231-bbc6-ef840c0691ca@linux.intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_130352_370425_D897A0BA 
X-CRM114-Status: GOOD (  16.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13/11/2026 10:11:36-0800, Pathak, Asutosh wrote:
> Hi Sam,
> 
> Alexandre pointed me at this series. I'm working on a driver for the USB-I3C
> device class (USB class 0x3C) - a USB device that acts as an I3C controller,
> with a host-side tool (OpenIPC) that drives the bus from userspace. The master
> part registers normally, so its targets would show up as i3cdev nodes and we'd
> rather use I3C_IOC_XFER than carry our own ioctls. So +1 on the direction.
> 
> A few things we need that the current UAPI doesn't cover yet - wanted to raise
> them now rather than after it lands:
> 
> 1. IBIs to userspace. Our main use case is reacting to target interrupts, but
>    i3cdev is transfer-only today. We'd need a way to get IBIs (and ideally
>    hot-join) delivered to the fd - poll()/read() of an event, or similar.
>    This is the big one for us.
> 
> 2. Larger transfers. len/actual_len are u16 and I3C_IOC_XFER caps the count.
>    Our bulk flows go past 64K, so we'd want either a larger width or a
>    documented way to split without dropping the bus lock mid-sequence.
> 

Hum, seeing 1 and 2 now, shouldn't you rather have an actual kernel
driver to handle the devices present on the i3c bus? What are those
devices?

> 3. Explicit opt-in over auto-attach. For bring-up/validation we don't want a
>    node appearing just because a driver got unbound - Meagan's driver_override
>    approach fits us better, and it also answers Andy's HW-damage concern.
> 
> 4. CCCs from userspace. The union { rnw; cmd; } looks like it's meant for this -
>    just confirming direct/broadcast CCCs are in scope, since our tooling needs
>    them.
> 

Which CCCs do you need?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
