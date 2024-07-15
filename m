Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0863C3DA59
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Jul 2024 21:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+N5zA8aWZ5q0SEiqZs/hHCWsyL25KuZi5y2ZFix2ry0=; b=4vp3vDxJmfF01e
	AsIpoif3uPeJ56GEWDmlCXk7yMI2zbWnI1iRlxSW2s691hdM8MXJUgMXjdsBkce1zAXxHZ81NILA2
	WSNsZGz9CUh4WUOizu9Qbq38gwOgXKLIIiBGhFrHstbPKGHh51MRl35kL1wlnv92QkejcsB4rkR/A
	UIsC1/PFOqpEFlNg0GFA60epUqOilbCSLXyDJeHL1D9x+IByuFl54G+NulR5+DBNiBqOQY9e9qUWM
	KtLRmXc0v6h6HepGyZgfjdjWZPxM7uEPmzx3cSLmPhEdOSEGlHY7wRh48cUjdzObCXMALGuXvRouh
	ehRBDP7KVwv9rt4M2Zaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTTYF-00000008Vrc-1whR;
	Mon, 15 Jul 2024 21:48:07 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTTYC-00000008VqO-2PV2
	for linux-i3c@lists.infradead.org;
	Mon, 15 Jul 2024 21:48:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D1CF1C0002;
	Mon, 15 Jul 2024 21:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721080082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3nywHBZCGdSjrJnNqCKE0IglxWuukGOH9wSy9XK314=;
	b=QmhGa4UMbIjsYIJn/olbO0hlT+o75kCjoS6WKzACA/NNZTUa8pfxYg/vAw3vgZVCGz2zQW
	jwWXvibXDT+7mFpIq6GXY/EHxkxyqzzIAmae7nTuUnIOYUkOEXJtTn4p2Z/NauWdaVuGZt
	wsKp2N2kRoPyvJgYjUwqLb3QWsjau4UpvJzHDbxUIF67pWoN+yPM4Q7lHidV6kBDqGsqTq
	g9gK1PSIzGPhPiMh8Ha5mckbdcpLQ4fOJPP1z0JGYLZ6yd4JwT9LfeIJvTX5I/TQ77y5ae
	rWuPVTqhi5WCIclqXh9KfgmBvlE1stLyzQdmcM3fF3ijpar2Fdus3gBNnAgv8w==
Date: Mon, 15 Jul 2024 23:48:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bhoomik Gupta <bhoomik.gupta@nxp.com>
Cc: Frank.Li@nxp.com
Subject: Re: [PATCH] i3c: master: Enhance i3c_bus_type visibility for device
 searching & event monitoring
Message-ID: <172108005329.1453338.17841860883456945648.b4-ty@bootlin.com>
References: <20240708053835.3003986-1-bhoomik.gupta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708053835.3003986-1-bhoomik.gupta@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_144804_782516_E123511E 
X-CRM114-Status: UNSURE (   5.88  )
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

On Mon, 08 Jul 2024 11:08:35 +0530, Bhoomik Gupta wrote:
> Improve the visibility of i3c_bus_type to facilitate searching for
> i3c devices attached to the i3c bus. Enable other drivers to use
> bus_register_notifier to monitor i3c bus device events.
> 
> 

Applied, thanks!

[1/1] i3c: master: Enhance i3c_bus_type visibility for device searching & event monitoring
      https://git.kernel.org/abelloni/c/e06704e3f513

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
