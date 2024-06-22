Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19C2C27C53
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2024 22:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=784zDLToFKNp3+9vUN1D77m+9bEOt2INFDrM09stnq0=; b=I3+dKhwtcmLkvv
	uK91unXvZXaqOOqKh/VGk185pnE/vtw4Mx7GuIzFJJ96GpQDgEcXEyMWASwlo6eiPZ1EXQL5AXErY
	uBaBd5HrOkMxZwn9baVJZvl9Zs6uGXIvbebmWG2C9TpuWLbCbP23e/DrlYA/xo6V/YhmUcZTi/UZK
	cb1hGlxRMhlnNdBNu1nzLMnFEexiK7jDrgkkld35Ug/zThvE/Fx1zLDI0KB5XT2s9DLmtaVdByhRa
	e7d7muDrjv4/QAS/ToVUA2fyXwnIlc2Rlak0PZO7e7KNclCe6W5B7lfVT1h7wFeP3qIulOzpGrz7C
	pf9NNzBlspRjE30ZlttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9Ib-0000000CvcY-15Ce;
	Sat, 22 Jun 2024 22:33:33 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9IY-0000000Cvbz-0Le8
	for linux-i3c@lists.infradead.org;
	Sat, 22 Jun 2024 22:33:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C7E7FF805;
	Sat, 22 Jun 2024 22:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719095607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yAig6dC8mmO+ffpgNNjwAU36oDbyKtV33/YZDermEsg=;
	b=hafdVrroY7TjNpxQqyNnhczBTzWc8Cut1Wq4JkxN8tH1u76bV12HIoKgZqoEUV9Htsmkh+
	LkMpZTcSJz3B1pAVnHiANxWtE3ewDG3QlsUlJtIecEvqJiMI/kP3QMibwi+MWj+QSLM2r/
	m4rgoleFVfahOZA+yZ+g8ysz2OCPKiYx4pGkbyF9s5FMYeu+JC3JZCHwwVluq5pH7efIRB
	vdV+EYnZ/SJ+h7ZlNkDLa7Hz3vLnFw6ffLhS4eOBd8gy2aPTVnXvAPY5NMEb6TOvzXmjKX
	fSg/XPUMHBfYoffN8Ff4GBBmC1SGY9f4zIYmIuEUEGERrvfXlYJmzGUQAV/UyQ==
Date: Sun, 23 Jun 2024 00:33:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: Fix clearing queue thld
Message-ID: <171909557750.2164405.17868065814725354783.b4-ty@bootlin.com>
References: <20240611112650.411214-1-aniketmaurya@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240611112650.411214-1-aniketmaurya@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_153330_279534_F79C3D53 
X-CRM114-Status: UNSURE (   4.99  )
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

On Tue, 11 Jun 2024 11:26:50 +0000, Aniket wrote:
> QUEUE_THLD_CTRL_IBI_STAT_MASK is repeated twice.
> Replace with QUEUE_THLD_CTRL_IBI_DATA_MASK.
> 
> 

Applied, thanks!

[1/1] i3c: dw: Fix clearing queue thld
      https://git.kernel.org/abelloni/c/ed569e6cb3d7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
