Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83910C10F1A
	for <linux-i3c@archiver.kernel.org>; Tue,  7 May 2024 20:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnZ/zmAOBxe9L7Iu9FCtLYlr5tmLv6OvCtAxeWZyM8Y=; b=K5lKpp9ey/smTl
	Ni1bP3gpCoTA1z2T2D+4ecVL8cEvM0ejiPs07IINjoGdJIf5MJMDTZqvo7TEXSn8scKjnAtfsEfAw
	5WyBWFHeQo2ErkIYjHL7a5I/rQqBz7+t4TN7KMLfNBKRS2oHGiYklWh5H8kOvNQm3sPYitgj0pGdn
	bIrsk2ejnaryXa6iubCML55+10yYcFvfHT2cfdia6KhJpyqrEqhDQckSniEzf677ORVimNA2H3ipO
	O3wzj+oHR/oQ5m78KmJG7ETIg3uKSn51vgmfxxyNrhlYK4GxwMADLPjsPRIxIVLLz5+KzKxKA0pwa
	ewuAmmtfpMqGC0h0BvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4RPy-0000000Cki3-1uNc;
	Tue, 07 May 2024 20:28:06 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4RPs-0000000Ckfl-0p2z
	for linux-i3c@lists.infradead.org;
	Tue, 07 May 2024 20:28:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8372FF805;
	Tue,  7 May 2024 20:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715113675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GnYuaSYVTcxIbkjcD6lKwaRFkflKMhkDDqSPD7vAAvQ=;
	b=OuWLybSpTWH0HHcK1Ox+v0oS2lcDSwQZ8pfq62CKC2VDoMypz57Wr9S0G6UrxQZQFtaXeY
	KfEzriTwq0HJhOgrtbbrqEl66qcu76jgW7r4iky2lNkeN46FOOlK8JZCxwiomqWhsQsJn3
	ijAinSkGboLigff9z7OjmnuqRkuANElLZ4ylq4WlyNEqb98Tn/ZqwGy2QZwgYXcO/s14b+
	bzK1sODj6tlqvhi06+hk+SDzh/9SIZ/DTr9i4xsM0IdVttSsFW4q4PShlDFla/PprT9BHQ
	LAPZTbfN+woImLj/XebviOl/thEZNygDrtQiwXUzoSX6saapIjHIW30xThyRyw==
Date: Tue, 7 May 2024 22:27:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, imx@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i3c: Add comment for -EAGAIN in
 i3c_device_do_priv_xfers()
Message-ID: <171511365446.810643.1784657313942616005.b4-ty@bootlin.com>
References: <20240506164009.21375-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240506164009.21375-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_132800_623902_FD7AB399 
X-CRM114-Status: UNSURE (   7.42  )
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

On Mon, 06 May 2024 12:40:07 -0400, Frank Li wrote:
> In accordance with I3C spec ver 1.1.1 09-Jun-2021, section: 5.1.2.2.3, if
> a target requests hot join (HJ), In-Band Interrupt (IBI), or controller
> role request (CRR) during the emission of an I3C address in
> i3c_device_do_priv_xfers(), the target may win bus arbitration. In such
> cases, it is imperative to notify the I3C client driver and retry
> i3c_device_do_priv_xfers() after some delay.
> 
> [...]

Applied, thanks!

[1/3] i3c: Add comment for -EAGAIN in i3c_device_do_priv_xfers()
      https://git.kernel.org/abelloni/c/5e45614ef8ae
[2/3] i3c: master: svc: change ENXIO to EAGAIN when IBI occurs during start frame
      https://git.kernel.org/abelloni/c/75cb32046b5d
[3/3] i3c: master: svc: fix invalidate IBI type and miss call client IBI handler
      https://git.kernel.org/abelloni/c/677a7b0e3ae4

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
