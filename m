Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073ADC7EE39
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 11:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8AjXdxJIi4V2+7+e1B/atTu3LLPvL+rwkT8g35sshI=; b=aTR5NHWKcp7ySp
	bEajQfDkd5M/frk7RVfr59d5HzaCciSeXSMHjqxO5idI7mSd9lCRR3LQG2mLm7OyPOABHAQkI6IRY
	TAPcR6sT355QACZ51mKZLqnkR0qNQaXXkh5G70mdRCBjNeC+vVgb1KdwpjffdIS8fGmX97afPAeux
	IbN6GPA5vSrXvVDCAAwn3f3PZCxo5AzruMF1cdyhLvryQtsIL4mlLgigC/n4RR/KELvemgtokg1KI
	nmmksNGl/Xqv83ubm7EeCqKxb0+3p0G7b0YqLqo0YVzvg0C//jxJvK/PiyGLj+Vp9aXSd7IrV/H7i
	qs3xuN9OOt4ypjIlBjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNxy-00000008PwP-3F7y;
	Wed, 25 Jun 2025 11:06:58 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMvY-00000008Egc-0nu1
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 10:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PiEm
	MoOYAz7QZzNJFDzzDAKfovCal4h2Wgp/iO94uSo=; b=I7O9PAkIsHbtozkdMdCS
	2Bei1k471pUlS+QJwH7E5Sapl8oqS8LrixSS6PB7E0q0xep+u3lmhE1BS++7tOF4
	3wRZx8Tu5Csg18Wx6EYj2hgIAa9cUDDD3ByxibQx9np76AbF4lsUwu9dl9p4tYsP
	77zDkUAEJY7mMH2V90G2ck+prpjpUQwTuQEhlT46myVg9QzuJmm4uI8lWmp4cCNQ
	quXysGRU/oBSmGEbtZ878FwZLpNIRDp/CMQTt/UTps0jPTChMPUt3/N+H7Z4zyz+
	Pp0cJeQTUxcT72ZOgNfNoZCg1tY8pkkd0h+ETRZnHdJaONPdghf0zJnAeLvueWBL
	jg==
Received: (qmail 600652 invoked from network); 25 Jun 2025 12:00:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 12:00:20 +0200
X-UD-Smtp-Session: l3s3148p1@KvU5g2I4CLVtKDAs
Date: Wed, 25 Jun 2025 12:00:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aFvIs2KlyrMztLsf@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro>
 <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
 <aEvyfM42WTKENbFO@shikoro>
 <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
 <aEwjU-uq4XsNzrOO@shikoro>
 <CAMuHMdWOxBfwwXUpYpmB30Zpqdwgwa2d=hXQyYVsoAD0bN4seQ@mail.gmail.com>
 <aFFQDlFJXFRYgNAN@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aFFQDlFJXFRYgNAN@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_030024_509062_02D4F4A5 
X-CRM114-Status: UNSURE (   4.55  )
X-CRM114-Notice: Please train this message.
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


> > Thanks, much better!
> 
> Sadly, my mails still get the "suspicious header" warning :(

Sigh, seems like infradead was not happy with me signing my emails. I
removed it for this server.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
