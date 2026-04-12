Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A427E937E3
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Apr 2026 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAsqE1rce6F7rYYTdbUreuCbdVkvG6bb/muxMX9x7+I=; b=h8H1Urq6SeUUpA
	0IQjqJ7Sh/lmZeQMx2LCvsEN2LO8RcBWLQj6ehkF9aTefzKtKZEavSCcM1YbmKy8bkVhyTPM5tE/W
	LAgP2ms0JVmcAHtSjpAewP1RbRACsn2UfoAtl54iBSl7KAns8F7zUmRgmW2FdmRJxb8zkN0mmGcRz
	ICCa+yzCk4QCe1U/uijd95v/VzPDSP+ozd007UqVqkx2hL+Xxmnem28efalWYcXm6aGqCPBukdw52
	q2QOd9GweXl8vIFyEndxrUadUAWzIzy26uVkocWlaNDR/4W6s7/kkmIfexXamSUmV+bZoNS6sjcf5
	fBPbSgNmKLYTqPBX/cxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBw6B-0000000EP8s-0ALT;
	Sun, 12 Apr 2026 14:47:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBw67-0000000EP8X-3mUn
	for linux-i3c@lists.infradead.org;
	Sun, 12 Apr 2026 14:47:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8FFCD4E42964;
	Sun, 12 Apr 2026 14:47:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 528725FFB9;
	Sun, 12 Apr 2026 14:47:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB6DD10450084;
	Sun, 12 Apr 2026 16:47:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776005256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=cDe2ucezDuoaKLR/zkc7ZGfAeub4oxZOtyYV3akHexw=;
	b=1UedOYA8xAcxpZpnY6rhMm0l6m2BMcizG7Ar3k4ov2sScJdk+nfZJZ/dzGAfOTAk0suUdn
	EXL5dMdsWGJWb5ER/bRjdAhGKE6f75WF4Qe1vqne2Z5FuRZNY/fdU5puQ8jFp7sKd2lALA
	yVIE6ew69hm9G9HAQqJO57QSu1RManMy701ejQal0E96OBE9LjznbOOnKdr9WqR00Boeqa
	l8RNz4NslJVP1Uq+i6nzutdEo8+5KNlcoQ1Xmb3JlLjRhqIubjiOzlTSlhmK636GAclPP1
	91MCTA2mLmxr162ULw1pdgFdR2/ZEN33BD6dH1mXnCKDgtzTbFio9zKefgJALg==
Date: Sun, 12 Apr 2026 16:47:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] i3c: master: renesas: Fix a memory leak and use
 __free(kfree) to simplify the code
Message-ID: <177600523975.2787082.12948812134922047586.b4-ty@b4>
References: <20260406-renesas-v3-0-4b724d7708f4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260406-renesas-v3-0-4b724d7708f4@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_074740_108685_E7BE2EAB 
X-CRM114-Status: UNSURE (   4.97  )
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

On Mon, 06 Apr 2026 20:43:15 +0800, Felix Gu wrote:
> 


Applied, thanks!

[1/2] i3c: master: renesas: Fix memory leak in renesas_i3c_i3c_xfers()
      https://git.kernel.org/i3c/c/d7665c3b4f57
[2/2] i3c: master: renesas: Use __free(kfree) for xfer cleanup in renesas_i3c_send_ccc_cmd()
      https://git.kernel.org/i3c/c/57c91ca3dd87

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
