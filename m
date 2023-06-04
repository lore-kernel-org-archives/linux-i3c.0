Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4FCC7EE2D
	for <linux-i3c@archiver.kernel.org>; Sun,  4 Jun 2023 22:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7TP2C1l2+hBqMmUoasQACYLAoDlf2Qs/tmrdjKNd2c=; b=f1DPknBJbgBgNH
	AaJKdjyaBWIijgIfe4VMT5huoDi6Fqu0pt9HPj9Rc5QVOybeGJ6OcHNzeNxCI+7jjYeWDjbQy7Wxh
	9zKn9Ay7cubVC7zlmi2/BqrVhU7mhtPOYv6D1DBy45EXX2IGCZ6T5X9ACqqEjJ9gEF55EoqlQ7EAM
	/drpolDY80Ta7q+hyOPeqAKtDwvdmY/UdHa3S58ky+TVjONWeje2ZHefn91ENjHQnSvvvkjC3Dfam
	2rQWY7IdKgXLG+nM7Y/vg2+bzWXBkP6hNKR7RMiaNzlAoSO4c625HTaIE/TWiqYrLEdTbW6Z2ilMz
	xUE/3SWKVwWbaM2sVDIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5waW-00DLtc-1J;
	Sun, 04 Jun 2023 22:52:40 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5waS-00DLsa-1Q
	for linux-i3c@lists.infradead.org;
	Sun, 04 Jun 2023 22:52:38 +0000
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685919148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RZRdUHlQY3oR10KG52Yo7mbzjUpNi1/wxbDtPAhI6Ag=;
	b=XS4XiBcci0oSAnwTzoiCwpjgP4I08SmevJnLnExqcf5VxEnZnlK/kGiX6KSsA6kOw53MJM
	eiJQwRpvCTfpbRG8sS+oW6R4LmQBn3d6y0g0DMPQeI9MbpDvVSdVCGJHm0GoQcjqlcXEUc
	c86m9XAb7oU9a39ZT4UYuSKItSREyqburxAgRLLNeci6IYpYOh38F9zyqryBtKzhfkl9oz
	MtAZF0XsGPnL5eq7IYVhrtAmTR7o7IA+qjghhUhJe9ENZHEqeAeK11S3eMe0a/7+EPDJD8
	qfvIsbtaVECejaUtOjEu176+7Ua61DoXxjY8v/uGG9e6xI2QVAYXDXv9Cn1ExQ==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58FE61BF204;
	Sun,  4 Jun 2023 22:52:27 +0000 (UTC)
Date: Mon, 5 Jun 2023 00:52:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	Clark Wang <xiaoning.wang@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] i3c: master: svc: fix i3c suspend/resume issue
Message-ID: <168591905817.3958179.10538086649174750608.b4-ty@bootlin.com>
References: <20230517033030.3068085-1-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230517033030.3068085-1-xiaoning.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_155236_670145_697E309D 
X-CRM114-Status: UNSURE (   6.78  )
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


On Wed, 17 May 2023 11:30:28 +0800, Clark Wang wrote:
> When system suspends, if i3c module is powered down, register
> value will lose.
> Need to save the key registers before system suspend.
> So save these registers value in runtime pm suspend, and restore them
> if these register's value is different with the saved values
> when runtime pm resume.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: fix i3c suspend/resume issue
      commit: 1c5ee2a77b1bacd4c333bebea93610aaf17977be

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
