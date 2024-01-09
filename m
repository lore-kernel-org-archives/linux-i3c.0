Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA3EC46CD2
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Jan 2024 07:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nR8gaTY6rBGVV4hZp27tfH4ZjcLy1A3nyT5oOQGQRUQ=; b=aWfjWQ2EJrv+Z7
	YhefjJJRYG+KwTiv1KDNjEiXSqnhWITTh2ICdOKyGYuD2w2oZImhqgTsAu/bzlSncW7Q5CRBjGtsJ
	hY+uPFSfAfqFFlH7Xgzane2syAG1JINHEOaygjkCaxRXxD2Ro7YYMZ3KQBsam/JGEqXHTLZKp62Zr
	KRqTHxmIz8WZo2AJRrq9CrZZWpnlP7WXIT0YvRi2sRGhRJ4LoA5/+e/nTSwtJE4VyZwQs4+GeSJnh
	4JPmaTggfR6m/AbMx5BDJUtnWBMXbCqIpYFzAIM0wQV0qAgtU6D72CqWa535dw1BCRNEobdXiyU2v
	DGnjNW5v3zS6ftLBYpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN6do-007BGJ-2L;
	Tue, 09 Jan 2024 07:35:16 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN6dm-007BFp-0I
	for linux-i3c@lists.infradead.org;
	Tue, 09 Jan 2024 07:35:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D68EBFF806;
	Tue,  9 Jan 2024 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704785708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g4dJB2jrYpwd2emaRyG+9ezzrTSheoF2q2JvQuIR+aI=;
	b=Okic1hZFBhRED0jVi5a/v1nlbL5qAeWosYPSGQ0PoUP5NaEgToPwxWNwPa/JFVhjfujpGq
	OXU0Hx+x3SuKWMp5/fHmBBJ2lIvnqUgdhF51VuHs0LnbroBE4tYpg8td/nUOznMtHWETzl
	EGuh4hkC/LtN/apG3z5CydTwscAGAtkfeUzk2ePP0prJkuTmbg/WzYEXnbqAbrDpKQi8ah
	sOlbNVOFaBDLk1+92X3Hd3AzvqdEXj6cynnJxfJGwq3Yxt7L7JDHqHnEJYQpx1X1NLltbZ
	WIsf5Puyqzh5sl8S9Gerb/YSSTfnKwDMD2FQxZvjDPzyuMrFAtK4etiFSVwbuQ==
Date: Tue, 9 Jan 2024 08:35:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: (subset) [v5 resend 0/6] i3c: master: some improvment for i3c
 master
Message-ID: <2024010907350708773e04@mail.local>
References: <20231201222532.2431484-1-Frank.Li@nxp.com>
 <170467220283.558820.13886846242749418731.b4-ty@bootlin.com>
 <ZZyfL/wWSW1oMOec@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZyfL/wWSW1oMOec@lizhi-Precision-Tower-5810>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_233514_403744_D28B4BE6 
X-CRM114-Status: GOOD (  14.04  )
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

On 08/01/2024 20:19:43-0500, Frank Li wrote:
> On Mon, Jan 08, 2024 at 01:03:50AM +0100, Alexandre Belloni wrote:
> > 
> > On Fri, 01 Dec 2023 17:25:26 -0500, Frank Li wrote:
> > > There are three major improvement
> > > 
> > > 1. Add actual size in i3c_transfer because i3c allow target early termiate
> > > transfer.
> > > 2. Add API for i3c_dev_gettstatus_format1 for i3c comand GET_STATUS.
> > > 3. svc master support hotjoin
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/6] i3c: master: add enable(disable) hot join in sys entry
> >       commit: 317bacf960a4879af22d12175f47d284930b3273
> > [2/6] i3c: master: svc: add hot join support
> >       commit: 05b26c31a4859af9e75b7de77458e99358364fe1
> > [3/6] i3c: add actual_len in i3c_priv_xfer
> >       commit: e5e3df06ac98d15cfb10bb5c12356709365e91b2
> > [4/6] i3c: master: svc: rename read_len as actual_len
> >       commit: 6fb61734a74eaa307a5b6a0bee770e736d8acf89
> > [5/6] i3c: master: svc: return actual transfer data len
> >       commit: 6d1a19d34e2cc07ca9cdad8892da94e716e9d15f
> 
> Why not pckup 6/6: 
>  i3c: add API i3c_dev_gettstatus_format1() to get target device status
> 

As it was discussed, it doesn't have any users.

> Frank
> 
> > 
> > Best regards,
> > 
> > -- 
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
