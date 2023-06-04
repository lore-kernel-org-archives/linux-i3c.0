Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F40C7EE23
	for <linux-i3c@archiver.kernel.org>; Sun,  4 Jun 2023 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9avGQEUZ+gOzEYMCmFZdFNwtbGxz9nIdb9USBMpScI=; b=mDE7+6vneMvgye
	gQpqit0davNSV/crrbdY9B008APrb/oaEYik8tEyCkfejnG7V9OjIRuByldtKWKkczcCnOcy2TCoa
	uRFJcFVJd9gs8fO3VXl74DFpcmXREe7svDDJwzW8JxxxmT3XjMop0+JW7/iesKQ+K9nsmbyZzpkax
	lOuqq72X1QnR5bRE9EXKsGr2XvFzdZYsEsKG1F0fe4EM5w63LZuwoFvBw1auSybae8tuqfx7f6MsV
	HBjQqugaSqQB5D+YLhKdS1NgbskLZFg4hQn54p45BMvH4RlsnNUUZIXabPHn0LJdCD6k+PaszGGbN
	c1Ta7AZH3dBRP6L+oy9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5wam-00DLuh-0M;
	Sun, 04 Jun 2023 22:52:56 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5wai-00DLuA-2F
	for linux-i3c@lists.infradead.org;
	Sun, 04 Jun 2023 22:52:54 +0000
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685919169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hZu8IphVkXP9p8je5/TGN5Q4I1XkOlHWgIEOsgSzKFI=;
	b=hTvGDqLq6BYRLHbNUcWTKH4QWo4M9RaYlESvNV9Iwq+NqX1w1ikLyKXfcdp7w1IFRJz9ln
	LkcLixRVpKJVJ+HMymmq6j1txO5jrzpetQQkSFXbWnS7KV9C9mGAyUCJXV/bXEE91NXwKe
	P4UjgpkgF1omIvhIrb4N2C15ggHzSuTLfy0kcVYgtVelN5iVXcEgrDGasGAhcYqr7Q+pqh
	wQZ8/7lO9heSsBFaG+qVoYB6b2xtP2kjDfbAkTVZLQ9ScH27MJbxLssFvitD3oxUVNPahv
	DS5R8o/AOX2I9w1X67EDUzI+rII9IBld1c0orGAJAfAL3XwIQALHoKwMZP5uMg==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D215DC0003;
	Sun,  4 Jun 2023 22:52:48 +0000 (UTC)
Date: Mon, 5 Jun 2023 00:52:48 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	Clark Wang <xiaoning.wang@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] i3c: master: svc: fix cpu schedule in spin lock
Message-ID: <168591905816.3958179.7662256666359712472.b4-ty@bootlin.com>
References: <20230517033030.3068085-1-xiaoning.wang@nxp.com>
 <20230517033030.3068085-2-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230517033030.3068085-2-xiaoning.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_155252_865458_C95BA6F3 
X-CRM114-Status: UNSURE (   6.28  )
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


On Wed, 17 May 2023 11:30:29 +0800, Clark Wang wrote:
> pm_runtime_resume_and_get() may call sleep(). It cannot be used in
> svc_i3c_master_start_xfer_locked(), because it is in a spin lock.
> 
> Move the pm runtime operations to svc_i3c_master_enqueue_xfer().
> 
> 

Applied, thanks!

[1/1] i3c: master: svc: fix cpu schedule in spin lock
      commit: 33beadb3b1ab74e69db2c49d9663f3a93a273943

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
