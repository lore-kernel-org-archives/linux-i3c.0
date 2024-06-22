Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC098C27C53
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2024 22:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3wyvBIyKbt1Wsp7tXeJtwfcO9vs4Ph+48hux21GD18=; b=zEWSu8YJdxbDHF
	UnL/93lN52ecISc/ruAWVjGwsbPzd3PbhtqH44AZ4B/Vg96wmJTbfTpXV2BQYxNwjpwoxXpC3y+Xp
	pJHh2IeiaWmSF4dW6/wyGOyxjbdaUiyPIpVIE/h6lKxZ2mecNCUMxxbPwscKQouKR35rZhJSpN/25
	5FwEwtcczH/xUWDKbXqyK/x/FEt4Zzb7mCBy/rRcYlHvQLhlYE61KMY50JcJ1C2kT/IHvk5e7tIz0
	22tiJkGdutcqzHodcvYWLbqltWm8qbmfHmG2HhV2DmQHr07YSYOHdB7smjxf73zX0nwbe0/EsER8a
	j5tFEb4mLlj4r07L+k3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9Io-0000000CveG-00go;
	Sat, 22 Jun 2024 22:33:46 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9Ij-0000000Cvd3-48p2
	for linux-i3c@lists.infradead.org;
	Sat, 22 Jun 2024 22:33:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2C82240004;
	Sat, 22 Jun 2024 22:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719095619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LU2ICDL4fp4IsPfmkBKqQ0+h5x4H4+vh585u8iwlvKQ=;
	b=YI0w9F/4+gsDXJxti2JhDcfgtEYK23ABTaOePkV+6My8LiUYPCcF1NopzoKL407rOdX3Qc
	8bL+aEbUhnUnB/OFB5gaGcxwwFRDZ4i/yu3dBlOFlzmgqfDnPtgdr3/XHhEkXmzOLcLcQq
	3v/Fane+HIJ/pVN8wHHWBDHlCfbevmOori/P+Nthm5fK4ijHp+f8Ey3IabvoTsqWkP6jnG
	zDewbhMwG2fgLOgFTQbnsGzY8ig11OK9OP3jWKSXxOoNTy/KhOQY+/3Vz4eD5xcjL6RLUz
	6H5b4+dtcnYu5Lo96dy6DPGG7DXCr+U/mzir6Y6vS5ev6vXvlOaVF6soZg9K1g==
Date: Sun, 23 Jun 2024 00:33:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: dw: Fix IBI intr programming
Message-ID: <171909557751.2164405.7866528644975058275.b4-ty@bootlin.com>
References: <CAMmmMt2guEx1jajb2NC0iBnMGpkd2vaSiXg_BqgZhwrA=FARLQ@mail.gmail.com>
 <20240607072030.2618428-1-aniketmaurya@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607072030.2618428-1-aniketmaurya@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_153342_288884_A700522D 
X-CRM114-Status: UNSURE (   7.61  )
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

On Fri, 07 Jun 2024 07:20:30 +0000, Aniket wrote:
> IBI_SIR_REQ_REJECT register is not present if the IP has
> IC_HAS_IBI_DATA = 1 set. So don't rely on doing read-
> modify-write op on this register.
> Instead maintain a variable to store the sir reject mask
> and use it to set IBI_SIR_REQ_REJECT.
> 
> 
> [...]

Applied, thanks!

[1/1] i3c: dw: Fix IBI intr programming
      https://git.kernel.org/abelloni/c/76fb85b86b40

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
