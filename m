Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC39FC28B28
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Mar 2025 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OnO1Yvw+A+QnEhSRW2dQHG3An+dDN0GibgP6gwWAVM=; b=Y9QDKJHQxyD655
	PmI029EBccdJPUWjHwIEBr3bjnIQ5BsurWMa2Lro2FrWGOzCRXo/RZLwKypG6FAVOQVsWmQkhI4yb
	nEsaNN4unFjRbfLhAUd5631/1AoGQUhCcGCekf4CLJo5OdROtzalMHUs6+cVjxTau8oI3Hqv306dC
	LKfVr+F6uWXjKWxVy8vomNviaDZ9zpHB03jGPM1tWkdEVmOnfTR+yyVcXb8BmZytLEvLrbaDz8ewn
	d/NOal+DwxY7iq9wADEYBSq/7y8FmkVlnNhluQIeKv+RtpHeqPQ/722B6R/sIeu0oDHEQLk+XqZPS
	Bu7IchyKTOAkv3i6lzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZQ9-00000006S5r-2gA6;
	Tue, 18 Mar 2025 16:04:01 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZPG-00000006Rx9-3jFy
	for linux-i3c@lists.infradead.org;
	Tue, 18 Mar 2025 16:03:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A865E444D8;
	Tue, 18 Mar 2025 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742313784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vde5R4uQeHzajpvd978N33iOJfNN8b+iJiyuAvYgdTw=;
	b=FDJLG0VfY2VAU81IYpjXPDkJJJd6u0fHltPGzIDj51JKTusw462PHrN/0EyMe78QS9LpIF
	VlK8BTzlS4MKM6ljwV+N4TMAP6i6Y7FZnxR1d9vIaSQYQaJ9CFYtzd+47Bcshe/vaFUU4j
	9fIASLIb7ajWfK8LiknqaP+Vt2YUPnzM0xc5Kw6Yop6nS5vWIa0NGKKrXi4LpAM0nK0U4w
	3Zn5n1ca+KWKvMQGHpiEBSvKqnu0qMnuJxvK6ExlxFF3n0o3HS8ciVmauk4ApudH2u1pav
	0fSJbEzODdqC+fEIePeC3iPP7hm39Zir/ueLt0AcnbVWTy0qMaITqUmNF9iSPw==
Date: Tue, 18 Mar 2025 17:03:03 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Stanley Chu <stanley.chuys@gmail.com>, miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 1/3] i3c: master: svc: Fix missing the IBI rules
Message-ID: <202503181603034c9ab59f@mail.local>
References: <20250317051951.3065011-1-yschu@nuvoton.com>
 <20250317051951.3065011-2-yschu@nuvoton.com>
 <Z9glVBnpdwXuLwD7@lizhi-Precision-Tower-5810>
 <20250317224440840e4117@mail.local>
 <Z9l1ycFFisuZn2zI@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9l1ycFFisuZn2zI@lizhi-Precision-Tower-5810>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugdujeefmegsjegstdemjeeitgegmeefudefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugdujeefmegsjegstdemjeeitgegmeefudefgedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopefhrhgrnhhkrdhlihesnhigphdrtghomhdprhgtphhtthhopehsthgrnhhlvgihrdgthhhuhihssehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlr
 dhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhgvrhdrmhgrihhmohhnsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohepkhiflhhiuhesnhhuvhhothhonhdrtghomhdprhgtphhtthhopeihshgthhhusehnuhhvohhtohhnrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_090307_067642_7979BB83 
X-CRM114-Status: GOOD (  20.83  )
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

On 18/03/2025 09:31:53-0400, Frank Li wrote:
> On Mon, Mar 17, 2025 at 11:44:40PM +0100, Alexandre Belloni wrote:
> > Hello Frank,
> >
> > On 17/03/2025 09:36:20-0400, Frank Li wrote:
> > > On Mon, Mar 17, 2025 at 01:19:49PM +0800, Stanley Chu wrote:
> > > > From: Stanley Chu <yschu@nuvoton.com>
> > > >
> > > > The code does not add IBI rules for devices with controller capability.
> > > > However, some target devices, such as secondary controller, also have
> > >                 ^^ dual rule devices
> > >
> > > OR
> > >
> > > However, the second controller have the controller capablity and work at
> > > target devices mode when the device probe. So add IBI rules for such
> > > devices.
> > >
> > >
> > > > the controller capability.
> > > > Modify the code to add rules for devices capable of sending IBI requests.
> > > >
> > > > Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> > > > Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> > >
> > >
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> > Please avoid adding you reviewed-by tag when you request changes, else
> > patch work will show the patch as being applicable. This is fine to do
> > it occasionally but not for all the patches you review. You can simply
> > wait for the next version to come.
> >
> 
> Okay, I saw some device tree reviewer provide tag if only some minor
> changes.
> 

Yes, that can be done sometimes but then the submitter would have to
collect the tags which didn't happen this time and there will always be
an extra review for the subsystem that will gate the patches.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
