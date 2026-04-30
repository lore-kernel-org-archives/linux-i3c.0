Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697A3FF886F
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 10:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cI4/bHx+OBOE9gogd5ohhqw5WifZeeLicxHxEAalvVE=; b=g4wfZjrRWLvYK2
	yy6J1KfO1o/pl5YJKpKVDq081fqtfSDJ0pndSHXF7lbR80S25JeF6A/s0hQgGZfMc7wkmpccEzqIR
	TVAv+Zwh+LqP5pP4WtFz4D4J0vkJViDmHGC/3BcMx+BseR/kiDb2mxlR8xCIgL93AXQp7CKQlMp8O
	MIf4j5D4e/cvv1o+QPh0wzAgBdtHlE6A4Eqt0g1LjPvUyTRfYf4I93m5C4xR//MD6ikUuQQKfDRl+
	AzW7G03gJc3Xa3w0Rl9XasPYAbicn9dWpcrCWh9ArbZ5E6wxWV/uRmJF+FcWMBtP+c8njOxrscW03
	KQJpgAygejUqMADsZ5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOCv-000000059bx-0Ryc;
	Thu, 30 Apr 2026 10:01:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOCp-000000059a2-3E6N
	for linux-i3c@lists.infradead.org;
	Thu, 30 Apr 2026 10:01:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 72A27C5CD69;
	Thu, 30 Apr 2026 10:01:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D951A60495;
	Thu, 30 Apr 2026 10:01:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3818D107287D3;
	Thu, 30 Apr 2026 12:01:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777543267; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Mx29d0//5roTjdpUpzFvd3STJHSQjaV+dGlIiT+2YtM=;
	b=SGlxdUaeGlzElXF8za2SNxAh87TjPcyZv8KRrXkgjfPfGrTRzlTMiHL1s/Fpw5Ge5YIcAL
	8N64vwiHMsDUw8iHAkO7BWW2OxkMteuiJoihU5cLv+kEpU/7D1WXB770FpVLZwH/6Mhiyh
	+u8e9iSQvW8LpptPM/MpgNEhzU+SqrHg5UuyVc1Yi7jUaEl91tD6q2nTWvv+93HHHO2fa7
	qBXNGWblqrQkxcEig1iC82gZOp5Wo2OAPN39Mc2hxxJwcvJo9TLEAhzpf2bHy1bMFrJgND
	+rIonL6ZNnLIRXAZqQcQU9Mus98MfwFEZaZhVV+dx7CUSp3ePNMJj9AjS9jG9Q==
Date: Thu, 30 Apr 2026 12:01:04 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org,
	Stanley Chu <stanley.chuys@gmail.com>
Cc: linux-kernel@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 0/2] i3c: master: svc: Fix false SLVSTART issues on
 NPCM845
Message-ID: <177754325401.576099.1939468659093596928.b4-ty@b4>
References: <20260413005040.1211107-1-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260413005040.1211107-1-yschu@nuvoton.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_030115_950539_6DAE211D 
X-CRM114-Status: UNSURE (   6.66  )
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

On Mon, 13 Apr 2026 08:50:38 +0800, Stanley Chu wrote:
> From: Stanley Chu <yschu@nuvoton.com>
> 
> The Nuvoton NPCM845 I3C controller has a hardware quirk
> (SVC_I3C_QUIRK_FALSE_SLVSTART) where a spurious SLVSTART interrupt
> may be generated. This series addresses two separate issues related to
> this quirk:
> 
> [...]

Applied, thanks!

[1/2] i3c: master: svc: Fix missed IBI after false SLVSTART on NPCM845
      https://git.kernel.org/i3c/c/fa1d4fa118f4
[2/2] i3c: master: svc: Prevent IRQ storm from false SLVSTART on NPCM845
      https://git.kernel.org/i3c/c/1effa3adfe53

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
