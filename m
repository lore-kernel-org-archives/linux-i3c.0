Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508E6C77B61
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Apr 2023 21:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHn083/GZV4SAApDrnz+H8zgMAHcGnQBjmJ3wHOR0YI=; b=E3PV8MR6xMWlRq
	YkyTV/RdQcRoPx/hPf6r0rgAk+pCtPwiEODHl+ciOg7GnDRrGHkXbQ+J2RY5eYqugBRELU+6OAnGy
	c0Jikfa1NZ0DILYpl9Priu/TZUbpuC+X5zDHWTbQwOFJlGbQ1LJ6eMFN3a3Hh8soEbSvWt8JX1nTK
	1n4R3zH1LMUqNrvdL6qUkV6hyfk6cXT/790jO+0nRwR51+z5KrQe94CRzyMivprTFgir14NkD4D5O
	g+y+i1aaruf3VcnL2biCSCLlxheSRoVeWcorg4hxrE5SDLX7KoD1SMUYdOz2y91YKHycNl4fqy815
	s/v9eUVUu4m34UNZ3J9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps9Vb-007dZx-28;
	Thu, 27 Apr 2023 21:50:35 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps9VY-007dZ6-0K
	for linux-i3c@lists.infradead.org;
	Thu, 27 Apr 2023 21:50:33 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B92E4FF808;
	Thu, 27 Apr 2023 21:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682632224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+9PMhAbx1wOtYhp6w+mkH7U9Wo3g6veX6JfIXSbn04=;
	b=FQJZnjIOWWWcj5asSgeOu5o+BZliCIjYfRAAMVsdu5Hr19gqII4fnar2On3xv/Re2gBVZ2
	2hjExRWN4b5E2McfQ+69zeaWXzRyS2JL8Y3vXlp34bZz8L7Lb3aW3wwWaIhgfqVWCtbAi5
	z5Aw5Xbp40K7zvJHrp47AFOxtpsnCOBEWRcJIGXKhY1lC0hXBCFaeDseQJzlN0Ua8IFTNT
	rTXg2bQFcE5LtIu4UVeUOfrAuxoQURbdtMB/V2TqJvjJ06pHxP1z4OZ4i6pNLg/dQdVRYV
	tZ7gCNICNGubQFwm0GIf6Bk5fAcq+d3dRRfyzs/CrgigP//cnJ68iESoVbpiog==
Date: Thu, 27 Apr 2023 23:50:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>, Jack Chen <zenghuchen@google.com>
Subject: Re: [PATCH 0/2] i3c: dw: minor changes
Message-ID: <168263219816.38556.12743826973330071477.b4-ty@bootlin.com>
References: <cover.1680156630.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1680156630.git.jk@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_145032_284795_AD175073 
X-CRM114-Status: UNSURE (   6.52  )
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


On Thu, 30 Mar 2023 14:15:31 +0800, Jeremy Kerr wrote:
> This series contains a minor fix for the dw driver, and a small cleanup
> + comment.
> 
> Jeremy Kerr (1):
>   i3c: dw: use bus mode rather than device reg for conditional tCAS
>     setting
> 
> [...]

Applied, thanks!

[1/2] i3c: dw: Return the length from a read priv_xfer
      commit: 67df5ce9dd8870d3e53de5ebd6aecf609b713044
[2/2] i3c: dw: use bus mode rather than device reg for conditional tCAS setting
      commit: 66b32e3d2c6daeeafb80fa41f3a41e4c0ab85cc6

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
