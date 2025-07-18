Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F84C83F1A
	for <linux-i3c@archiver.kernel.org>; Fri, 18 Jul 2025 11:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Raxghz0odxP2rn/1QHhxEg96YYY9xqKRiNTJ2j2/jGg=; b=Spv6/CRrdhZdZN
	ztJGYX2OAQdoWmB3K/MxVXN/XchH68dBf6Y7mZllldvNfxFVz90q3Mq4TTpvBbCOo3XvWIP2UdPJO
	R51GfmSYPAep/HRhHYCr2HEaeFahii9rgWLWJY3c+utUE9A19j5XKK/7B4xmJJEqQBDXqnTrp/a6s
	/L31l7Lhedx/xrkVhpNnY1TIi32+FnSDPIm5M2sZ0j/O4ZbPWFI0E6WYnWHjIjXlGLLNtXiqJO9BR
	2Vo0vScA3T3v0iw1cDIvcIKoYihIfR+pqNvQeo46lPO2lMmnqWlHKkHvIpYvOuInxexXG0hogQ5rh
	gRU/iJxIzCWU68bxwsLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjFH-0000000CQmE-1UJi;
	Fri, 18 Jul 2025 11:27:19 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucido-0000000CLTL-2LLl
	for linux-i3c@lists.infradead.org;
	Fri, 18 Jul 2025 10:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YiG1
	IShrAJJD2nBW0s3CYWEa3UHJFS+PznTuJurnABk=; b=f1AsJS7b3SR9leX88GTm
	UayW9XFd8Y3eOa1wFxwyBsYiBZ+WnU1CdhgD4p0ZFf77Z1cvbYQV6RJr7YB9dbw4
	wNFdaoxYxJ1oyV9Zbw3HHZOT4SUzOK3Vn4Y2ZGZ+WwN6ZCZ1PM0syRQCkmgqlbto
	p4tABsZnTFd3dZdIQZHWhoRcYNHQXKIAKc9UJEKdtQJKn+zNTNVXwjd69pCdZzmu
	V2AOSb1lBjoJyrnP39QjPc3YrTphgM4hPdesyU94A0cYIeOL3bMrHge+4rXOU5RL
	+E2iLf9eASg432JGo1eK2e0P6ie6RnRVdRql1qtqnL09ZIDD1iB0KNKEaOsYh4mQ
	ew==
Received: (qmail 4026406 invoked from network); 18 Jul 2025 12:48:32 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jul 2025 12:48:32 +0200
X-UD-Smtp-Session: l3s3148p1@IXr33TE6RuAgAwDPXx+vAAkEB0lWxGP4
Date: Fri, 18 Jul 2025 12:48:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i3c: master: Add basic driver for the Renesas I3C
 controller
Message-ID: <aHomfzV_dJMwFyCN@shikoro>
References: <20250717122455.9521-1-wsa+renesas@sang-engineering.com>
 <20250717122455.9521-3-wsa+renesas@sang-engineering.com>
 <aHlJ8KQzcamyaZA1@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aHlJ8KQzcamyaZA1@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_034837_467791_4C0242D1 
X-CRM114-Status: GOOD (  19.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Frank,

> > +#define NDBSTLV0		0x398
> > +#define  NDBSTLV0_RDBLV(x)	(((x) >> 8) & 0xff)
> 
> Can you use FILE_GET()?

You mean FIELD_GET? Probably yes.

> > +#define RENESAS_I3C_MAX_DEVS	8
> > +#define I2C_INIT_MSG		-1
> > +
> > +/* Bus condition timing */
> > +#define I3C_BUS_THIGH_MIXED_NS	40		/* 40ns */
> > +#define I3C_BUS_FREE_TIME_NS	1300		/* 1.3us for Mixed Bus with I2C FM Device*/
> > +#define I3C_BUS_AVAL_TIME_NS	1000		/* 1us */
> > +#define I3C_BUS_IDLE_TIME_NS	200000		/* 200us */
> 
> Do you have document reference to such timeout value?  If it is spec defined
> timeout, please move to master.h and add ref to spec sections number.

They are all in the specs. Will move them.

> > +#define XFER_TIMEOUT		(msecs_to_jiffies(1000))
> 
> Is it engineer choosen timeout or spec defined? add comments to show why
> choose this timeout value.

Consistency. All current I3C controller drivers use this value. If we
want to improve it, we should do it in a seperate series for all drivers
IMO.

> > +	/* Wait for reset completion  */
> > +	return readl_relaxed_poll_timeout(i3c->regs + RSTCTL, val,
> > +					  !(val & RSTCTL_RI3CRST), 0, 1000);
> 
> All you use customer's readl at other place. here, you should use
> read_poll_timeout(renesas_i3c_reg_read, ...) to keep consistent. check other
> place.

I will use regmap_read_poll_timeout().

> > +			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_NS,
> > +						     1000000000 / rate);
> 
> 100000000 use NSEC_PER_SEC, check other place.

Ack.

> > +	/* Extended Bit Rate setting */
> > +	renesas_i3c_reg_write(i3c->regs, EXTBR, EXTBR_EBRLO(od_low_ticks) |
> > +					   EXTBR_EBRHO(od_high_ticks) |
> > +					   EXTBR_EBRLP(pp_low_ticks) |
> > +					   EXTBR_EBRHP(pp_high_ticks));
> 
> I feel renesas_i3c_reg_write is too long, renesas_write() should be enough.

It is long, but precise. renesas_write() could mean anything. It would
also be confusing if some functions start with renesas_* only and some
with renesas_i3c_*. But this is already too much bike-shedding for my
taste. I will do the extra work and switch to regmap and hope that the
overhead is not noticable. I hope I can squeeze this in today.

> > +static struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
> 
> const?

Yes.

Kind regards,

   Wolfram


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
