Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB631C83F26
	for <linux-i3c@archiver.kernel.org>; Thu, 24 Jul 2025 10:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSkkon7/PMwY7Pa62rIu4aIPAZYBtWTcvFOQDqTSpj4=; b=soYEzPqctPMx3l
	M2LVrwdY6fTVYBRa/18xnAtcHohuNgvHeC++m/PL5n0EiJuT6E8JiCqQG6kBok8EwH96yfbayhd+n
	LDcM466t+D0R6X4X4dMzxSO/oBVozxTPh8hgFhLRCUF9Dt4GgKyyYL5PuCjBWdwFveVR9/5oi1Uu4
	E3Ew+8EED2oEuq89ixM2LvsnMWDP68Ed8YHr9oGmqwk4amr1mBLhuXGs3wNRbkpbcF5uX6gm0VtkE
	13yvtm1cfvKhDvHZLW1H37DmH8aiqASsKFmgLnyUZ2MAUB/ixK8GXmqgPiFscjBEpy62heCV0YNKA
	pvnakxmr8L5ra/gBH3LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesnx-000000079jo-1P26;
	Thu, 24 Jul 2025 10:04:01 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uern1-00000006xkp-0Cra
	for linux-i3c@lists.infradead.org;
	Thu, 24 Jul 2025 08:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=i/NA
	INETyHfGijHMzvc7a5LD4S6+WhrSyQ8ZvBvYX58=; b=HlGI6+WjAGj0V7Jk81Fv
	UdXTWYIpk/WZOXjC1082Nf/zZrYcBw0yXmQRykgCLCbXapgQ1a7sDVK7AoTi3cOY
	SmBQsuG2komJxNHDKsm3Zv2ZBL1Fh3qk4GOfUPse+hq8V7wAKDmGL8jx1k7vxLGY
	RnUw/+0ZRMiyrRxFzlMuasut+lBY9/dfQWhBHQeqJIJthgFqe67fn6WayVBGMApA
	XMrCiQ/QWHw1JHMFqb03lKnmt5KUnGygTIIjYoMkf0+FxxK7dDzgnA+WoqgqmF9V
	LWo6+0513NoVqatwrwvpeUWUdCpJ3N8uqBDzgzNfzWbIwcepnEg48riTeVoe9iRy
	Pg==
Received: (qmail 2002639 invoked from network); 24 Jul 2025 10:58:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2025 10:58:54 +0200
X-UD-Smtp-Session: l3s3148p1@drDwCKk62usgAwDPXyBWAATEinPyanBm
Date: Thu, 24 Jul 2025 10:58:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aIH1zUb8tyIlyC3S@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_015859_957894_2DE80349 
X-CRM114-Status: GOOD (  11.88  )
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


> > +		renesas_i3c_enqueue_xfer(i3c, xfer);
> > +		if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
> > +			renesas_i3c_dequeue_xfer(i3c, xfer);
> 
> This may common problem, I3C spec have 100us timeout, target side may
> timeout when driver wait for irq. So target side treat "repeat start" as
> "start" and issue address arbitration.

Looking more at this issue, I think these are two separate problems.
Chapter 5.1.2.5 mandates that the controller shall not hold SCL low for
more than 100us in most situations and by no means longer than 15ms in
any situation.

Depending on the controller, this may be need to be handled in software.
Or it may be handled in hardware which could raise an exception and
release SCL on its own if the timing was violated.

The above completion is for the *whole transfer*, though, including the
target response time. Like I2C, it is not specified for I3C. At least, I
couldn't find it and I recall no one at the I3C plugfest could point me
to one as well.

So, this completion timeout is more than just 5.1.2.5. It might make
sense to investigate a more reasonable value. But I don't think this
should be imposed on someone submitting a new driver. It is a dedicated
task. And I am not even sure the result will be a subsystem-wide static
value. It might be a calculated value. Maybe even a driver-specific
calculated value.

So, I think the best we can do until we have this investigation is to
keep drivers consistent with the historically grown value.

Or?


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
