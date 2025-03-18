Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16EEC282EC
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Mar 2025 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wiT8d6gxQxfQEVkgrJzxj3DnUDb3++GA0xrZEGuda84=; b=BZFVG6LOSJnxiH
	QgJI+Nv/aWzXR7goXVLni/3cVatWBUCiwwTwULKpn+VSAXozwaIJjIolBp5NmTXsZVI9KF9EsUilQ
	dDfvwaQ+Nt1ZgGlfiiIelO7V6mv06m7m4Wo9TXPy4RutbvpkjBdDB+ccXuacE3+wSaAoRnK5KIZaT
	boch4P0biMjWdkzNoAp915l9G7h7cUAibS1oTwKA89OuLiw0sO8D9WAscc91EbGMcLAB1v8lBKjAM
	dDQE6Wg8R8/A6Vg4vQAQsSBiAHDkdNwZg5KTtrPeVb03K93yEKiyvOl+bQBX/JZhrvOIz2iKEijy1
	lBtY3wJjejmxr3Jx2llQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZKy-00000006RBl-1rCO;
	Tue, 18 Mar 2025 15:58:40 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZKv-00000006RAY-19tq
	for linux-i3c@lists.infradead.org;
	Tue, 18 Mar 2025 15:58:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 532C944338;
	Tue, 18 Mar 2025 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742313514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fP4ry+VLHXbxhxlQCKXjcIOOhVgHzKoDLPahcV+SBW8=;
	b=l7+txS75TzzQJ7j92uC3S7/c6sUR3CfA5jujJbbhZz/oXe5isRcJz4X2F5qL6dbvoWTYBj
	ggOKABa3a9W6tiMG4hAWo1g0n3OWrpWU3LpEvK/aDaTC4v2p4wneOh5hIPgjKSxuihO7hp
	OTl8hgKCTVGm2fX3Mvb+Ue46JgaVeOl6OEso39CFOYKZ9K24H4ZsunzicHRJTAJLw2NlGb
	7Lk6UdwO1UD/u/Gjp/iHmLcGA7XN4T8i+9UNt+Jhz04Uwfu/PMSFzIc7l9324gUTDaaqNm
	cx4mk9a5zkcfXlCTLrtPtCm2haiTRL+cJVQXu6vHb3aIn6u9xLyuhn82gaDDfg==
Date: Tue, 18 Mar 2025 16:58:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i3c: master: svc: Fix i3c_master_get_free_addr
 return check
Message-ID: <202503181558316ef27a06@mail.local>
References: <20250310023304.2335792-1-yschu@nuvoton.com>
 <174225158210.1593610.10018812780731849409.b4-ty@bootlin.com>
 <Z9mIUc6Ln59umJtT@qasdev.system>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9mIUc6Ln59umJtT@qasdev.system>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugdujeefmegsjegstdemjeeitgegmeefudefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugdujeefmegsjegstdemjeeitgegmeefudefgedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehqrghsuggvvhdttdesghhmrghilhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehng
 ihprdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_085837_444126_74810E2A 
X-CRM114-Status: GOOD (  21.69  )
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

On 18/03/2025 14:51:49+0000, Qasim Ijaz wrote:
> On Mon, Mar 17, 2025 at 11:46:29PM +0100, Alexandre Belloni wrote:
> > On Mon, 10 Mar 2025 10:33:04 +0800, Stanley Chu wrote:
> > > The return value of i3c_master_get_free_addr is assigned to a variable
> > > with wrong type, so it can't be negative. Use a signed integer for the
> > > return value. If the value is negative, break the process and propagate
> > > the error code.
> > > 
> > > This commit also fixes the uninitialized symbol 'dyn_addr', reported
> > > by Smatch static checker.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/1] i3c: master: svc: Fix i3c_master_get_free_addr return check
> >       https://git.kernel.org/abelloni/c/d6cb667b8e15
> > 
> > Best regards,
> > 
> > -- 
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> 
> Hi Alexandre,
> 
> I sent a fix for this issue on the 9th March, which is before the patch
> Stanley sent which was sent on the 10th March.
> 
> You can view my orignal patch here:
> 
> https://lore.kernel.org/all/20250309164314.15039-1-qasdev00@gmail.com/
> 

The issue is that you then resent the patch with the same topic which
superseded your original patch. But the resend was missing a blank line
so I could not apply it immediately and I later applied the other one.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
