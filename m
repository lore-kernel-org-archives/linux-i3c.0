Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60E7C83F1A
	for <linux-i3c@archiver.kernel.org>; Thu, 24 Jul 2025 10:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2eStNXiwzhkjmnYXPPDfpwh7EpVyD1MgNy5LTiVxTm0=; b=ddHxqSWkT0tJ1i
	tAakhlqkRM7fx6SIMys3NWtPKAKBcPI0a+rN1S9dveVGNaV/BugEe4RwmmzY051FIeHTQbkvySof4
	mD9/tmAgVAJHo3nx0fkG6t/6CsPtfDZWasGQRNwfr/uY1NH+/imX7XhF0g0VOTxveg70T5k+h17xU
	QqHoYEu8oY8HoJlK1sANOzo+QkZ9hnE5dN0+A5UzsUZljL/xbnE8C128P5C3eKIF7YnqdKgp7llmr
	idBLRo5Ta6ragvZcJ6YKd2K+klt+fwvUbgy+vPqBJ2Hy1buwyxEJcoi/94wwjiYokeWSkmnX5wwil
	A2VkQfb8tSfXIe+lElNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesnz-000000079lK-2ehl;
	Thu, 24 Jul 2025 10:04:03 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerxh-00000006zUM-0lEZ
	for linux-i3c@lists.infradead.org;
	Thu, 24 Jul 2025 09:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6Lub
	CPP7Wbmj7qoJKI6x3Jj43GjD7R6ZKtT47pr9Epc=; b=mJuPNYhLvU4rsyz1aRpr
	HiLSLRSOEsz6cayOnUuic7P/XBFpj5nK74BCvh4EtxxzEu36EkAgat1PRFAwWInY
	zH0ZhjUSjD4dv6vfl8RW4lPqmnD/g2sQFdnpvK3BJw3ZcV5kLGupRrAvfiuw9CBh
	RvZgxP0cAPR7ZHAfXwAZ8udIptTXHe6O19AZqqHqzzlo4P0uE6a6nfNbJ3+d5U2P
	JsozP8Rswosv51Fzmdv02Mb4KD6Dn6HS77QT5BZlGiX4Qq6PiFYp4hyTLne0zflg
	1ehCP2OumkmIU01G88fgk4q2r1keIuH7YiygEqnuvXO5k+H/YPHhzcYBTjp/ShxY
	lw==
Received: (qmail 2006403 invoked from network); 24 Jul 2025 11:09:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2025 11:09:59 +0200
X-UD-Smtp-Session: l3s3148p1@Dw+PMKk6YoEgAwDPXyBWAATEinPyanBm
Date: Thu, 24 Jul 2025 11:09:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v4 2/4] i3c: Add more parameters for controllers to the
 header
Message-ID: <aIH4ZmqVcYhOT8xT@shikoro>
References: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
 <20250722190749.6264-3-wsa+renesas@sang-engineering.com>
 <aIEAk3DF7Ez7NFwK@lizhi-Precision-Tower-5810>
 <aIEg-qyGhb8B2Rep@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIEg-qyGhb8B2Rep@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_021001_507146_D5E2854E 
X-CRM114-Status: GOOD (  16.20  )
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

On Wed, Jul 23, 2025 at 07:50:50PM +0200, Wolfram Sang wrote:
> 
> > > +/* TODO: Document a reason for this value */
> > 
> > Todo? Can you finish it?
> 
> Yes, but in a seperate patch series where the value is to be changed.
> 
> This needs additional testing because I want to update the other I3C
> controller drivers as well.

So, I started the research [1] with the conclusion:

---
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
---

Based on this, I will send V5 and move XFER_TIMEOUT back into the
driver. We don't know yet if a subsystem-wide static default value is
actually the right way.

[1] https://lore.kernel.org/r/aIH1zUb8tyIlyC3S@shikoro


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
