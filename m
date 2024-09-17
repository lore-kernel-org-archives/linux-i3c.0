Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15D3CAC58D
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Sep 2024 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0I9b4D8Sm4Ck0d5n614Trn8+2xU2OoGDAt//owuHJQ=; b=Yubkl9ZYRtaCsU
	uMKUppkK3qsOyDgPm9KrdWaAdFDzG/w2574FOcXj5lGazB8n5/Fd/0yGCIT13+aaaLzgGFqI7pYtv
	Hr2aXwSjX3jljcuOZ6DhyfnhY31/tUI1figjfUaeqy2QzDIAklr3KCWtQaq4KM5zRgeK+D/zHP2cp
	mJN2uGM0tlh4/bonXihnI4V05bLIrStFgFKsHbA7BShG6vtW5SOn52yEi3EYOj8VcYwpGO4RPwdXv
	tbmwZULtBpl+UBmObuO4ELU4JEx0TgtAOKSDTZIl5zuntTqiOy5rADqtDtMhlIcJVTllNK0HKD99d
	6L3UrJuFTBCXwPRfpPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqacu-00000006Rve-1SG6;
	Tue, 17 Sep 2024 16:00:28 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZf5-00000006Lpx-3JU6
	for linux-i3c@lists.infradead.org;
	Tue, 17 Sep 2024 14:58:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10115E0006;
	Tue, 17 Sep 2024 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726585116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fxuFezK0xjfMGtoX3SnZWKbCuPTSYzqIfR4UXyDll6E=;
	b=egQHzoSFCzhBvijzyk+MN6mXNHGXSJjNbOHHLIZDVGOataC7fdpqzTryktYsYekOpE47sj
	DushjthwZNV8MorE/+nKHBoYDFf94KkrlNgyFybzJZOkDe01HhSqlfvhl1tGFSqU36SXIW
	hD3PWRyM/wUluObJf6+zylh7ZQvQu92NBn2NMGl8GKXFS4158a3LCDZkp+9QnprzcOLR9Q
	G/GjFsVbHpTjUtFpIsKFNV16npcZW5wscoBKbot8q9+CwWkz0hsR04gLidNFviorATD7Ix
	0FANn1aqhPKi1xVDnuUwiKkFGf3E4Y9gFSxUZalh3Xx1WZl47s88QaMxEQyNWw==
Date: Tue, 17 Sep 2024 16:58:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com, frank.li@nxp.com,
	carlos.song@nxp.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH V5 1/2] i3c: master: support to adjust first broadcast
 address speed
Message-ID: <172658508683.68424.12218247032382293641.b4-ty@bootlin.com>
References: <20240910051626.4052552-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910051626.4052552-1-carlos.song@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_075840_001887_972D6582 
X-CRM114-Status: UNSURE (   6.50  )
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

On Tue, 10 Sep 2024 13:16:25 +0800, carlos.song@nxp.com wrote:
> According to I3C spec 6.2 Timing Specification, the Open Drain High Period
> of SCL Clock timing for first broadcast address should be adjusted to 200ns
> at least. I3C device working as i2c device will see the broadcast to close
> its Spike Filter then change to work at I3C mode. After that I3C open drain
> SCL high level should be adjusted back.
> 
> 
> [...]

Applied, thanks!

[1/2] i3c: master: support to adjust first broadcast address speed
      https://git.kernel.org/abelloni/c/aef79e189ba2
[2/2] i3c: master: svc: use slow speed for first broadcast address
      https://git.kernel.org/abelloni/c/20ade67bb164

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
