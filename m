Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAC9CAC5BB
	for <linux-i3c@archiver.kernel.org>; Sun, 28 Sep 2025 22:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzVDDO9AaRhSdzo5nhVTjZF9fHSANOaMd+dilAs5dGk=; b=ZYyv5SUK2PYgUq
	5wkaIX5AM6Mka6pp3BT+H0r+UTy+/Clz/JpACrl8EU8PH7rElRxoF/IK6ytDuEr9hlgiy7QEuHyv8
	d018/EbY/4MQnUUYlYvLd5Id9tMd4Zx+R7U1JkYF7kxw7HS+Ve3FQ5KiSSQQuuxgIKr/YfdXUdHcl
	XPjeTuRsd/X6tesAU9tazfk4rvBmMseWwjI+HrOvz0PofKtlMKiU+cb85hOPHynYnndWh9onUULKa
	qhC67rXoOvDCoxQFh6RJZsd70eiKVl6hAmXmNyRl+pTM1/H90L30858z+GNgfT7uApXXG4GftP57a
	rDpTeXnOIwcbkMhzdQLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2zkD-00000000CTd-2LJE;
	Sun, 28 Sep 2025 22:19:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2zk9-00000000CR1-2Hyt
	for linux-i3c@lists.infradead.org;
	Sun, 28 Sep 2025 22:19:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 392DEC00DB1
	for <linux-i3c@lists.infradead.org>; Sun, 28 Sep 2025 22:19:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CC906066E;
	Sun, 28 Sep 2025 22:19:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 621D5102F182C;
	Mon, 29 Sep 2025 00:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759097972; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=VpzD/pt9+kySB/WAKqTwz6rECss/zhOyWoiCwpxEYVI=;
	b=Dg6dNamVTWtGrmmCOIEzpa0PXlOEZDcayuurVRsf2j7Vjbh4ajdt9n9VdTd/nTaKw0QfhB
	xWaaEi/lbozx/PJ9Ur6+S+KqQzDmTJ+ryh91/WILqh9gT6aoO1IM2ItHIGCvnAIcPgziFp
	PtjynRgo64DzJccLEifmyUdFxZ9gz5KtiskD4btuvBwUyS+DwUEH/Wht1MVMggByUtVaXs
	Y8GcFfj71vGGRZbwXg8JKWpfqKhshviguedrfVSMdA8fNfztl7Y/U7cvpHTOO+bHJdswUx
	7CBEyfsFxHBw0N+m8qjY8+Ze90HiDkKh+tt5AFPoV2y6IhOfbn2rRTGschk3nw==
Date: Mon, 29 Sep 2025 00:19:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jorge Marques <jorge.marques@analog.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] i3c: fix big-endian FIFO transfers
Message-ID: <175909785772.1659314.16007344807551348138.b4-ty@bootlin.com>
References: <20250924201837.3691486-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250924201837.3691486-1-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_151946_109682_8074ED02 
X-CRM114-Status: UNSURE (   8.47  )
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

On Wed, 24 Sep 2025 22:18:33 +0200, Arnd Bergmann wrote:
> Short MMIO transfers that are not a multiple of four bytes in size need
> a special case for the final bytes, however the existing implementation
> is not endian-safe and introduces an incorrect byteswap on big-endian
> kernels.
> 
> This usually does not cause problems because most systems are
> little-endian and most transfers are multiple of four bytes long, but
> still needs to be fixed to avoid the extra byteswap.
> 
> [...]

Applied, thanks!

[1/1] i3c: fix big-endian FIFO transfers
      https://git.kernel.org/i3c/c/d6ddd9beb1a5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
