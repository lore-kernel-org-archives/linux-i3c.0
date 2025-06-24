Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0C2C7EE32
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 22:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrN12N+f9E/87r9rs64jIOfZA9tV0PMwaixS+38IqJ0=; b=dn0hJiWpJNhkqt
	jjimcfQmxfi/7JeB6BCr0R8DjrTGCD+3WQJJhpSyGIwVfWezvGpg/5LOd4aO7AAyjUKXbRi0hspDH
	Gcoe0VIgSRn/r0wygOKXShhBbbwGXmcuNN6m3VOgIa2Hab6hsDPHGbWcBZ/y7ugufjkgGxOBuddni
	MmNPfxVikDAnrpxHeUzx+X0p88N5pyNHKiyffEGl9L7bJ31WWGrQsPpCWPdZkc3kbsRw9yKdeYgFk
	+cky+7X7zh7PClyiqncZ+/RLCkY8mbIS5odMSAqJ2j1jS/S9uYHVtRVCBV3ejEzlL9uQYOzViPke2
	bMtVVpbv5Z5VP4izQhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBuF-00000006xNY-3bVL;
	Tue, 24 Jun 2025 22:14:19 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAM5-00000006mjm-17kw
	for linux-i3c@lists.infradead.org;
	Tue, 24 Jun 2025 20:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7AuJ
	9YU9jFDUljZO+hquoP9p/rWqhnul6Xl2GFZxwtM=; b=UXknAuxxM2nUZiVNhIV0
	ukczPTnOpElPLZiDJtCSq7WpZU4KY65gH3hsRfmtwXKfGOsnHDmVRdSnYh8Q0siM
	UOnWCWf7f7ZJuq16C23DMjYPi22FjHOSfD+ebjB2/2LMtKnO32dIlOAbRxebJu+T
	bJUclI5vIxmuvoAHHFMj92pxB2BUisnKYz/rcHrNeIv4L0YupwxcQrYh7R8RZqIk
	iS+q89uQ3xSZtdpNqbiKzXBRzVTM/AceLcCR5/R4Fxbz6b1oc5fSCK0pzJpftU/q
	igRCurDWYQT9Aa+qFZSUQzEJ6o12TvVlbPIic36hMdRg3FEX/MNRSqHTfFFXxDFA
	qA==
Received: (qmail 392374 invoked from network); 24 Jun 2025 22:34:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jun 2025 22:34:55 +0200
X-UD-Smtp-Session: l3s3148p1@4ZbHQlc4cOBb5ybD
Date: Tue, 24 Jun 2025 22:34:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>, linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aFsL3pJBT6IpYD5M@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro>
 <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
 <aEvyfM42WTKENbFO@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aEvyfM42WTKENbFO@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_133457_579680_18BAEABE 
X-CRM114-Status: GOOD (  11.66  )
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


> > > There is a specified timeout? I couldn't find one in the specs, can you
> > > kindly point me to it? So, the solution is to use 100us as timeout?
> > 
> > See: 5.1.2.5 Controller Clock Stalling
> 
> Ah, I missed this one so far. Thanks!
> 
> > The spec have not defined what exactly happen if stall clock more than
> > 100us.
> 
> I am going to the I3C Plugfest in Warszaw in 10 days. I could ask people
> there...

Well, I also couldn't get an answer here. It seems that part of the
spec has not been excercised a lot so far. The best recommendation was
also to use a timeout < 100us, so that you have a bit of time for
cancelling.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
