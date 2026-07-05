Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D042BC43458
	for <linux-i3c@archiver.kernel.org>; Sun,  5 Jul 2026 21:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzBq/x6caiF5IS9aTXxZ2ecMytU1XqqG/k6dMxLCiKU=; b=yxp7yx+41i3V3l
	XfLtHx4Mh8zOkCz0pEeadxBbfort1T4ShmkSss8ndCWqNHJmP5Km6eI00BoVbllQBBEZmI+WFs2Oa
	KRTwe2lkefIXoI9OoXEkvhykKLDY20FH1Yl9Qz1Szs11dcCEZTBEpHOw7neKxO5p09wJbKkp+77NJ
	aSR1iAkYYY1IDejqZcljly4MhWPHtk/sRKURLJ5Xfeg+7Cj0JHCrCiwvh1sS2AerwlivWCjHHwtRx
	WWrsnEp9FzGNZn0nDxCBZi4+jmn/c6npA1KVgqnofyHcmsmFPI/HJOdLCm5glIeg7GCd+4o6Y/33d
	CLOiQzLHEcZFR+5EsVoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUOr-0000000A20x-2RwJ;
	Sun, 05 Jul 2026 21:29:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUOn-0000000A1yC-3BtQ
	for linux-i3c@lists.infradead.org;
	Sun, 05 Jul 2026 21:29:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D9B96C8EC43;
	Sun,  5 Jul 2026 21:29:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08676601A2;
	Sun,  5 Jul 2026 21:29:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E601A11BB8700;
	Sun,  5 Jul 2026 23:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783286949; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=SuVIfmSrYLDNWcGh++AU8GNwBJmF1eJewpBolZ+OX7o=;
	b=0P01a7pZPDAc8aH+TB9x9Ny2D72ovmJZK6oOx7js3rVVfwr1R8w1IP2UzKlTtL0K1a8VZS
	FQC485rBrwfxS3UAyJOCXr1OGxpM6xwocSOP3tFbBkCo9m5vjX5iBklCFkziVd+jZZigw5
	iia5+KKlNCdrq3a3I5xavDkN66X8Hy2v3CL6rLsISBRWmWB5VjoZ6TsvP2twYt+9LqxQcn
	DXCUV1w1vwtsKa6R8Wkx5CrI0g0bYFZjDZDA3aPSo8K4dMvd0devH9J3mDNx3CD71KN81e
	kbs+SvI0LzzpTqtVGm6yXujW7vWuxD+0mFd9kx2cHWsZrfKReFXJ/Ibk5pMxSA==
Date: Sun, 5 Jul 2026 23:29:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Kaixuan Li <kaixuan.li@ntu.edu.sg>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] i3c: master: svc: bound IBI payload to the requested
 max_payload_len
Message-ID: <178328692976.58266.3370861943512860784.b4-ty@b4>
References: <178227747353.2931373.15868718612134648277@maoyixie.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178227747353.2931373.15868718612134648277@maoyixie.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_142914_012665_118C3CF3 
X-CRM114-Status: UNSURE (   8.00  )
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

On Wed, 24 Jun 2026 13:04:33 +0800, Maoyi Xie wrote:
> svc_i3c_master_handle_ibi() reads the IBI payload from the RX FIFO into
> the IBI slot. The loop is bounded by the hardware FIFO size
> (SVC_I3C_FIFO_SIZE), not by the slot size.
> 
> slot->data points into the IBI pool, which i3c_generic_ibi_alloc_pool()
> sizes at max_payload_len per slot. svc_i3c_master_request_ibi() only
> rejects a max_payload_len larger than SVC_I3C_FIFO_SIZE, so a driver can
> request a smaller one. mctp-i3c requests 1. Each readsb() then copies the
> controller RXCOUNT bytes (up to 31) with no check against the slot size.
> A device that sends more bytes than the slot holds writes past
> slot->data, an out-of-bounds write into the IBI pool.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: bound IBI payload to the requested max_payload_len
      https://git.kernel.org/i3c/c/bcd0e9acbaad

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
